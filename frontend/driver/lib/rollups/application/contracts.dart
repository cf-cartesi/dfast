import 'dart:convert';

import 'package:http/http.dart';
import 'package:driver/InputBox.g.dart';
import 'package:driver/shared/app_conf.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';


void addInput(EthPrivateKey credentials, String payload, Function (InputAdded event) callback) async {
  final client = Web3Client(AppConf.info.rpcUrl, Client());

  final InputBox inputContract = InputBox(
      address: AppConf.info.contracts["InputBox"]!,
      client: client);

  // listen for the inputAdded event
  final subscription = inputContract.inputAddedEvents()
      .take(1)
      .listen(callback);

  // prepare and send payload
  String payloadHex = utf8.encode(payload).map(
          (e) => e.toRadixString(16)
  ).join();
  await inputContract.addInput(
      AppConf.info.contracts["dapp"]!,
      hexToBytes(payloadHex),
      credentials: credentials
  );

  await subscription.asFuture();
  await subscription.cancel();

  await client.dispose();
}