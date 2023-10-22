// Generated code, do not modify. Run `build_runner build` to re-generate!
// @dart=2.12
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:web3dart/web3dart.dart' as _i1;
import 'dart:typed_data' as _i2;

final _contractAbi = _i1.ContractAbi.fromJson(
  '[{"inputs":[],"name":"InputSizeExceedsLimit","type":"error"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"dapp","type":"address"},{"indexed":true,"internalType":"uint256","name":"inputIndex","type":"uint256"},{"indexed":false,"internalType":"address","name":"sender","type":"address"},{"indexed":false,"internalType":"bytes","name":"input","type":"bytes"}],"name":"InputAdded","type":"event"},{"inputs":[{"internalType":"address","name":"_dapp","type":"address"},{"internalType":"bytes","name":"_input","type":"bytes"}],"name":"addInput","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"_dapp","type":"address"},{"internalType":"uint256","name":"_index","type":"uint256"}],"name":"getInputHash","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"_dapp","type":"address"}],"name":"getNumberOfInputs","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"}]',
  'InputBox',
);

class InputBox extends _i1.GeneratedContract {
  InputBox({
    required _i1.EthereumAddress address,
    required _i1.Web3Client client,
    int? chainId,
  }) : super(
          _i1.DeployedContract(
            _contractAbi,
            address,
          ),
          client,
          chainId,
        );

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> addInput(
    _i1.EthereumAddress _dapp,
    _i2.Uint8List _input, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[0];
    assert(checkSignature(function, '1789cd63'));
    final params = [
      _dapp,
      _input,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<_i2.Uint8List> getInputHash(
    _i1.EthereumAddress _dapp,
    BigInt _index, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[1];
    assert(checkSignature(function, '677087c9'));
    final params = [
      _dapp,
      _index,
    ];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as _i2.Uint8List);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> getNumberOfInputs(
    _i1.EthereumAddress _dapp, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[2];
    assert(checkSignature(function, '61a93c87'));
    final params = [_dapp];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as BigInt);
  }

  /// Returns a live stream of all InputAdded events emitted by this contract.
  Stream<InputAdded> inputAddedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('InputAdded');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return InputAdded(
        decoded,
        result,
      );
    });
  }
}

class InputAdded {
  InputAdded(
    List<dynamic> response,
    this.event,
  )   : dapp = (response[0] as _i1.EthereumAddress),
        inputIndex = (response[1] as BigInt),
        sender = (response[2] as _i1.EthereumAddress),
        input = (response[3] as _i2.Uint8List);

  final _i1.EthereumAddress dapp;

  final BigInt inputIndex;

  final _i1.EthereumAddress sender;

  final _i2.Uint8List input;

  final _i1.FilterEvent event;
}
