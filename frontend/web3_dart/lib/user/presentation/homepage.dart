import 'package:dart_geohash/dart_geohash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web3_dart/map/presentation/map.dart';
import 'package:web3_dart/rollups/application/contracts.dart';
import 'package:web3_dart/shared/app_conf.dart';
import 'package:web3_dart/user/application/user.dart';
import 'package:latlong2/latlong.dart';

import '../../map/application/map_controller.dart';
import '../../map/application/trip.dart';
import '../presentation/drawer.dart';

class UserHomePage extends StatefulWidget {
  static const String route = '/user';
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage>{
  late User user;

  // destination form fields
  late double destinationLat;
  late double destinationLng;

  // locations
  late LatLng currLocation;
  late LatLng destLocation;

  final mapController = AnimatedMapController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
          appBar: AppBar(),
          endDrawer: UserDrawer(user: user, currentRoute: UserHomePage.route),
          body: AnimatedMap(controller: mapController),
          floatingActionButton: FloatingActionButton(
            onPressed: () { showDialog(
                context: context,
                builder: (BuildContext context) {
                  return _buildInsertDestinationLatLonAlertDialog();
                });
              },
            tooltip: 'Choose a destination',
            child: const Icon(Icons.add_location, color: Colors.blue),
          )
      );
  }

  AlertDialog _buildInsertDestinationLatLonAlertDialog() {
    return AlertDialog(
        scrollable: true,
        title: const Text('Destination'),
        content: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                    autocorrect: false,
                    decoration: const InputDecoration(
                      labelText: 'Latitude',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      try {
                        destinationLat = double.parse(value);
                      } on FormatException catch(_) {
                        return 'It must be a number';
                      }
                      return null;
                    }
                ),
                TextFormField(
                    autocorrect: false,
                    decoration: const InputDecoration(
                      labelText: 'Longitude',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      try {
                        destinationLng = double.parse(value);
                      } on FormatException catch(_) {
                        return 'It must be a number';
                      }
                      return null;
                    }
                ),
              ],
            ),
          ),
        ),
        actions: [
          ElevatedButton(
            child: const Text("Set Destination"),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // close dialog
                Navigator.of(context, rootNavigator: true).pop('dialog');

                _addDestinationToMap().then((value) {
                  double estimatedTripCost = 1.5;
                  _showBottom(estimatedTripCost);
                });
              }
            }
          )
        ],
      );
  }

  Future<void> _addDestinationToMap() async {
    final position = await user.determinePosition();
    currLocation = LatLng(position.latitude, position.longitude);
    destLocation = LatLng(destinationLat, destinationLng);

    final route = await getRoute(currLocation, destLocation);

    mapController.addTripToMap(currLocation, destLocation, route);
    await Future.delayed(const Duration(seconds: 1)); // wait map animation
  }

  void _showBottom(double estimatedTripCost) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      isDismissible: false,
      builder: (BuildContext context) {
        return SizedBox(
          height: 120,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                    'Trip Cost: $estimatedTripCost ${AppConf.info.token}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0
                    )
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton(
                    onPressed: () {
                      mapController.clearMap();
                      Navigator.pop(context);
                    },
                    style: FilledButton.styleFrom(
                        backgroundColor: Colors.red
                    ),
                    child: const Text('Cancel'),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  ),
                  FilledButton(
                    onPressed: () {
                      _confirmTrip().then((value) {
                        Navigator.pop(context);
                      });
                    },
                    style: FilledButton.styleFrom(
                        backgroundColor: Colors.green
                    ),
                    child: const Text('Confirm'),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> _confirmTrip() async {
    final currLocationGeoHash = GeoHash.fromDecimalDegrees(
        currLocation.longitude, currLocation.latitude, precision: 6);
    final destLocationGeoHash = GeoHash.fromDecimalDegrees(
        destLocation.longitude, destLocation.latitude, precision: 6);

    addInput(
        user.account.credentials.privateKey,
        "DFaST: Current Geohash: ${currLocationGeoHash.geohash},"
        "Destination Geohash: ${destLocationGeoHash.geohash}"
    );
  }
}