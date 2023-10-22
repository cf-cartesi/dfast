# dfast
A Decentralized Fair Shared Transportation system. Ride share without a middle-man!

## Overall Idea

The rideshare industry is huge, expected to reach over 200 billion dollars by 2030 [source](https://finance.yahoo.com/news/ride-sharing-market-size-hit-151500076.html)

Ride share applications are part of our lives and a major improvement over the taxi monopoly previously established in many places of the world, but not everything is rainbows and sunshine:

- Rides are getting much more expensive around the world as the the ride-share matching companies are increasing fares a lot

- Though rides are getting more expensive, drivers are extremely frustrated as the cut for the ride share companies are getting constantly higher

- Drives are often banned from services without transparency and right for defense, cutting them sometimes from their only source of income

## Privacy

### User Location Privacy

### Reputation Exporter

While the system avoids revealling information about the users' locations, the system keeps the data about current users balance. While the rider is not required to keep the same address, the drivers have to do a security deposit beforehand and the reputation is maitained inside the system. Therefore, the reputation exporter allows drivers to change their address and keep their previous reputation score and number of accumulated trips.

To use the reputation exporter (compile, prove, and verify the programs) you should install [nargo cli](https://noir-lang.org/)

#### Reputation Verifier

The reputation verifier is responsible to check whether the commitment of a reputation and number of trips is indeed based on the driver's actual attributes. As the commitment includes secret information, we use zero-knowledge to generate proofs of correct computation without disclosing the secret information. 

To display the information of the current circuits 

```shell
cd cartesi_backend/reputation_verifier
nargo info 
```

+---------------------+------------------------+--------------+----------------------+
| Package             | Language               | ACIR Opcodes | Backend Circuit Size |
+---------------------+------------------------+--------------+----------------------+
| reputation_verifier | PLONKCSat { width: 3 } | 139          | 10765                |
+---------------------+------------------------+--------------+----------------------+

You can generate proofs with

```shell
cd cartesi_backend/reputation_verifier
nargo prove
```

and verify the proofs with

```shell
cd cartesi_backend/reputation_verifier
nargo verify
```

While the proving occurs on a client interface, the proof verifications are executed within the dapp backend, so it accepts the commitment and submit to the merkle tree.

#### Reputation Commitment Verifier

The reputation commitment verifier is responsible to validate that for a given reputation and number of trips, a hash valua is associated with a previous submitted leaf. As the commitment includes secret information, we use zero-knowledge to generate proofs of correct computation without disclosing the secret information. 

To display the information of the current circuits 

```shell
cd cartesi_backend/reputation_commitment_verifier
nargo info 
```

+--------------------------------+------------------------+--------------+----------------------+
| Package                        | Language               | ACIR Opcodes | Backend Circuit Size |
+--------------------------------+------------------------+--------------+----------------------+
| reputation_commitment_verifier | PLONKCSat { width: 3 } | 6211         | 85138                |
+--------------------------------+------------------------+--------------+----------------------+

Similarly as the reputation verifier, you can generate proofs with

```shell
cd cartesi_backend/reputation_commitment_verifier
nargo prove
```

and verify the proofs with

```shell
cd cartesi_backend/reputation_commitment_verifier
nargo verify
```

Once again, proofs are generated on the client, and verifications occur within the dapp backend. In this case, the verification checks if the proof confirms that the user withholds a secret which combined with the reputation generated a commitment which was submitted to the merkle tree.

### Future Work

The current reputation system allows any reputation up to 10000. A driver exporting his reputation and number of trips could give sufficient knowledge to associate the new driver address with the old one. With that in mind the reputation could be quantized. Also, the reputation could be pulverized into reputation units to make it harder to distinguish one driver reputation from another.

The current payment system allows anyone to check the current balance on any user. Similarly to the reputation system, the assets inside the system could be quantized to anonymize the users current balance, also allowing users to change wallets without express transfering the assets. To provide even more security and avoid certain misbehaviors, the payment system would include two different tokens, one for payments which would be converted to receipts at the end of the trip, and only receipts would allow asset withdrawals.

