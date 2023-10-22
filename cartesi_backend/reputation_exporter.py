from pydantic import BaseModel
from pymerkle import InmemoryTree
import subprocess
from typing import List

class ExportReputationInput(BaseModel):
    action: str = "export_reputation"
    proof: str
    commitment: List[str]
    n_trips: List[str]
    reputation: List[str]

class ImportReputationInput(BaseModel):
    action: str = "import_reputation"
    proof: str
    n_trips: List[str]
    reputation: List[str]
    nullifier_hash: List[str]
    root: List[str]
    tree_index: int

class ReputationExporter:
    def __init__(self):
        self.trees: dict[int,InmemoryTree] = {}
        self.nullifiers: list[str] = {}
        self.commitment_index: dict[str,int] = {}
        self.commitment_tree: dict[str,int] = {}
        self.max_heigh = 10 # 
        self.max_capacity = 2 ** (self.max_heigh-1)
        self.current_tree_index = 0
        tree = self.get_tree(0)
        for commitment in [b'a',b'b',b'c',b'd']:
            ind = tree.append_entry(commitment)
            self.commitment_index[commitment] = ind
            self.commitment_tree[commitment] = 0
    
    def get_tree(self, index):
        tree = self.trees.get(index)
        if tree is None:
            self.trees[index] = InmemoryTree(algorithm='sha256',disable_security=True)
            tree = self.trees[index]
        return tree

    def get_available_tree_index(self):
        tree = self.get_tree(self.current_tree_index)
        if tree.get_size() >= self.max_capacity:
            self.current_tree_index += 1
        return self.current_tree_index

    def export_info(self, driver, input_params: ExportReputationInput):
        # TODO
        # Compare public info with driver info
        #   reputation, n trips
        
        # verify commitment proof
        if input_params.proof is None:
            raise Exception("invalid proof")
        if input_params.commitment is None or len(input_params.commitment) != 32:
            raise Exception("invalid commitment witness")
        if input_params.reputation is None or len(input_params.reputation) != 2:
            raise Exception("invalid reputation witness")
        if input_params.n_trips is None or len(input_params.n_trips) != 2:
            raise Exception("invalid number of trips witness")

        reputation_hex = "0x"
        for r in input_params.reputation: reputation_hex += r[-2:]
        if driver.reputation != int(reputation_hex,16):
            raise Exception("Reputation witness does not match driver reputation")

        n_trips_hex = "0x"
        for n in input_params.n_trips: n_trips_hex += n[-2:]
        if driver.n_trips != int(n_trips_hex,16):
            raise Exception("Number of trips witness does not match driver number of trips")

        proof_file = "proofs/reputation_verifier.proof"
        with open(f"reputation_verifier/{proof_file}", 'w') as f:
            f.write(input_params.proof)

        verifier_file = "Verifier.toml"
        with open(f"reputation_verifier/{verifier_file}", 'w') as f:
            f.write(f"commitment = {input_params.commitment}\n")
            f.write(f"n_trips = {input_params.n_trips}\n")
            f.write(f"reputation = {input_params.reputation}\n")

        verifier_file = "Verifier.toml"
        p = subprocess.Popen(f"cd reputation_verifier && nargo verify -v {verifier_file}",shell=subprocess.PIPE,stderr=subprocess.PIPE)
        if p.returncode != 0:
            raise Exception("invalid proof")

        commitment_hex = "0x"
        for c in input_params.commitment: commitment_hex += c[-2:]
        commitment = bytes.fromhex(commitment_hex[2:])

        # push commitment to merkle tree
        tree_index = self.get_available_tree_index()
        tree = self.get_tree(tree_index)
        index = tree.append_entry(commitment)
        self.commitment_index[commitment] = index
        self.commitment_tree[commitment] = tree_index

        # invalidating driver on the main loop
        return commitment_hex

    def import_info(self, input_params: ImportReputationInput):
        # check nullifier

        # verify commitment proof
        if input_params.proof is None:
            raise Exception("invalid proof")
        if input_params.nullifier_hash is None or len(input_params.nullifier_hash) != 32:
            raise Exception("invalid nullifier witness")
        if input_params.root is None or len(input_params.root) != 32:
            raise Exception("invalid root witness")
        if input_params.reputation is None or len(input_params.reputation) != 2:
            raise Exception("invalid reputation witness")
        if input_params.n_trips is None or len(input_params.n_trips) != 2:
            raise Exception("invalid number of trips witness")

        nullifier = "0x"
        for n in input_params.nullifier_hash: nullifier += n[-2:]

        if nullifier in self.nullifiers:
            raise Exception("invalid nullifier")

        reputation_hex = "0x"
        for r in input_params.reputation: reputation_hex += r[-2:]
        if driver.reputation != int(reputation_hex,16):
            raise Exception("Reputation witness does not match driver reputation")

        n_trips_hex = "0x"
        for n in input_params.n_trips: n_trips_hex += n[-2:]
        if driver.n_trips != int(n_trips_hex,16):
            raise Exception("Number of trips witness does not match driver number of trips")

        proof_file = "proofs/reputation_verifier.proof"
        with open(f"reputation_verifier/{proof_file}", 'w') as f:
            f.write(input_params.proof)

        verifier_file = "Verifier.toml"
        with open(f"reputation_verifier/{verifier_file}", 'w') as f:
            f.write(f"nullifier_hash = {input_params.nullifier_hash}\n")
            f.write(f"root = {input_params.root}\n")
            f.write(f"n_trips = {input_params.n_trips}\n")
            f.write(f"reputation = {input_params.reputation}\n")

        # verify commitment is in tree proof
        verifier_file = "Verifier.toml"
        p = subprocess.Popen(f"cd reputation_commitment_verifier && nargo verify -v {verifier_file}",shell=subprocess.PIPE,stderr=subprocess.PIPE)
        if p.returncode != 0:
            raise Exception("invalid proof")

        # store nullifier
        self.nullifiers.append(nullifier)

        # activate new driver  on the main loop
        return [reputation, n_trips]


    def get_merkle_info(self, commitment_hex):
        commitment = bytes.fromhex(commitment_hex[2:])

        tree_index = self.commitment_tree.get(commitment)
        print(self.commitment_tree)
        print(self.commitment_index)
        if tree_index is None:
            raise Exception("invalid tree")
        tree = self.trees.get(tree_index)
        if tree is None:
            raise Exception("invalid tree")
        index = self.commitment_index.get(commitment)
        if index is None:
            raise Exception("invalid commitment")
        proof = tree.prove_inclusion(index)
        pl = [j for i in proof.path for j in i]
        path = pl + [0 for i in range(len(pl),32 * self.max_heigh)]
        rule = proof.rule + [0 for i in range(len(proof.rule),self.max_heigh)]
        root = [i for i in tree.root.digest]
        return {"tree_index": tree_index, "path": path, "rule": rule, "heigh": len(proof.path), "root": root}
