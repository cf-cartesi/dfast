import 'package:flutter/material.dart';
import 'package:web3_dart/user/presentation/homepage.dart';
import 'package:web3_dart/user/presentation/trips.dart';

import '../application/user.dart';

Drawer buildUserDrawer(User user, BuildContext context, String currentRoute) {
  final userAddress = user.getAddress().toString();
  final key = GlobalKey<State<Tooltip>>();

  return Drawer(
      child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: [
                  Text(
                    user.account.accountName,
                    style: const TextStyle(
                      fontSize: 24.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Tooltip(
                      message: userAddress,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient:
                        const LinearGradient(
                          colors: <Color>[Colors.cyan, Colors.white70],
                        ),
                      ),
                      height: 50,
                      padding: const EdgeInsets.all(4.0),
                      preferBelow: true,
                      textStyle: const TextStyle(
                        fontSize: 16,
                      ),
                      showDuration: const Duration(seconds: 2),
                      waitDuration: const Duration(seconds: 1),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 4.0),
                            child: const Row(
                              children: [
                                RotatedBox(
                                  quarterTurns: 3,
                                  child: Icon(Icons.key),
                                ),
                                Text("Public Key:"),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '${userAddress.substring(0,6)}'
                            '...'
                            '${userAddress.substring(userAddress.length-4)}',
                            style: const TextStyle(fontSize: 14),
                          ),
                          const Spacer(),
                        ],
                      )
                  ),
                ],
              ),
            ),
            _buildMenuItem(
              user,
              context,
              const Text('Home'),
              UserHomePage.route,
              currentRoute,
              icon: const Icon(Icons.home),
            ),
            const Divider(),
            _buildMenuItem(
              user,
              context,
              const Text('Trips'),
              TripsPage.route,
              currentRoute,
              icon: const Icon(Icons.trip_origin),
            ),

          ]
      )
  );
}

Widget _buildMenuItem(
    User user,
    BuildContext context,
    Widget title,
    String routeName,
    String currentRoute, {
      Widget? icon,
    }) {
  final isSelected = routeName == currentRoute;

  return ListTile(
    title: title,
    leading: icon,
    selected: isSelected,
    onTap: () {
      if (isSelected) {
        Navigator.pop(context);
      } else {
        Navigator.pushReplacementNamed(context, routeName, arguments: user);
      }
    },
  );
}