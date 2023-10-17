import 'dart:convert';

import 'package:http/http.dart';
import 'package:web3_dart/InputBox.g.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';
import 'package:flutter/services.dart' show rootBundle;

class RollupContracts {
  String network;
  late String rpcUrl;
  late EthereumAddress dapp;
  late Map<String, dynamic> conf;

  RollupContracts(this.network) {
    rootBundle.loadString("assets/conf.json").then((value) {
      conf = jsonDecode(value);
      rpcUrl = conf[network]["rpcUrl"];
      dapp = EthereumAddress.fromHex(conf[network]["contracts"]["dapp"]);
    });
  }

  void changeNetwork(String network) {
    this.network = network;
    rpcUrl = conf[network]["rpcUrl"];
    dapp = EthereumAddress.fromHex(conf[network]["contracts"]["dapp"]);
  }

  void addInput(EthPrivateKey credentials, String payload) async {
    final client = Web3Client(rpcUrl, Client());

    final InputBox inputContract = InputBox(
        address: EthereumAddress.fromHex(
            conf[network]["contracts"]["InputBox"]!
        ),
        client: client);

    // listen for the inputAdded event
    final subscription = inputContract.inputAddedEvents()
        .take(1)
        .listen((event) {
          print(
          '${event.sender} sent input ${event.inputIndex} to DApp ${event.dapp}!'
          );
        }
    );

    // prepare and send payload
    String payloadHex = utf8.encode(payload).map(
            (e) => e.toRadixString(16)
    ).join();
    await inputContract.addInput(
        dapp,
        hexToBytes(payloadHex),
        credentials: credentials
    );

    await subscription.asFuture();
    await subscription.cancel();

    await client.dispose();
  }
}