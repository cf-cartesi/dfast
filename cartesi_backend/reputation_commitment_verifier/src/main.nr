use dep::std;

// Version 1: Pedersen (Future work)
// fn main(
//     priv_key : Field, 
//     secret: Field, 
//     index : Field,
//     merkle_path : [Field; 3],
//     merkle_root : pub Field, 
//     reputation: pub u32,
//     nullifier: pub Field
// )  -> pub [Field;3] {
//     assert(reputation <= 10000);

//     // get pub key from priv
//     let pubkey = std::scalar_mul::fixed_base(priv_key);
//     let pubkey_x = pubkey[0];
//     let pubkey_y = pubkey[1];

//     // calculate commitment
//     let calculated_commitment = std::hash::pedersen([pubkey_x, pubkey_y, secret,reputation as Field]);
//     std::println(calculated_commitment);

//     // Compute nullifier
//     let calculated_nullifier = std::hash::pedersen([calculated_commitment[0], index, priv_key]);
//     assert(nullifier == calculated_nullifier[0]);
//     std::println(calculated_nullifier);

//     let calculated_root = std::merkle::compute_merkle_root(calculated_commitment[0], index, merkle_path);
//     assert(calculated_root == merkle_root);
//     std::println(calculated_root);

//     [reputation as Field,calculated_nullifier[0],calculated_root]
// }


// Version 2: SHA merkle tree
fn compute_merkle_sha_root(hash_path: [u8;320], path_heigh: Field, rule: [u1;10]) -> [u8;32] {
    
    let mut current: [u8;32] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    let mut next_path: [u8;32] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    let mut payload: [u8;64] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    let mut h_ind: u32 = 0;

    for i in 0..10 {
        if i < (path_heigh as u32) {
            for j in 0..32 {
                next_path[j] = hash_path[h_ind];
                h_ind = h_ind + 1;
            }
            if i >= 1 {
                let path_bit = rule[i] as bool;
                let (hash_left, hash_right) = if path_bit {
                    (next_path, current)
                } else {
                    (current, next_path)
                };
                for k in 0..32 {
                    payload[k] = hash_left[k];
                }
                for k in 0..32 {
                    payload[k+32] = hash_right[k];
                }
                current = std::hash::sha256(payload);
            } else {
                current = next_path;
            }
        }
    };
    current
}

fn main(
    randomness: [u8;32],
    nullifier: [u8;32],
    reputation: pub [u8;2],
    n_trips: pub [u8;2],
    path_heigh: Field,
    rule: [u1;10],
    hash_path: [u8;320],
    root: pub [u8;32],
    nullifier_hash: pub [u8;32]
) -> pub [u8;32] {

    let mut payload: [u8] = [];
    let mut payload_nullifier: [u8] = [];
    for i in randomness {
        payload = payload.push_back(i);
    }
    for i in nullifier {
        payload = payload.push_back(i);
        payload_nullifier = payload_nullifier.push_back(i);
    }
    for i in reputation {
        payload = payload.push_back(i);
        payload_nullifier = payload_nullifier.push_back(i);
    }
    for i in n_trips {
        payload = payload.push_back(i);
        payload_nullifier = payload_nullifier.push_back(i);
    }

    let calculated_nullifier = std::hash::sha256(payload_nullifier);
    assert(calculated_nullifier == nullifier_hash);

    let commitment = std::hash::sha256(payload);
    let hashed_commitment = std::hash::sha256(commitment);
    let mut p0: [u8;32] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    for i in 0..32 {
        p0[i] = hash_path[i];
    }
    assert(hashed_commitment == p0);

    let calculated_root = compute_merkle_sha_root(hash_path,path_heigh,rule);
    assert(calculated_root == root);
    calculated_nullifier
}

#[test]
fn test_main() {
    // let res = main(
    //     0x000000000000000000000000000000000000000000000000000000616c696365,
    //     0x1929ea3ab8d9106a899386883d9428f8256cfedb3c4f6b66bf4aa4d28a79988f,
    //     1,
    //     [
    //         0x1e61bdae0f027b1b2159e1f9d3f8d00fa668a952dddd822fda80dc745d6f65cc,
    //         0x0e4223f3925f98934393c74975142bd73079ab0621f4ee133cee050a3c194f1a,
    //         0x2fd7bb412155bf8693a3bd2a3e7581a679c95c68a052f835dddca85fa1569a40
    //     ],
    //     0x2d476a793c6a4d72754192de1906212a33fd291c636fa7694d50d1df9c3a82db,
    //     7150,
    //     0x1a4235cbac25998cb3853b7268b1b3020f699392444c4b03b57bc2450f55d08f
    // );

    let res = main(
        // randomness
        [89, 148, 71, 26, 187, 1, 17, 42, 252, 193, 129, 89, 246, 204, 116, 180, 245, 17, 185, 152, 6, 218, 89, 179, 202, 245, 169, 193, 115, 202, 207, 197],
        // nullifier
        [32, 243, 118, 88, 128, 165, 194, 105, 183, 71, 225, 233, 6, 5, 74, 75, 74, 58, 153, 18, 89, 241, 225, 107, 93, 222, 71, 66, 206, 194, 49, 154],
        // reputation
        [27, 88],
        // n_trips
        [0, 100],
        // path_heigh
        4,
        // rule
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        // hash_path
        [144, 172, 231, 161, 211, 197, 88, 229, 25, 44, 188, 15, 66, 131, 24, 231, 118, 205, 110, 227, 244, 11, 109, 197, 30, 134, 89, 64, 118, 160, 187, 226, 62, 35, 232, 22, 0, 57, 89, 74, 51, 137, 79, 101, 100, 225, 177, 52, 139, 189, 122, 0, 136, 212, 44, 74, 203, 115, 238, 174, 213, 156, 0, 157, 191, 254, 11, 52, 219, 161, 107, 198, 250, 193, 124, 8, 186, 197, 93, 103, 108, 222, 213, 164, 173, 228, 31, 226, 201, 146, 74, 93, 222, 143, 62, 91, 63, 121, 187, 123, 67, 91, 5, 50, 22, 81, 218, 239, 211, 116, 205, 198, 129, 220, 6, 250, 166, 94, 55, 78, 56, 51, 123, 136, 202, 4, 109, 234, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        // root
        [201, 207, 227, 178, 178, 152, 39, 221, 15, 120, 18, 108, 52, 117, 41, 219, 188, 111, 37, 140, 33, 138, 101, 231, 113, 110, 13, 15, 230, 132, 205, 196],
        // nullifier_hash
        [0x55, 0xb7, 0xf7, 0x82, 0x0f, 0x38, 0xd3, 0xfd, 0x34, 0x2e, 0x71, 0x89, 0xa6, 0x5f, 0xc4, 0x4d, 0xe1, 0x53, 0x2e, 0x34, 0x78, 0x90, 0x56, 0xc8, 0x05, 0xf7, 0xbb, 0x3d, 0xd4, 0x1d, 0x71, 0xd4]
    );

    std::println(res);
}
