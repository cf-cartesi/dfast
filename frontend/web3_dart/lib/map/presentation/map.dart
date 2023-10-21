import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../application/map_controller.dart';


class AnimatedMap extends StatefulWidget {
  final AnimatedMapController controller;
  const AnimatedMap({Key? key, required this.controller}) : super(key: key);

  @override
  AnimatedMapState createState() {
    return AnimatedMapState();
  }
}

class AnimatedMapState extends State<AnimatedMap>
    with TickerProviderStateMixin {
  static const _startedId = 'AnimatedMapController#MoveStarted';
  static const _inProgressId = 'AnimatedMapController#MoveInProgress';
  static const _finishedId = 'AnimatedMapController#MoveFinished';

  late List<Marker> _markers = List.empty();
  late List<LatLng> _polyline = List.empty();
  late final MapController mapController;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
    widget.controller.addTripToMap = addTripToMap;
    widget.controller.clearMap = clearMap;
  }

  void addTripToMap(LatLng currLocation,
      LatLng destLocation, List<LatLng> route) {
    final bounds = LatLngBounds.fromPoints([destLocation, currLocation]);
    final constrained = CameraFit.bounds(
      bounds: bounds,
    ).fit(mapController.camera);

    setState(() {
      _markers = [
        Marker(
          width: 80,
          height: 80,
          point: currLocation,
          child: const Icon(Icons.my_location, color: Colors.red)
        ),
        Marker(
            width: 80,
            height: 80,
            point: destLocation,
            child: const Icon(Icons.location_pin, color: Colors.blue)
        ),
      ];

      _polyline = route;
    });

    _animatedMapMove(constrained.center, constrained.zoom);
  }

  void _animatedMapMove(LatLng destLocation, double destZoom) {
    // Create some tweens. These serve to split up the transition from one location to another.
    // In our case, we want to split the transition be<tween> our current map center and the destination.
    final camera = mapController.camera;
    final latTween = Tween<double>(
        begin: camera.center.latitude, end: destLocation.latitude);
    final lngTween = Tween<double>(
        begin: camera.center.longitude, end: destLocation.longitude);
    final zoomTween = Tween<double>(begin: camera.zoom, end: destZoom);

    // Create a animation controller that has a duration and a TickerProvider.
    final controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    // The animation determines what path the animation will take. You can try different Curves values, although I found
    // fastOutSlowIn to be my favorite.
    final Animation<double> animation =
    CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    // Note this method of encoding the target destination is a workaround.
    // When proper animated movement is supported (see #1263) we should be able
    // to detect an appropriate animated movement event which contains the
    // target zoom/center.
    final startIdWithTarget =
        '$_startedId#${destLocation.latitude},${destLocation.longitude},$destZoom';
    bool hasTriggeredMove = false;

    controller.addListener(() {
      final String id;
      if (animation.value == 1.0) {
        id = _finishedId;
      } else if (!hasTriggeredMove) {
        id = startIdWithTarget;
      } else {
        id = _inProgressId;
      }

      hasTriggeredMove |= mapController.move(
        LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
        zoomTween.evaluate(animation),
        id: id,
      );
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      } else if (status == AnimationStatus.dismissed) {
        controller.dispose();
      }
    });

    controller.forward();
  }

  void clearMap() {
    setState(() {
      _markers = [];
      _polyline = [];
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Flexible(
              child: FlutterMap(
                mapController: mapController,
                options: const MapOptions(
                    initialCenter: LatLng(-15.72, -48.01), // Brasilia
                    initialZoom: 5,
                    maxZoom: 12,
                    minZoom: 4),
                children: [
                  TileLayer(
                    urlTemplate:
                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                    tileUpdateTransformer: _animatedMoveTileUpdateTransformer,
                  ),
                  MarkerLayer(markers: _markers),
                  PolylineLayer(
                      polylines: [
                        Polyline(
                          points: _polyline,
                          color: Colors.blue,
                          strokeWidth: 1.5
                        )
                      ]
                  )
                ],
              ),
            ),
          ],
        );
  }
}

/// Causes tiles to be prefetched at the target location and disables pruning
/// whilst animating movement. When proper animated movement is added (see
/// #1263) we should just detect the appropriate AnimatedMove events and
/// use their target zoom/center.
final _animatedMoveTileUpdateTransformer =
TileUpdateTransformer.fromHandlers(handleData: (updateEvent, sink) {
  final mapEvent = updateEvent.mapEvent;

  final id = mapEvent is MapEventMove ? mapEvent.id : null;
  if (id?.startsWith(AnimatedMapState._startedId) == true) {
    final parts = id!.split('#')[2].split(',');
    final lat = double.parse(parts[0]);
    final lon = double.parse(parts[1]);
    final zoom = double.parse(parts[2]);

    // When animated movement starts load tiles at the target location and do
    // not prune. Disabling pruning means existing tiles will remain visible
    // whilst animating.
    sink.add(
      updateEvent.loadOnly(
        loadCenterOverride: LatLng(lat, lon),
        loadZoomOverride: zoom,
      ),
    );
  } else if (id == AnimatedMapState._inProgressId) {
    // Do not prune or load whilst animating so that any existing tiles remain
    // visible. A smarter implementation may start pruning once we are close to
    // the target zoom/location.
  } else if (id == AnimatedMapState._finishedId) {
    // We already prefetched the tiles when animation started so just prune.
    sink.add(updateEvent.pruneOnly());
  } else {
    sink.add(updateEvent);
  }
});