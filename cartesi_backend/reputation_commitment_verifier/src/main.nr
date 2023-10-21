
use dep::std;

fn main(
    priv_key : Field, 
    secret: Field, 
    index : Field,
    merkle_path : [Field; 3],
    merkle_root : pub Field, 
    reputation: pub u32,
    nullifier: pub Field
)  -> pub [Field;3] {
    assert(reputation <= 10000);

    // get pub key from priv
    let pubkey = std::scalar_mul::fixed_base(priv_key);
    let pubkey_x = pubkey[0];
    let pubkey_y = pubkey[1];

    // calculate commitment
    let calculated_commitment = std::hash::pedersen([pubkey_x, pubkey_y, secret,reputation as Field]);
    std::println(calculated_commitment);

    // Compute nullifier
    let calculated_nullifier = std::hash::pedersen([calculated_commitment[0], index, priv_key]);
    assert(nullifier == calculated_nullifier[0]);
    std::println(calculated_nullifier);

    let calculated_root = std::merkle::compute_merkle_root(calculated_commitment[0], index, merkle_path);
    assert(calculated_root == merkle_root);
    std::println(calculated_root);

    [reputation as Field,calculated_nullifier[0],calculated_root]
}

#[test]
fn test_main() {
    let res = main(
        0x000000000000000000000000000000000000000000000000000000616c696365,
        0x1929ea3ab8d9106a899386883d9428f8256cfedb3c4f6b66bf4aa4d28a79988f,
        1,
        [
            0x1e61bdae0f027b1b2159e1f9d3f8d00fa668a952dddd822fda80dc745d6f65cc,
            0x0e4223f3925f98934393c74975142bd73079ab0621f4ee133cee050a3c194f1a,
            0x2fd7bb412155bf8693a3bd2a3e7581a679c95c68a052f835dddca85fa1569a40
        ],
        0x2d476a793c6a4d72754192de1906212a33fd291c636fa7694d50d1df9c3a82db,
        7150,
        0x1a4235cbac25998cb3853b7268b1b3020f699392444c4b03b57bc2450f55d08f
    );
    std::println(res);
}
