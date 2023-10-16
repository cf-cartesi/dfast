import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web3_dart/rollups/application/contracts.dart';

import 'package:web3_dart/web3Account/application/account.dart';

class UserHomePage extends StatefulWidget {
  final Account account;

  const UserHomePage({super.key, required this.account});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage>{
  late RollupContracts rollupContracts;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rollupContracts = RollupContracts("localhost");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          title: const Text("User Homepage"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            rollupContracts.addInput(
                widget.account.credentials.privateKey,
                "Hello, from DFaST"
            );
          },
          tooltip: 'Add Input',
          child: const Icon(Icons.add),
        )
    );
  }
}