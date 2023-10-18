import 'package:flutter/material.dart';
import 'package:web3_dart/shared/app_conf.dart';
import 'package:web3_dart/user/presentation/homepage.dart';
import 'package:web3_dart/user/presentation/trips.dart';

import '../application/user.dart';

class UserDrawer extends StatefulWidget {
  final User user;
  final String currentRoute;
  const UserDrawer({super.key, required this.user, required this.currentRoute});

  @override
  State<UserDrawer> createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
  late final String userAddress;
  late String userBalance = "Loading...";

  @override
  void initState() {
    super.initState();
    userAddress = widget.user.getAddress().toString();
    _loadBalance();
  }

  void _loadBalance() async {
    String balance;
    try {
      balance = (await widget.user.getBalance()).getInEther.toString();
    } on Exception catch(_) {
      balance = "?";
    }
    setState(() {
      userBalance = balance;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> networks = AppConf.getNetworks();
    return Drawer(
        child: ListView(
            children: <Widget>[
              SizedBox(
                height: 200,
                child: DrawerHeader(
                  child: Column(
                    children: [
                      Text(
                        widget.user.account.accountName,
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
                          child: _buildHeaderItem(
                              widget.user,
                              const RotatedBox(
                                quarterTurns: 3,
                                child: Icon(Icons.key),
                              ),
                              "Public Key:",
                              '${userAddress.substring(0,6)}'
                                  '...'
                                  '${userAddress.substring(userAddress.length-4)}'
                          )
                      ),
                      _buildHeaderItem(
                          widget.user,
                          const Icon(Icons.account_balance_wallet),
                          "Balance:",
                          '$userBalance ${AppConf.info.token}'
                      ),
                      Container(
                        margin: const EdgeInsetsDirectional.only(top: 5.0),
                        child: DropdownMenu<String>(
                          label: const Text("Current Network"),
                          initialSelection: AppConf.network,
                          onSelected: (String? value) {
                            // This is called when the user selects an item.
                            if (value == null || value.isEmpty) return;
                            AppConf.changeNetwork(value);
                            _loadBalance();
                          },
                          dropdownMenuEntries: networks
                              .map<DropdownMenuEntry<String>>((String value) {
                            return DropdownMenuEntry<String>(
                                value: value, label: value
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              _buildMenuItem(
                widget.user,
                context,
                const Text('Home'),
                UserHomePage.route,
                widget.currentRoute,
                icon: const Icon(Icons.home),
              ),
              const Divider(),
              _buildMenuItem(
                widget.user,
                context,
                const Text('Trips'),
                TripsPage.route,
                widget.currentRoute,
                icon: const Icon(Icons.trip_origin),
              ),

            ]
        )
    );
  }

  Widget _buildHeaderItem(
      User user,
      Widget icon,
      String itemName,
      String itemValue
      ) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 4.0),
          child: Row(
            children: [
              icon,
              Text(itemName),
            ],
          ),
        ),
        const Spacer(),
        Text(itemValue,
          style: const TextStyle(fontSize: 14),
        ),
        const Spacer(),
      ],
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
}