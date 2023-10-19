# Test inputs

## Advance

withdraw

```json
{"action":"withdraw","amount":7000000000000000000}
```

Driver management

```json
{"action":"driver_application"}
```

```json
{"action":"return_security_deposit"}
```

Trip management

```json
{"action":"trip_request","geohash_origin":"75cmen","geohash_destination":"75cmdw","trip_commitment":"abcde12345","distance":10000,"timeout":300}
```


## Inspect

Get balance

```
balance/0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
```

Get trip info

```
trip/6a95ce51-2a8e-416e-ac3a-03f47e8cbebc
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

Match trips

```
match_trips/75cme
```

Route request

```
route/-43.108994,-22.905805;-43.1257010981136,-22.90169699370868
```