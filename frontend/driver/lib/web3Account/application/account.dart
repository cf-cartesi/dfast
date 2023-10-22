// ignore_for_file: public_member_api_docs

import 'dart:convert';

import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';
import 'dart:math';

// File management libs
import 'package:path_provider/path_provider.dart';
import 'dart:io';


class Account {
  late String accountName;
  late Wallet credentials; // Wallet class cannot be extended

  Account._constructor(Map<String, dynamic> accountModel, String password) {
    accountName = accountModel["accountName"];

    Wallet wallet = Wallet.fromJson(
        jsonEncode(accountModel["encryptedWallet"]), password);

    credentials = wallet;
  }

  /// Public factory
  static Account login(
      Map<String, dynamic> accountModel, String password) {
    // Call the private constructor
    Account account;
    try {
      account = Account._constructor(accountModel, password);
    } on ArgumentError catch(_) {
      rethrow;
    }

    // Return the fully initialized Account object
    return account;
  }

  /// Public factory
  static Future<Account> newAccount(
      String accountName, String privateKey, String password) async {
    // Do initialization that requires async
    final appDirectory = await getApplicationDocumentsDirectory();

    // build file absolute path
    String filename = bytesToHex(keccakUtf8(accountName));
    String filepath = '${appDirectory.path}/accounts/$filename.json';

    // create wallet JSON file
    Map<String, dynamic> accountModel = await _create(
        filepath, accountName, privateKey, password);

    // Call the private constructor
    var component = Account._constructor(accountModel, password);

    // Return the fully initialized Account object
    return component;
  }

  static Future<Map<String, dynamic>> _create(String filepath,
      String accountName, String privateKey, String password) async {
    final credentials = EthPrivateKey.fromHex(privateKey);
    Wallet wallet = Wallet.createNew(credentials, password, Random());

    final file = File(filepath);
    final content = '{"accountName": "$accountName",'
        '"address": "${wallet.privateKey.address}",'
        '"encryptedWallet":${wallet.toJson()}}';
    await file.writeAsString(content);

    return jsonDecode(content);
  }
}
