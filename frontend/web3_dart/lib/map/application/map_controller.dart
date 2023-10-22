import 'package:latlong2/latlong.dart';

class AnimatedMapController {
  static const animationDurationMs = 1500;
  // functions to be implemented by the AnimatedMap
  late void Function(
      LatLng currLocation,
      LatLng destLocation,
      List<LatLng> route) addTripToMap;
  late void Function() clearMap;
}