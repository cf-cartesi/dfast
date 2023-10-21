
use dep::std;

fn main(
    priv_key : Field, 
    secret: Field, 
    reputation: pub u32,
    n_trips: pub u32,
    score: pub u32,
    commitment: pub Field
)  -> pub [Field;2] {
    // TODO: hide reputation and n trips
    //   prove signature over them (allow peer pk public)
    //   additionally, signature should be over shared secret 
    //   also public is the driver pk, if eq pk of priv key include a 2nd secret
    //     it would allow to reuse the circuit for rider proving hidden reputation
    //     see if it is better to have 2 circuits instead

    // calculate reputation
    assert(reputation <= 10000);
    let mut nt = n_trips;
    if n_trips > 99 {
        nt = 99;
    }
    if n_trips < 1 {
        nt = 1;
    }
    let mut rep = (nt * reputation + score) / (nt+1);
    if rep > 10000 {
        rep = 10000;
    }
    std::println(rep);

    // get pub key from priv
    let pubkey = std::scalar_mul::fixed_base(priv_key);
    let pubkey_x = pubkey[0];
    let pubkey_y = pubkey[1];

    // calculate commitment
    let calculated_commitment = std::hash::pedersen([pubkey_x, pubkey_y, secret,rep as Field]);
    std::println(calculated_commitment);

    // assert commitment
    assert(calculated_commitment[0] == commitment);
    [rep as Field,calculated_commitment[0]]
}

#[test]
fn test_main() {
    let res = main(
        0x000000000000000000000000000000000000000000000000000000616c696365,
        0x1929ea3ab8d9106a899386883d9428f8256cfedb3c4f6b66bf4aa4d28a79988f,
        7000,
        20,
        8000,
        0x15aa688980bb7b08bce140fb46ddac716933e0f4a79062a5fb4b804c4d125e3c
    );
    std::println(res);
}
