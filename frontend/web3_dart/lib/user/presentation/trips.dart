import 'package:flutter/material.dart';
import 'package:web3_dart/user/presentation/drawer.dart';

import '../application/user.dart';

class TripsPage extends StatefulWidget {
  static const String route = '/user/trips';
  const TripsPage({super.key});

  @override
  State<TripsPage> createState() {
    return _TripsPageState();
  }
}

class _TripsPageState extends State<TripsPage>{
  late User user;

  @override
  Widget build(BuildContext context) {
    user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      appBar: AppBar(),
      endDrawer: UserDrawer(user: user, currentRoute: TripsPage.route),
      body: const Text("List user's trips"),
    );
  }
}