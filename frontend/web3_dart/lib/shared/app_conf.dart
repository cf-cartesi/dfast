import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:web3dart/credentials.dart';


class NetworkInfo {
  final String token;
  final String rpcUrl;
  final String graphqlAPIURL;
  final String inspectAPIURL;
  final Map<String, EthereumAddress> contracts;

  NetworkInfo(this.token,
      this.rpcUrl, this.graphqlAPIURL, this.inspectAPIURL, this.contracts);

  NetworkInfo.fromJson(Map<String, dynamic> json):
      token = json['token'],
      rpcUrl = json['rpcUrl'],
      graphqlAPIURL = json['graphqlAPIURL'],
      inspectAPIURL = json['inspectAPIURL'],
      contracts = (json["contracts"] as Map<String, dynamic>).map(
          (key, value) => MapEntry(key, EthereumAddress.fromHex(value)));

  Map<String, dynamic> toJson() => {
    'token': token,
    'rpcUrl': rpcUrl,
    'graphqlAPIURL': graphqlAPIURL,
    'inspectAPIURL': inspectAPIURL,
    'contracts': contracts
  };
}

class AppConf {
  static late String network;
  static late NetworkInfo info;
  static late Map<String, dynamic> _conf;

  static void load(String network) {
    rootBundle.loadString("assets/conf.json").then((value) {
      AppConf.network = network;
      AppConf._conf = jsonDecode(value);
      AppConf.info = NetworkInfo.fromJson(AppConf._conf[AppConf.network]);
    });
  }

  static void changeNetwork(String network) {
    if (AppConf._conf.isEmpty) {
      throw "Load the configuration first";
    }
    AppConf.network = network;
    AppConf.info = NetworkInfo.fromJson(AppConf._conf[AppConf.network]);
  }

  static List<String> getNetworks() {
    return AppConf._conf.keys.toList();
  }
}