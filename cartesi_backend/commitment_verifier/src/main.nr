use dep::std;

fn main(
    priv_key : Field, 
    secret: Field, 
    commitment: Field,
    index : Field,
    merkle_path : [Field; 3],
    merkle_root : pub Field, 
    nullifier: pub Field
)  -> pub [Field;3] {
    // get pub key from priv
    let pubkey = std::scalar_mul::fixed_base(priv_key);
    let pubkey_x = pubkey[0];
    let pubkey_y = pubkey[1];

    // calculate commitment
    let calculated_commitment = std::hash::pedersen([pubkey_x, pubkey_y, secret]);
    assert(commitment == calculated_commitment[0]);
    std::println(calculated_commitment);

    // Compute nullifier
    let calculated_nullifier = std::hash::pedersen([calculated_commitment[0], index, priv_key]);
    assert(nullifier == calculated_nullifier[0]);
    std::println(calculated_nullifier);

    let calculated_root = std::merkle::compute_merkle_root(calculated_commitment[0], index, merkle_path);
    assert(calculated_root == merkle_root);
    std::println(calculated_root);

    [calculated_commitment[0],calculated_nullifier[0],calculated_root]
}

#[test]
fn test_main() {
    let res = main(
        0x000000000000000000000000000000000000000000000000000000616c696365,
        0x1929ea3ab8d9106a899386883d9428f8256cfedb3c4f6b66bf4aa4d28a79988f,
        0x122a8a317d8ea65a2eb8a54aae0a6aa46bb4e9ac9edafca4463be89aeda9d926,
        1,
        [
            0x1e61bdae0f027b1b2159e1f9d3f8d00fa668a952dddd822fda80dc745d6f65cc,
            0x0e4223f3925f98934393c74975142bd73079ab0621f4ee133cee050a3c194f1a,
            0x2fd7bb412155bf8693a3bd2a3e7581a679c95c68a052f835dddca85fa1569a40
        ],
        0x122fb9db4a732a371f61d4173f2f2bc24e458d0232b7b6048613707dd4c83619,
        0x1c81c9fae762bdd70e3f4e6d21f3084ddce27f2da668b7b44da5270d619cb457
    );
    std::println(res);
}
