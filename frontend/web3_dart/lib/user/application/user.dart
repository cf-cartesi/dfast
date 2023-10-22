import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:web3dart/web3dart.dart';

import '../../shared/app_conf.dart';
import '../../web3Account/application/account.dart';
import 'package:geolocator/geolocator.dart';

class User {
  Account account;

  User(this.account);

  EthereumAddress getAddress() {
    return account.credentials.privateKey.address;
  }

  Future<EtherAmount> getBalance() async {
    final client = Web3Client(AppConf.info.rpcUrl, http.Client());
    return await client.getBalance(getAddress());
  }

  Future<Position> determinePosition() async {
      await _checkPermissions();

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<Position?> determineLastKnowPosition() async {
    await _checkPermissions();

    return await Geolocator.getLastKnownPosition();
  }


  Future<Position?> _checkPermissions() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return null;
  }


  // TEST server
  void sendMessage(String msg, String receiver) async {
    debugPrint('http://10.0.2.2:8081/$receiver/$msg');
    await http.get(
        Uri.parse('http://10.0.2.2:8081/$receiver/$msg')
    );
  }
}