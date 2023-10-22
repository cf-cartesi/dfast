// Map related functions
import 'dart:convert';
import 'dart:math';

import 'package:dart_geohash/dart_geohash.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:web3_dart/shared/app_conf.dart';
import 'package:latlong2/latlong.dart';
import 'package:web3_dart/shared/osmr.dart';
import 'package:web3dart/crypto.dart';

import '../../shared/cartesi_rollups_outputs.dart';

const DEFAULT_TIMEOUT = 300;

class Trip {
  late final String geohashOrigin;
  late final String geohashDestination;
  late final List<LatLng> route;
  late final double distance;
  late final int timeout;
  String id = "";

  late int startTimestamp;
  late int endTimestamp;
  late int tripScoreRider;
  late final int tripCommitmentNonce;
  String _tripCommitment = "";

  Trip._constructor(
      this.geohashOrigin,
      this.geohashDestination,
      this.route,
      this.distance,
      this.timeout
  );

  /// Public factory
  static Future<Trip> generate(
      LatLng origin, LatLng destination, [int? timeout]) async {

    String payload = 'route/${origin.longitude},${origin.latitude};'
         '${destination.longitude},${destination.latitude}';
    final httpResponse = await http.get(Uri.parse('${AppConf.info.inspectAPIURL}/$payload'));
    final reports = (jsonDecode(httpResponse.body)["reports"]) as List<dynamic>;
    final reportPayload = hexToAscii(
        (reports.first["payload"] as String).substring(2)
    );

    final osmrResponse = jsonDecode(reportPayload);

    final distance = osmrResponse['routes'].first['distance'];
    timeout = timeout ?? DEFAULT_TIMEOUT;
    List<LatLng> route = [];

    final steps = osmrResponse['routes'].first['legs'].first['steps'];
    for (var step in steps) {
      route.add(
          LatLng(step['maneuver']['location'][1], step['maneuver']['location'][0])
      );
    }

    final geohashOrigin = GeoHash.fromDecimalDegrees(
        origin.longitude, origin.latitude, precision: 6);

    final geohashDestination = GeoHash.fromDecimalDegrees(
        destination.longitude, destination.latitude, precision: 6);

    return Trip._constructor(
        geohashOrigin.geohash,
        geohashDestination.geohash,
        route,
        distance,
        timeout
    );
  }

  String getOrGenerateTripCommitment() {
    if (_tripCommitment.isNotEmpty) return _tripCommitment;

    int max = 0x7fffffff; // 32-bit
    try {
      tripCommitmentNonce = Random.secure().nextInt(max);
    } on UnsupportedError catch(_) {
      tripCommitmentNonce = Random().nextInt(max);
    }

    _tripCommitment = bytesToHex(keccakUtf8('$route-$tripCommitmentNonce'));
    return _tripCommitment;
  }

  String generateTripCommitment() {
    if (_tripCommitment.isNotEmpty) return _tripCommitment;

    int max = 0x7fffffff; // 32-bit
    try {
      tripCommitmentNonce = Random.secure().nextInt(max);
    } on UnsupportedError catch(_) {
      tripCommitmentNonce = Random().nextInt(max);
    }

    _tripCommitment = bytesToHex(keccakUtf8('$route-$tripCommitmentNonce'));
    return _tripCommitment;
  }
}