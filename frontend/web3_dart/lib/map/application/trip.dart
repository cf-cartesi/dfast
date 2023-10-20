// Map related functions
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:web3_dart/shared/app_conf.dart';
import 'package:latlong2/latlong.dart';

class Route {
  final double lat;
  final double lng;

  Route(this.lat, this.lng);

  Route.fromJson(Map<String, dynamic> json):
      lat = double.parse(json["lat"]),
      lng = double.parse(json["lon"]);

  Map<String, dynamic> toJson() => {
    'lat': lat,
    'lng': lng
  };
}

Future<List<LatLng>> getRoute(LatLng origin, LatLng destination) async {
  // String payload = 'route/${origin.longitude},${origin.latitude};'
  //     '${destination.longitude},${destination.latitude}';
  // return http.get(Uri.parse('${AppConf.info.inspectAPIURL}/$payload'));

  final List<dynamic> routeList = jsonDecode(
      await rootBundle.loadString("assets/routeExample.json")
  );
  List<LatLng> result = [];

  for (var i = 0; i < routeList.length; i++) {
    final route = Route.fromJson(routeList[i]);
    result.add(LatLng(route.lat, route.lng));
  }

  return result;
}

double estimateTripCost(List<LatLng> route) {
  return 1.5;
}
