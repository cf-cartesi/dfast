from pydantic import BaseModel
from pymerkle import InmemoryTree
import subprocess

class ExportReputationInput(BaseModel):
    action: str = "export_reputation"
    proof: str

class ImportReputationInput(BaseModel):
    action: str = "import_reputation"
    proof: str

class ReputationExporter:
    def __init__(self):
        self.trees: dict[int,InmemoryTree] = {}
        self.nullifiers: list[str] = {}
        self.commitment_index: dict[str,int] = {}
        self.commitment_tree: dict[str,int] = {}
        self.max_heigh = 10 # 
        self.max_capacity = 2 ** (self.max_heigh-1)
        self.current_tree_index = 0
    
    def get_available_tree_index(self):
        tree = self.trees.get(self.current_tree_index)
        if tree is not None:
            if tree.get_size >= self.max_capacity:
                self.current_tree_index += 1
        return self.current_tree_index

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

    def export_info(self, driver, public_info, proof, commitment):
        # TODO
        # Compare public info with driver info
        #   reputation, n trips
        
        # verify commitment proof
        verifier_file = "Verifier.toml"
        p = subprocess.Popen(f"cd reputation_verifier && nargo verify -v {verifier_file}",shell=subprocess.PIPE,stderr=subprocess.PIPE)
        if p.returncode != 1:
            raise Exception("invalid proof")

        # push commitment to merkle tree
        tree_index = self.get_available_tree_index()
        tree = self.get_tree(tree_index)
        index = tree.append_entry(commitment)
        self.commitment_index[commitment] = index
        self.commitment_tree[commitment] = tree_index

        # invalidate driver

    def import_info(self, public_info, proof, nullifier):
        # check nullifier
        if nullifier in self.nullifiers:
            raise Exception("invalid nullifier")

        # verify commitment is in tree proof
        verifier_file = "Verifier.toml"
        p = subprocess.Popen(f"cd reputation_commitment_verifier && nargo verify -v {verifier_file}",shell=subprocess.PIPE,stderr=subprocess.PIPE)
        if p.returncode != 1:
            raise Exception("invalid proof")

        # store nullifier
        self.nullifiers.append(nullifier)

        # activate new driver

    def get_merkle_info(self, commitment):
        # verify commitment is in tree proof
        # activate new driver
        tree_index = self.commitment_tree.get(commitment)
        if tree_index is None:
            raise Exception("invalid tree")
        tree = self.trees.get(tree_index)
        if tree is None:
            raise Exception("invalid tree")
        index = self.commitment_index.get(commitment)
        if index is None:
            raise Exception("invalid commitment")
        proof = self.tree.prove_inclusion(index)
        pl = [j for i in proof.path for j in i]
        path = pl + [0 for i in range(len(pl),32 * self.max_heigh)]
        rule = proof.rule + [0 for i in range(len(proof.rule),self.max_heigh)]
        root = [i for i in tree.root]
        return {"path": path, "rule": rule, "heigh": len(proof.path), "root": root}
