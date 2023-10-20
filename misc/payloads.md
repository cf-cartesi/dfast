# Test inputs

## Advance

### withdraw

```json
{"action":"withdraw","amount":7000000000000000000}
```

### Driver management

```json
{"action":"driver_application"}
```

```json
{"action":"return_security_deposit"}
```

### Trip management

```json
{"action":"trip_request","geohash_origin":"75cmen","geohash_destination":"75cmdw","trip_commitment":"abcde12345","distance":10000,"timeout":300}
```

```json
{"action":"offer_trip","trip_id":"5bf8f843-ddf8-4e9f-b343-57a917a55f23","geohash":"75cmdwu"}
```

```json
{"action":"accept_offer","driver":"0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266"}
```

```json
{"action":"cancel_offer"}
```

```json
{"action":"cancel_request"}
```

```json
{"action":"timeout_request","trip_id":"440622ac-5050-4dad-8ad9-50fbb5947dd2"}
```

Finish trip:

```json
{"action":"finish_trip","trip_id":"93126ce9-1741-4af2-a0eb-4ad7a6975f21","final_distance":10000,"start_timestamp":0,"end_timestamp":800,"trip_score_rider":10000,"peer_signature":"123abc"}
```

Omiting peer_signature should lead trip to be quarantined. 

```json
{"action":"finish_trip","trip_id":"5bf8f843-ddf8-4e9f-b343-57a917a55f23","final_distance":11000,"start_timestamp":0,"end_timestamp":800,"trip_score_rider":10000}
```

In that case, the peer should send finish_trip too. If it contains the peer signature, it finishes the trip, Instead, if final_distance, start_timestamp, and end_timestamp are equal, trip ends as normal, otherwise it moves to dispute which will only be resolved by the DAO with finish_trip_dispute.

```json
{"action":"finish_trip_dispute","trip_id":"388d6c3b-11db-4d4b-b2a9-0b01f73cd87c","final_distance":10000,"start_timestamp":0,"end_timestamp":800,"score":10000}
```

If trip is quarantined it can b

```json
{"action":"timeout_trip","trip_id":"440622ac-5050-4dad-8ad9-50fbb5947dd2"}
```


## Inspect

Get balance

```
balance/0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
```

Get trip info

```
trip/93126ce9-1741-4af2-a0eb-4ad7a6975f21
```

```
trip_by_driver_offer/0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
```

```
trip_by_driver/0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
```

```
trip_by_rider/0x70997970C51812dc3A010C7d01b50e0d17dc79C8
```

```
trip_in_quarantine/6a95ce51-2a8e-416e-ac3a-03f47e8cbebc
```

```
trip_by_quarantined/0x70997970C51812dc3A010C7d01b50e0d17dc79C8
```

```
trip_in_dispute/5bf8f843-ddf8-4e9f-b343-57a917a55f23
``

Match trips

```
match_trips/75cmdwu?ts=1
```

Route request

```
route/-43.108994,-22.905805;-43.1257010981136,-22.90169699370868
```