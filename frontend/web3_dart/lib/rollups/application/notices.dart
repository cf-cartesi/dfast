import 'dart:convert';

import 'package:graphql/client.dart';
import 'package:http/http.dart' as http;
import 'package:web3_dart/queries.graphql.dart';
import 'package:web3_dart/shared/app_conf.dart';
import 'package:web3_dart/shared/cartesi_rollups_outputs.dart';
import 'package:web3dart/crypto.dart';
class TripRequestNotice0 {
  final String action;
  final String address;
  final String trip;
  final String status;

  TripRequestNotice0(this.action, this.address, this.trip, this.status);

  TripRequestNotice0.fromJson(Map<String, dynamic> json):
        action = json['action'],
        address = json['address'],
        trip = json['trip'],
        status = json['status'];

  Map<String, dynamic> toJson() => {
    'action': action,
    'address': address,
    'trip': trip,
    'status': status
  };
}

class TripRequestNotice1 {
  final String action;
  final String address;
  final String balance;

  TripRequestNotice1(this.action, this.address, this.balance);

  TripRequestNotice1.fromJson(Map<String, dynamic> json):
        action = json['action'],
        address = json['address'],
        balance = json['balance'];
}

Future<String> getTripId(int inputIndex) async {
  Query$getInput? parsedResult;

  while (parsedResult == null || parsedResult.input.notices.edges.isEmpty) {
    await Future.delayed(const Duration(milliseconds: 200));

    final client = GraphQLClient(
        link: HttpLink(AppConf.info.graphqlAPIURL),
        cache: GraphQLCache()
    );

    final result = await client.query$getInput(
        Options$Query$getInput(
            variables: Variables$Query$getInput(inputIndex: inputIndex)
        )
    );

    parsedResult = result.parsedData;
    print(parsedResult?.input);
  }

  final notice = TripRequestNotice0.fromJson(
    jsonDecode(hexToAscii(
        parsedResult.input.notices.edges.first.node.payload.substring(2))
    )
  );
  return notice.trip;
}