import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:driver/shared/cartesi_rollups_outputs.dart';

import '../../shared/app_conf.dart';

//{
  // "id": "2a40ffa6-a29a-4711-a045-70642d1dc7a2",
  // "request_timestamp": 1697873235,
  // "start_timestamp": null,
  // "end_timestamp": null,
  // "confirmation_timestamp":null,
  // "quarantine_timestamp": null,
  // "quarantine_timeout": null,
  // "dispute_timestamp": null,
  // "finish_timestamp": null,
  // "rider": "0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266",
  // "locked_assets": 23676000000000000000,
  // "geohash_origin": "75cm8u",
  // "geohash_destination": "75cm3j",
  // "trip_commitment": "46cb4136c2594b026c7aa0b97d1031585efabf81d00deefb5aaf9a12ada986b6",
  // "distance": 7892,
  // "timeout": 1697873535,
  // "offers": {},
  // "accepted_offer": null,
  // "end_claims": {},
  // "status": "open"
// }

class TripInfo {
  final String id;
  final int requestTimestamp;
  final int? startTimestamp;
  final int? endTimestamp;
  final int? confirmationTimestamp;
  final int? quarantineTimestamp;
  final int? quarantineTimeout;
  final int? disputeTimestamp;
  final int? finishTimestamp;
  final String rider;
  final double lockedAssets;
  final String geohashOrigin;
  final String geohashDestination;
  final String tripCommitment;
  final int distance;
  final Map<String, TripOfferInfo> offers;
  final dynamic? acceptedOffer;
  final Map<String, dynamic> endClaims;
  final String status;

  TripInfo(
      this.id, this.requestTimestamp, this.startTimestamp,
      this.endTimestamp, this.confirmationTimestamp, this.quarantineTimestamp,
      this.quarantineTimeout, this.disputeTimestamp, this.finishTimestamp,
      this.rider, this.lockedAssets, this.geohashOrigin,
      this.geohashDestination, this.tripCommitment, this.distance,
      this.offers, this.acceptedOffer, this.endClaims, this.status);

  TripInfo.fromJson(Map<String, dynamic> json):
        id = json['id'],
        requestTimestamp = json['request_timestamp'],
        startTimestamp = json['start_timestamp'],
        endTimestamp = json['end_timestamp'],
        confirmationTimestamp = json['confirmation_timestamp'],
        quarantineTimestamp = json['quarantine_timestamp'],
        quarantineTimeout = json['quarantine_timestamp'],
        disputeTimestamp = json['dispute_timestamp'],
        finishTimestamp = json['finish_timestamp'],
        rider = json['rider'],
        lockedAssets = json['locked_assets'],
        geohashOrigin = json['geohash_origin'],
        geohashDestination = json['geohash_destination'],
        tripCommitment = json['trip_commitment'],
        distance = json['distance'],
        offers = (json["offers"] as Map<String, dynamic>).map(
                (key, value) => MapEntry(key, TripOfferInfo.fromJson(value))),//json['offers'],
        acceptedOffer = json['accepted_offer'],
        endClaims = json['end_claims'],
        status = json['status'];
}

class Report {
  final String payload;

  Report(this.payload);
  
  Report.fromJson(Map<String, dynamic> json):
      payload = hexToAscii((json["payload"] as String).substring(2));
}

// {
//   "driver_address": "0x70997970c51812dc3a010c7d01b50e0d17dc79c8",
//   "driver_geohash": "75cm8u",
//   "driver_n_trips": 0,
//   "driver_reputation": 6000,
//   "timestamp": 1697895744,
//   "distance": 2758,
//   "eta": 1697895744
// }
class TripOfferInfo {
  final String driverAddress;
  final String driverGeohash;
  final int driverNTrips;
  final int driverReputation;
  final int timestamp;
  final double distance;
  final int eta;

  TripOfferInfo(
      this.driverAddress, this.driverGeohash, this.driverNTrips,
      this.driverReputation, this.timestamp, this.distance, this.eta
  );

  TripOfferInfo.fromJson(Map<String, dynamic> json):
    driverAddress = json['driver_address'],
    driverGeohash = json['driver_geohash'],
    driverNTrips = json['driver_n_trips'],
    driverReputation = json['driver_reputation'],
    timestamp = json['timestamp'],
    distance = (json['distance'] as num).toDouble(),
    eta = json['eta'];
}

Future<TripInfo> getTripInfo(String tripId) async {
  String payload = 'trip/$tripId';
  debugPrint('${AppConf.info.inspectAPIURL}/$payload');
  final httpResponse = await http.get(
      Uri.parse('${AppConf.info.inspectAPIURL}/$payload')
  );

  if (httpResponse.statusCode != 200) {
    throw "Unable to fetch trip info";
  }

  final reports = (jsonDecode(httpResponse.body)["reports"]) as List<dynamic>;
  if (reports.isEmpty) {
    throw "No trip info found";
  }
  
  //final report = Report.fromJson(jsonDecode(reports.first["payload"]));
  final reportPayload = hexToAscii(
      (reports.first["payload"] as String).substring(2)
  );
  final tripInfo = TripInfo.fromJson(jsonDecode(reportPayload));
  return tripInfo;
}


// {
//   "trip_id": "27dd7746-38d3-4b59-babe-05ec66f44e5a",
//   "timestamp": 1697939792,
//   "timeout": 1697940092,
//   "geohash_origin": "72rdny",
//   "geohash_destination": "75cmen",
//   "distance": 10000,
//   "estimated_value": 10000000000000000000
// }

class TripNearby {
  final String tripId;
  final int timestamp;
  final int timeout;
  final String geohashOrigin;
  final String geohashDestination;
  final double distance;
  final double estimatedValue;

  TripNearby(this.tripId, this.timestamp, this.timeout, this.geohashOrigin, this.geohashDestination, this.distance, this.estimatedValue);

  TripNearby.fromJson(Map<String, dynamic> json):
    tripId = json['trip_id'],
    timestamp = json['timestamp'],
    timeout = json['timeout'],
    geohashOrigin = json['geohash_origin'],
    geohashDestination = json['geohash_destination'],
    distance = (json['distance'] as num).toDouble(),
    estimatedValue = (json['estimated_value'] as num).toDouble();
}