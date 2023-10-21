import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web3_dart/map/presentation/map.dart';
import 'package:web3_dart/rollups/application/contracts.dart';
import 'package:web3_dart/rollups/application/inspect.dart';
import 'package:web3_dart/shared/app_conf.dart';
import 'package:web3_dart/user/application/user.dart';
import 'package:latlong2/latlong.dart';

import '../../InputBox.g.dart';
import '../../map/application/map_controller.dart';
import '../../map/application/trip.dart';
import '../../rollups/application/notices.dart';
import '../../shared/expandableFAB.dart';
import '../../shared/feedback.dart';
import '../presentation/drawer.dart';


enum TripStatus { creating, waitingForDriver, riding }

class UserHomePage extends StatefulWidget {
  static const String route = '/user';
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage>{
  late User user;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // destination form fields
  late double destinationLat;
  late double destinationLng;

  // locations
  late LatLng currLocation;
  late LatLng destLocation;

  final mapController = AnimatedMapController();

  // trip
  late Trip trip;
  late TripStatus tripStatus;
  late bool monitoringDriversOffers;
  List<TripOfferInfo> driversOffers = [];

  @override
  void initState() {
    super.initState();
    tripStatus = TripStatus.creating;
    monitoringDriversOffers = false;
  }


  @override
  Widget build(BuildContext context) {
    user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
          appBar: AppBar(title: const Text('DFaST'), centerTitle: true,),
          endDrawer: UserDrawer(user: user, currentRoute: UserHomePage.route),
          body: AnimatedMap(controller: mapController),
          floatingActionButton: _selectButtonFromState()
      );
  }

  Widget _selectButtonFromState() {
    if (tripStatus == TripStatus.creating) {
      return _createTripButton();
    } else if (tripStatus == TripStatus.waitingForDriver) {
      return _manageTripButton();
    }

    return _ridingButton();
  }

  FloatingActionButton _createTripButton() {
    return FloatingActionButton(
      onPressed: () { showDialog(
          context: context,
          builder: (BuildContext context) {
            return _buildInsertDestinationLatLonAlertDialog();
          });
      },
      tooltip: 'Choose a destination',
      child: const Icon(Icons.add_location, color: Colors.blue),
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
    FeedbackWidget(context).startLoading();
    final position = await user.determinePosition();
    currLocation = LatLng(position.latitude, position.longitude);
    destLocation = LatLng(destinationLat, destinationLng);

    trip = await Trip.generate(currLocation, destLocation);

    FeedbackWidget(context).stopLoading();
    mapController.addTripToMap(currLocation, destLocation, trip.route);
    await Future.delayed(
        const Duration(
            milliseconds: AnimatedMapController.animationDurationMs
        )
    ); // wait map animation
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
                      Navigator.pop(context);
                      FeedbackWidget(context).startLoading();
                      _confirmTrip();
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
    Map<String, dynamic> payload = {
      "action": "trip_request",
      "geohash_origin": trip.geohashOrigin,
      "geohash_destination": trip.geohashDestination,
      "trip_commitment": trip.generateTripCommitment(),
      "distance": trip.distance,
      "timeout": trip.timeout
    };

    addInput(user.account.credentials.privateKey,
        jsonEncode(payload),
        _checkTrip
    );
  }

  void _checkTrip(InputAdded event) async {
    final tripId = await getTripId(event.inputIndex.toInt());

    setState(() {
      trip.id = tripId;
      tripStatus = TripStatus.waitingForDriver;
    });

    print(await getTripInfo(tripId));
    FeedbackWidget(context).stopLoading();
    monitoringDriversOffers = true;
    _monitorDriverOffers();
  }

  void _monitorDriverOffers() async {
    while (monitoringDriversOffers) {
      await Future.delayed(const Duration(seconds: 5));
      TripInfo tripInfo = await getTripInfo(trip.id);

      // check if the offers changes (new/canceled)
      if (tripInfo.offers.keys.length != driversOffers.length) {
        FeedbackWidget(context).showSnackBarMessage(
            'Your driver offers have changed!',
            Colors.green
        );

        setState(() {
          driversOffers = tripInfo.offers.values.toList();
        });
      }
    }
  }

  // manage trip actions
  Widget _manageTripButton() {
    final expandableFab = ExpandableFab(
      distance: 100,
      primaryButtonIcon: const Icon(Icons.edit_road_rounded),
      children: [
        ActionButton(
          onPressed: _cancelTrip,
          icon: const Icon(Icons.cancel, color: Colors.red),
        ),
        ActionButton(
          onPressed: () { showDialog(
              context: context,
              builder: (BuildContext context) {
                return _selectDriverAlertDialog();
              });
          },
          icon: const Icon(Icons.drive_eta, color: Colors.blue),
        ),
      ],
    );

    return expandableFab;

    // if (drivers.isEmpty) return expandableFab;
    //
    // return badges.Badge(
    //   badgeContent: Text(drivers.length.toString()),
    //   badgeStyle: const badges.BadgeStyle(
    //       badgeColor: Colors.red
    //   ),
    //   badgeAnimation: const badges.BadgeAnimation.slide(),
    //
    //   child: expandableFab,
    // );
  }

  Future<void> _cancelTrip() async {
    Map<String, dynamic> payload = {"action": "cancel_request"};
    addInput(user.account.credentials.privateKey,
        jsonEncode(payload),
        (InputAdded event) {}
    );
    setState(() {
      tripStatus = TripStatus.creating;
    });
  }

  AlertDialog _selectDriverAlertDialog() {
    return AlertDialog(
      title: const Text('Choose a Driver'),
      scrollable: true,
      content: SizedBox(
        width: double.maxFinite,
        height: 300.0,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: driversOffers.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              margin: const EdgeInsets.symmetric(
                  horizontal: 1.0,
                  vertical: 1.0
              ),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(8.0)
                  )
              ),
              child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.drive_eta_sharp,
                                size: 32,
                                color: Colors.blue,
                              ),
                              const Spacer(),
                              Text(
                                '${driversOffers[index].driverAddress.substring(0, 6)}'
                                    '...'
                                    '${driversOffers[index].driverAddress.substring(
                                    driversOffers[index].driverAddress.length-4)
                                }',
                                style: const TextStyle(
                                    fontSize: 14,
                                    letterSpacing: 0.0
                                ),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: Colors.blue,),
                                  Text(driversOffers[index].driverReputation.toString())
                                ],
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Text(
                                'Distance: ${
                                  driversOffers[index].distance
                                } m'
                              ),
                              const Spacer(),
                              Text(
                                  'Trips: ${driversOffers[index].driverNTrips}'
                              ),
                            ]
                          ),
                          Text(
                              'ETA: ${
                                  DateTime.fromMillisecondsSinceEpoch(
                                      driversOffers[index].eta
                              )}'
                          ),
                        ],
                      )
                  )
              ),
            );
          }
      )
      )
    );
  }


  // riding Actions
  Widget _ridingButton() {
    return FloatingActionButton.extended(
      onPressed: () { showDialog(
          context: context,
          builder: (BuildContext context) {
            return _buildInsertDestinationLatLonAlertDialog();
          });
      },
      label: const Row(
        children: [
          Icon(Icons.check),
          Text('Finish Trip'),
        ],
      ),
      backgroundColor: Colors.green,
    );
  }
}