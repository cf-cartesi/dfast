use dep::std;

fn main(
    randomness : Field, 
    nullifier : Field, 
    commitment : Field,
    index : Field,
    merkle_path : [Field; 3],
    merkle_root : pub Field, 
    nullifierHash : pub Field
)  -> pub Field {
    // calculate commitment
    let calculated_commitment = std::hash::pedersen([randomness, nullifier]);
    assert(commitment == calculated_commitment[0]);
    std::println(calculated_commitment);

    // Compute nullifier
    let calculated_nullifier = std::hash::pedersen([nullifier]);
    assert(nullifierHash == calculated_nullifier[0]);
    std::println(calculated_nullifier);

    let calculated_root = std::merkle::compute_merkle_root(calculated_commitment[0], index, merkle_path);
    assert(calculated_root == merkle_root);
    std::println(calculated_root);

    calculated_root
}

#[test]
fn test_main() {
    let res = main(
        0x000000000000000000000000000000000000000000000000000000616c696365,
        0x1929ea3ab8d9106a899386883d9428f8256cfedb3c4f6b66bf4aa4d28a79988f,
        0x29971efd8130dcfe211cb439632204e5356fc35b9cc693f63af05e1b189f4a73,
        1,
        [
            0x1e61bdae0f027b1b2159e1f9d3f8d00fa668a952dddd822fda80dc745d6f65cc,
            0x0e4223f3925f98934393c74975142bd73079ab0621f4ee133cee050a3c194f1a,
            0x2fd7bb412155bf8693a3bd2a3e7581a679c95c68a052f835dddca85fa1569a40
        ],
        0x095826d5ce82ab5ee4442590b73e272714bac8ab5b1d6439f185016802688f3f,
        0x1797522b58f30682ab2aff07a919a34dcf584987c0f9a098c86becb689bd1384
    );
    std::println(res);
}
