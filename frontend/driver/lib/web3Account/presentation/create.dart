import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web3dart/credentials.dart';
import 'dart:ui' as ui;

import 'package:driver/web3Account/application/account.dart';
import 'package:web3dart/crypto.dart';

class CreateWallet extends StatefulWidget {
  final Function callback;

  const CreateWallet({super.key, required this.callback});

  @override
  State<CreateWallet> createState() => _CreateWalletState();
}

class _CreateWalletState extends State<CreateWallet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String accountName; // name select by the user to identify the account
  late String accountPrivateKey; // ETH private key for the account
  late String accountPassword; // password to create encrypted JSON file

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
          title: const Text("Wallet creation"),
        bottom: const PreferredSize(
          preferredSize: ui.Size.fromHeight(40.0),
          child: Text(
              "Import your first account",
              style: TextStyle(fontSize: 18)
          ),
        )
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                onSaved: (String? value)=>{accountName = value!},
                decoration: const InputDecoration(
                    hintText: 'Account Name',
                    icon: Icon(Icons.person)
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please type a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                onSaved: (String? value)=>{accountPrivateKey = value!},
                decoration: const InputDecoration(
                    hintText: 'Private key',
                    icon: Icon(Icons.key)
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  // test private key
                  try {
                    value = strip0x(value);
                    EthPrivateKey.fromHex(value);
                  } on Exception catch(_) {
                    return "Invalid private key";
                  }
                  return null;
                },
              ),
              TextFormField(
                //onSaved: (String? value)=>{accountPassword = value!},
                onChanged: (String? value)=>{accountPassword = value!},
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                    hintText: 'Create a password for the account',
                    icon: Icon(Icons.password)
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                    hintText: 'Confirm password',
                    icon: Icon(Icons.password)
                ),
                validator: (String? value) {
                  if (value != accountPassword) {
                    return 'Enter the same password';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState!.validate()) {
                    // Process data.
                    _formKey.currentState!.save();
                    Account.newAccount(
                        accountName, accountPrivateKey, accountPassword
                    ).then((userWallet) => widget.callback(userWallet));
                  }
                },
                child: const Text('Create'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
