import 'package:dart_geohash/dart_geohash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web3_dart/map/presentation/map.dart';
import 'package:web3_dart/rollups/application/contracts.dart';
import 'package:web3_dart/user/application/user.dart';

import '../presentation/drawer.dart';

class UserHomePage extends StatefulWidget {
  static const String route = '/user';
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage>{
  late RollupContracts rollupContracts;
  late User user;

  @override
  void initState() {
    super.initState();
    rollupContracts = RollupContracts("localhost");
  }

  @override
  Widget build(BuildContext context) {
    user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
          appBar: AppBar(),
          endDrawer: buildUserDrawer(
              user,
              context,
              UserHomePage.route
          ),
          body: const AnimatedMapControllerPage(),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final position = await user.determinePosition();
              final geoHash = GeoHash.fromDecimalDegrees(
                  position.longitude, position.latitude, precision: 6);
              print('$position | ${geoHash.geohash}');
              rollupContracts.addInput(
                  user.account.credentials.privateKey,
                  "DFaST: ${position.toString()}, Geohash: ${geoHash.geohash}"
              );
            },
            tooltip: 'Choose a destination',
            child: const Icon(Icons.add_location, color: Colors.blue),
          )
      );
  }
}