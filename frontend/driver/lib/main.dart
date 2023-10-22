import 'dart:convert';
import 'dart:io' as io;

import 'package:dart_geohash/dart_geohash.dart';
import 'package:driver/rollups/application/contracts.dart';
import 'package:driver/rollups/application/inspect.dart';
import 'package:driver/shared/app_conf.dart';
import 'package:driver/shared/cartesi_rollups_outputs.dart';
import 'package:driver/shared/feedback.dart';
import 'package:driver/user/application/user.dart';
import 'package:driver/web3Account/application/account.dart';
import 'package:driver/web3Account/presentation/create.dart';
import 'package:driver/web3Account/presentation/manage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DFaST Driver',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'DFaST Driver'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final userAccounts = <Map<String, dynamic>> [];

  @override
  void initState() {
    super.initState();
    initialization();
  }


  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.

    // create directories used by the app
    final appDirectory = await getApplicationDocumentsDirectory();
    String accountsDirectoryPath = "${appDirectory.path}/accounts";
    io.Directory dir = await _createDirectory(accountsDirectoryPath);

    _getAccountList(dir);

    // load default network AppConf
    AppConf.load("localhost");
  }


  Future<io.Directory> _createDirectory(String directoryPath) async {
    io.Directory dir =  io.Directory(directoryPath);
    if(await dir.exists()) {
      return dir;
    }

    dir = await dir.create(recursive: true);
    return dir;
  }

  void _getAccountList(io.Directory dir) {
    List accountsFiles = dir.listSync();

    setState(() {
      for (var i = 0; i < accountsFiles.length; i++) {
        String content = io.File(accountsFiles[i].path).readAsStringSync();
        Map<String, dynamic> account = jsonDecode(content);
        account["filepath"] = accountsFiles[i].path;
        userAccounts.add(account);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called.
    if (userAccounts.isEmpty) {
      return CreateWallet(callback: _nav2UserPage);
    } else {
      return ManageWallet(userAccounts, _nav2UserPage);
    }
  }

  void _nav2UserPage(Account userAccount) {
    User user = User(userAccount);

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DriverPage(user: user,))
    );
  }
}

enum DriverPageStatus {
  applying, // still needs to apply to be a driver
  ready, // register driver
  lookingForTrips,
  offered,
  riding
}

class DriverPage extends StatefulWidget {
  final User user;
  const DriverPage({super.key, required this.user});

  @override
  State<DriverPage> createState() => _DriverPageState();
}

class _DriverPageState extends State<DriverPage> {
  DriverPageStatus driverPageStatus = DriverPageStatus.applying;
  late List<TripNearby> tripsNearby = [];
  late TripInfo trip;
  late GeoHash currGeohash;
  bool monitoringTrips = false;
  bool waitingPassengerMsg = false;
  bool validPassenger = false;
  late int startTimestamp;
  late int endTimestamp;

  @override
  void initState() {
    super.initState();
    _verifyDriverRegistered().then((registered) {
      if (registered) {
        setState(() {
          driverPageStatus = DriverPageStatus.ready;
        });
      }
    });
  }

  Future<bool> _verifyDriverRegistered() async {
    String payload = 'driver/${widget.user.getAddress().toString()}';
    final httpResponse = await http.get(
        Uri.parse('${AppConf.info.inspectAPIURL}/$payload')
    );

    if (httpResponse.statusCode != 200) {
      throw 'Unable to fetch info.';
    }

    final reports = (jsonDecode(httpResponse.body)["reports"]) as List<dynamic>;
    if (reports.isEmpty) return false;
    return true;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _selectState(),
    );
  }

  Widget _selectState() {
    if (driverPageStatus == DriverPageStatus.applying) {
      return _driverPageApplying();
    } else if (driverPageStatus == DriverPageStatus.ready) {
      return _driverPageReady();
    } else if (driverPageStatus == DriverPageStatus.lookingForTrips) {
      return _driverPageLookingForTrips();
    } else if (driverPageStatus == DriverPageStatus.offered) {
      return _driverPageOffered();
    }

    return _driverPageRiding();
  }

  Widget _driverPageApplying() {
    return Center(
      child: TextButton(
        onPressed: () {
          _apply();
        },
        style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            backgroundColor: Colors.blue
        ),
        child: const Text('Became a DFaST Driver',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20
            )
        ),
      ),
    );
  }

  void _apply() {
    Map<String, dynamic> payload = {"action":"driver_application"};
    addInput(
      widget.user.account.credentials.privateKey,
      jsonEncode(payload),
      (event) {
        setState(() {
          driverPageStatus = DriverPageStatus.ready;
        });
    });
  }

  Widget _driverPageReady() {
    return Center(
      child: TextButton(
        onPressed: () {
          setState(() {
            driverPageStatus = DriverPageStatus.lookingForTrips;
            monitoringTrips = true;
          });
        },
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          backgroundColor: Colors.green
        ),
        child: const Text(
            'Drive',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30
          ),
        ),
      ),
    );
  }

  Widget _driverPageLookingForTrips() {
    _monitorNearbyTrips();

    return ListView.builder(
      itemCount: tripsNearby.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Column(
            children: [
              Row(
                children: [
                  Text('Origin: ${tripsNearby[index].geohashOrigin}'),
                  Container(margin: const EdgeInsets.symmetric(horizontal: 8.0)),
                  Text('Destination: ${tripsNearby[index].geohashDestination}'),
                ],
              ),
              Text('Estimated value: ${
                  tripsNearby[index].estimatedValue/1000000000000000000
              } ${AppConf.info.token}'),
              Row(
                children: [
                  Text('Timestamp: ${tripsNearby[index].geohashOrigin}'),
                  Container(margin: const EdgeInsets.symmetric(horizontal: 8.0)),
                  Text('Destination: ${tripsNearby[index].geohashDestination}'),
                ],
              ),
              TextButton(
                  onPressed: () {
                    _offerTrip(tripsNearby[index]);
                  },
                  child: const Text('Offer Ride')
              )
            ],
          ),
        );
      }
    );
  }

  void _monitorNearbyTrips() async {
    int retries = 0;
    _getGeohash();

    while (monitoringTrips) {
      await Future.delayed(const Duration(seconds: 5));

      String payload = 'match_trips/${currGeohash.geohash}?ts=1';
      final httpResponse = await http.get(
        Uri.parse('${AppConf.info.inspectAPIURL}/$payload')
      );

      final reports = (jsonDecode(httpResponse.body)["reports"]) as List<dynamic>;
      final reportPayload = jsonDecode(hexToAscii(
          (reports[0]["payload"] as String).substring(2)
      )) as List<dynamic>;

      List<TripNearby> trips = [];
      for (var i = 0; i < reportPayload.length; i++) {

        final tripInfo = TripNearby.fromJson(reportPayload[i]);
        trips.add(tripInfo);
      }

      if (trips != tripsNearby) {
        setState(() {
          tripsNearby = trips;
        });
      }

      if (retries > 50) {
        _getGeohash();
        retries = 0;
      }
    }
  }

  void _getGeohash() async {
    final currPosition = await widget.user.determinePosition();
    currGeohash = GeoHash.fromDecimalDegrees(
        currPosition.latitude,
        currPosition.longitude,
        precision: 6
    );
  }

  void _offerTrip(TripNearby trip) {
    Map<String, dynamic> payload = {
      "action":"offer_trip",
      "trip_id":trip.tripId,
      "geohash":currGeohash.geohash
    };

    getTripInfo(trip.tripId).then((value) => this.trip = value);

    addInput(
        widget.user.account.credentials.privateKey,
        jsonEncode(payload),
          (event) {
            setState(() {
              monitoringTrips = false;
              driverPageStatus = DriverPageStatus.offered;
              waitingPassengerMsg = true;
            });
    });
  }

  Widget _driverPageOffered() {
    _monitorPassengerMsg();

    return Center(
      child: Text(
        'Waiting for the passenger...${validPassenger? 'Ok':''}',
        style: const TextStyle(
          fontSize: 14
        ),
      ),
    );
  }

  void _monitorPassengerMsg() async{
    while (waitingPassengerMsg) {
      await Future.delayed(const Duration(seconds: 5));

      // receive message from the passenger
      String msg = await widget.user.receiveMessage();

      if (msg.isNotEmpty) {
        setState(() {
          waitingPassengerMsg = false;
          validPassenger = true;
          driverPageStatus = DriverPageStatus.riding;
        });
        startTimestamp = DateTime.timestamp().millisecondsSinceEpoch *1000;
      }
      // TODO: validate msg (commitment reveal)

    }
  }

  Widget _driverPageRiding() {
    return Center(
      child: TextButton(
        onPressed: () {
          _finish();
        },
        style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            backgroundColor: Colors.green
        ),
        child: const Text(
          'Finish',
          style: TextStyle(
              color: Colors.white,
              fontSize: 30
          ),
        ),
      ),
    );
  }

  void _finish() {
    endTimestamp = DateTime.timestamp().millisecondsSinceEpoch *1000;

    Map<String, dynamic> payload = {
      "action":"finish_trip",
      "trip_id":trip.id,
      "final_distance": trip.distance,
      "start_timestamp":startTimestamp,
      "end_timestamp":endTimestamp
    };

    addInput(
        widget.user.account.credentials.privateKey,
        jsonEncode(payload),
         (event) {
          setState(() {
            driverPageStatus = DriverPageStatus.ready;
          });
        });
  }
}