import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:web3_dart/user/presentation/homepage.dart';

import '../../main.dart';
import '../../user/application/user.dart';
import '../application/account.dart';
import 'create.dart';


class ManageWallet extends StatefulWidget {
  final List<Map<String, dynamic>> userAccounts;
  final Function callback;

  const ManageWallet(this.userAccounts, this.callback, {super.key});

  @override
  State<StatefulWidget> createState() => _ManageWalletState();
}


class _ManageWalletState extends State<ManageWallet> {
  late List<Map<String, dynamic>> userAccounts;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Account userAccount;

  int deleteAccountByIndex = -1;

  @override
  void initState() {
    super.initState();
    userAccounts = widget.userAccounts;
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Choose an account to use"),
        ),
        body: Column(
            children: <Widget>[
              // your Content if there
              Expanded(
                child: ListView.builder(
                    itemCount: userAccounts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0
                        ),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(8.0)
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: GestureDetector(
                              child: ListTile(
                                title: Text(
                                    userAccounts[index]["accountName"],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                subtitle: Text(
                                  userAccounts[index]["address"],
                                  style: const TextStyle(
                                      letterSpacing: 0.0,
                                  ),
                                ),
                              ),
                              onLongPress: () {
                                int setToIndex;
                                if (deleteAccountByIndex == index) {
                                  setToIndex = -1; // clear
                                } else {
                                  setToIndex = index;
                                }
                                setState(() {
                                  deleteAccountByIndex = setToIndex;
                                });
                              },
                              onTap: () { showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      scrollable: true,
                                      title: const Text('Login'),
                                      content: Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: Form(
                                          key: _formKey,
                                          child: Column(
                                            children: <Widget>[
                                              TextFormField(
                                                  obscureText: true,
                                                  enableSuggestions: false,
                                                  autocorrect: false,
                                                  decoration: const InputDecoration(
                                                    labelText: 'Password',
                                                    icon: Icon(Icons.password),
                                                  ),
                                                  validator: (String? value) {
                                                    if (value == null || value.isEmpty) {
                                                      return 'Please enter some text';
                                                    }
                                                    try {
                                                      userAccount = Account.login(
                                                          userAccounts[index],
                                                          value
                                                      );
                                                    } on ArgumentError catch(loginException) {
                                                      return "Wrong password";
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
                                            child: const Text("Login"),
                                            onPressed: () {
                                              if (_formKey.currentState!.validate()) {
                                                //widget.callback(userAccount);
                                                Navigator.pushReplacementNamed(
                                                    context,
                                                    UserHomePage.route,
                                                    arguments: User(userAccount)
                                                );
                                              }
                                            })
                                      ],
                                    );
                                  });}
                          ),
                        )
                      );
                    }),
              )
            ],
          ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push( // navigate to create account page
                context,
                MaterialPageRoute(
                  builder: (context) => CreateWallet(callback: _back2Homepage)
                )
            );
          },
          tooltip: 'Add Account',
          child: const Icon(Icons.add),
        ),
      );
  }

  Widget _showAccountOptions() {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        child: const Icon(
            Icons.remove_circle,
            color: Colors.red
        ),
        onTap: () {
          print("Delete");
        },
      )
    );

  }

  void _back2Homepage(Account _) {
    Navigator.pushReplacement( // then, navigate to home
        context,
        MaterialPageRoute(
        builder: (context) => const MyApp()
      )
    );
  }
}