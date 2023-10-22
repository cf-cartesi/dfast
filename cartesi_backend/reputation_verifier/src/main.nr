
use dep::std;

// Version 1, calculate reputation (Future work)
// fn main(
//     priv_key : Field, 
//     secret: Field, 
//     reputation: pub u32,
//     n_trips: pub u32,
//     score: pub u32,
//     commitment: pub Field
// )  -> pub [Field;2] {
//     // TODO: hide reputation and n trips
//     //   prove signature over them (allow peer pk public)
//     //   additionally, signature should be over shared secret 
//     //   also public is the driver pk, if eq pk of priv key include a 2nd secret
//     //     it would allow to reuse the circuit for rider proving hidden reputation
//     //     see if it is better to have 2 circuits instead
//     //       Rider would also prove ecies reputation amd shared secret encryption

//     // calculate reputation
//     assert(reputation <= 10000);
//     let mut nt = n_trips;
//     if n_trips > 99 {
//         nt = 99;
//     }
//     if n_trips < 1 {
//         nt = 1;
//     }
//     let mut rep = (nt * reputation + score) / (nt+1);
//     if rep > 10000 {
//         rep = 10000;
//     }
//     std::println(rep);

//     // get pub key from priv
//     let pubkey = std::scalar_mul::fixed_base(priv_key);
//     let pubkey_x = pubkey[0];
//     let pubkey_y = pubkey[1];

//     // calculate commitment
//     let calculated_commitment = std::hash::pedersen([pubkey_x, pubkey_y, secret,rep as Field]);
//     std::println(calculated_commitment);

//     // assert commitment
//     assert(calculated_commitment[0] == commitment);
//     [rep as Field,calculated_commitment[0]]
// }


// Version 2: Simple proof of reputation commitment
fn main(
    randomness: [u8;32],
    nullifier: [u8;32],
    reputation: pub [u8;2],
    n_trips: pub [u8;2],
    commitment: pub [u8;32]
)  -> pub [u8;32] {

    let mut payload: [u8] = [];
    for i in randomness {
        payload = payload.push_back(i);
    }
    for i in nullifier {
        payload = payload.push_back(i);
    }
    for i in reputation {
        payload = payload.push_back(i);
    }
    for i in n_trips {
        payload = payload.push_back(i);
    }

    let hash = std::hash::sha256(payload);
    assert(commitment == hash);
    hash
}

#[test]
fn test_main() {
    // let res = main(
    //     0x000000000000000000000000000000000000000000000000000000616c696365,
    //     0x1929ea3ab8d9106a899386883d9428f8256cfedb3c4f6b66bf4aa4d28a79988f,
    //     7000,
    //     20,
    //     8000,
    //     0x15aa688980bb7b08bce140fb46ddac716933e0f4a79062a5fb4b804c4d125e3c
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
        // commitment
        [0x7b, 0xcc, 0x06, 0xf5, 0x35, 0xc4, 0xef, 0x5f, 0x29, 0x1e, 0xec, 0xb4, 0x56, 0x59, 0xa4, 0x0a, 0x50, 0x6a, 0xb4, 0xa6, 0x6a, 0x45, 0xb3, 0xb0, 0xa8, 0x35, 0x2d, 0x5b, 0xa0, 0x7e, 0x7e, 0x23]
    );

    std::println(res);
}
