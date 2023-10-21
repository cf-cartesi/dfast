import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$notice {
  factory Variables$Query$notice({
    required int noticeIndex,
    required int inputIndex,
  }) =>
      Variables$Query$notice._({
        r'noticeIndex': noticeIndex,
        r'inputIndex': inputIndex,
      });

  Variables$Query$notice._(this._$data);

  factory Variables$Query$notice.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$noticeIndex = data['noticeIndex'];
    result$data['noticeIndex'] = (l$noticeIndex as int);
    final l$inputIndex = data['inputIndex'];
    result$data['inputIndex'] = (l$inputIndex as int);
    return Variables$Query$notice._(result$data);
  }

  Map<String, dynamic> _$data;

  int get noticeIndex => (_$data['noticeIndex'] as int);

  int get inputIndex => (_$data['inputIndex'] as int);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$noticeIndex = noticeIndex;
    result$data['noticeIndex'] = l$noticeIndex;
    final l$inputIndex = inputIndex;
    result$data['inputIndex'] = l$inputIndex;
    return result$data;
  }

  CopyWith$Variables$Query$notice<Variables$Query$notice> get copyWith =>
      CopyWith$Variables$Query$notice(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$notice) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$noticeIndex = noticeIndex;
    final lOther$noticeIndex = other.noticeIndex;
    if (l$noticeIndex != lOther$noticeIndex) {
      return false;
    }
    final l$inputIndex = inputIndex;
    final lOther$inputIndex = other.inputIndex;
    if (l$inputIndex != lOther$inputIndex) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$noticeIndex = noticeIndex;
    final l$inputIndex = inputIndex;
    return Object.hashAll([
      l$noticeIndex,
      l$inputIndex,
    ]);
  }
}

abstract class CopyWith$Variables$Query$notice<TRes> {
  factory CopyWith$Variables$Query$notice(
    Variables$Query$notice instance,
    TRes Function(Variables$Query$notice) then,
  ) = _CopyWithImpl$Variables$Query$notice;

  factory CopyWith$Variables$Query$notice.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$notice;

  TRes call({
    int? noticeIndex,
    int? inputIndex,
  });
}

class _CopyWithImpl$Variables$Query$notice<TRes>
    implements CopyWith$Variables$Query$notice<TRes> {
  _CopyWithImpl$Variables$Query$notice(
    this._instance,
    this._then,
  );

  final Variables$Query$notice _instance;

  final TRes Function(Variables$Query$notice) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? noticeIndex = _undefined,
    Object? inputIndex = _undefined,
  }) =>
      _then(Variables$Query$notice._({
        ..._instance._$data,
        if (noticeIndex != _undefined && noticeIndex != null)
          'noticeIndex': (noticeIndex as int),
        if (inputIndex != _undefined && inputIndex != null)
          'inputIndex': (inputIndex as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$notice<TRes>
    implements CopyWith$Variables$Query$notice<TRes> {
  _CopyWithStubImpl$Variables$Query$notice(this._res);

  TRes _res;

  call({
    int? noticeIndex,
    int? inputIndex,
  }) =>
      _res;
}

class Query$notice {
  Query$notice({
    required this.notice,
    this.$__typename = 'Query',
  });

  factory Query$notice.fromJson(Map<String, dynamic> json) {
    final l$notice = json['notice'];
    final l$$__typename = json['__typename'];
    return Query$notice(
      notice: Query$notice$notice.fromJson((l$notice as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$notice$notice notice;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$notice = notice;
    _resultData['notice'] = l$notice.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$notice = notice;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$notice,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$notice) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$notice = notice;
    final lOther$notice = other.notice;
    if (l$notice != lOther$notice) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$notice on Query$notice {
  CopyWith$Query$notice<Query$notice> get copyWith => CopyWith$Query$notice(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$notice<TRes> {
  factory CopyWith$Query$notice(
    Query$notice instance,
    TRes Function(Query$notice) then,
  ) = _CopyWithImpl$Query$notice;

  factory CopyWith$Query$notice.stub(TRes res) = _CopyWithStubImpl$Query$notice;

  TRes call({
    Query$notice$notice? notice,
    String? $__typename,
  });
  CopyWith$Query$notice$notice<TRes> get notice;
}

class _CopyWithImpl$Query$notice<TRes> implements CopyWith$Query$notice<TRes> {
  _CopyWithImpl$Query$notice(
    this._instance,
    this._then,
  );

  final Query$notice _instance;

  final TRes Function(Query$notice) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? notice = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$notice(
        notice: notice == _undefined || notice == null
            ? _instance.notice
            : (notice as Query$notice$notice),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$notice$notice<TRes> get notice {
    final local$notice = _instance.notice;
    return CopyWith$Query$notice$notice(local$notice, (e) => call(notice: e));
  }
}

class _CopyWithStubImpl$Query$notice<TRes>
    implements CopyWith$Query$notice<TRes> {
  _CopyWithStubImpl$Query$notice(this._res);

  TRes _res;

  call({
    Query$notice$notice? notice,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$notice$notice<TRes> get notice =>
      CopyWith$Query$notice$notice.stub(_res);
}

const documentNodeQuerynotice = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'notice'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'noticeIndex')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'inputIndex')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'notice'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'noticeIndex'),
            value: VariableNode(name: NameNode(value: 'noticeIndex')),
          ),
          ArgumentNode(
            name: NameNode(value: 'inputIndex'),
            value: VariableNode(name: NameNode(value: 'inputIndex')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'index'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'input'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'index'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'payload'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'payload'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'proof'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'validity'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'inputIndex'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'outputIndex'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'outputHashesRootHash'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'vouchersEpochRootHash'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'noticesEpochRootHash'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'machineStateHash'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'keccakInHashesSiblings'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'outputHashesInEpochSiblings'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: 'context'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$notice _parserFn$Query$notice(Map<String, dynamic> data) =>
    Query$notice.fromJson(data);
typedef OnQueryComplete$Query$notice = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$notice?,
);

class Options$Query$notice extends graphql.QueryOptions<Query$notice> {
  Options$Query$notice({
    String? operationName,
    required Variables$Query$notice variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$notice? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$notice? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$notice(data),
                  ),
          onError: onError,
          document: documentNodeQuerynotice,
          parserFn: _parserFn$Query$notice,
        );

  final OnQueryComplete$Query$notice? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$notice
    extends graphql.WatchQueryOptions<Query$notice> {
  WatchOptions$Query$notice({
    String? operationName,
    required Variables$Query$notice variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$notice? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQuerynotice,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$notice,
        );
}

class FetchMoreOptions$Query$notice extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$notice({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$notice variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerynotice,
        );
}

extension ClientExtension$Query$notice on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$notice>> query$notice(
          Options$Query$notice options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$notice> watchQuery$notice(
          WatchOptions$Query$notice options) =>
      this.watchQuery(options);
  void writeQuery$notice({
    required Query$notice data,
    required Variables$Query$notice variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQuerynotice),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$notice? readQuery$notice({
    required Variables$Query$notice variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerynotice),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$notice.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$notice> useQuery$notice(
        Options$Query$notice options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$notice> useWatchQuery$notice(
        WatchOptions$Query$notice options) =>
    graphql_flutter.useWatchQuery(options);

class Query$notice$Widget extends graphql_flutter.Query<Query$notice> {
  Query$notice$Widget({
    widgets.Key? key,
    required Options$Query$notice options,
    required graphql_flutter.QueryBuilder<Query$notice> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$notice$notice {
  Query$notice$notice({
    required this.index,
    required this.input,
    required this.payload,
    this.proof,
    this.$__typename = 'Notice',
  });

  factory Query$notice$notice.fromJson(Map<String, dynamic> json) {
    final l$index = json['index'];
    final l$input = json['input'];
    final l$payload = json['payload'];
    final l$proof = json['proof'];
    final l$$__typename = json['__typename'];
    return Query$notice$notice(
      index: (l$index as int),
      input:
          Query$notice$notice$input.fromJson((l$input as Map<String, dynamic>)),
      payload: (l$payload as String),
      proof: l$proof == null
          ? null
          : Query$notice$notice$proof.fromJson(
              (l$proof as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final int index;

  final Query$notice$notice$input input;

  final String payload;

  final Query$notice$notice$proof? proof;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$index = index;
    _resultData['index'] = l$index;
    final l$input = input;
    _resultData['input'] = l$input.toJson();
    final l$payload = payload;
    _resultData['payload'] = l$payload;
    final l$proof = proof;
    _resultData['proof'] = l$proof?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$index = index;
    final l$input = input;
    final l$payload = payload;
    final l$proof = proof;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$index,
      l$input,
      l$payload,
      l$proof,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$notice$notice) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$index = index;
    final lOther$index = other.index;
    if (l$index != lOther$index) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    final l$payload = payload;
    final lOther$payload = other.payload;
    if (l$payload != lOther$payload) {
      return false;
    }
    final l$proof = proof;
    final lOther$proof = other.proof;
    if (l$proof != lOther$proof) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$notice$notice on Query$notice$notice {
  CopyWith$Query$notice$notice<Query$notice$notice> get copyWith =>
      CopyWith$Query$notice$notice(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$notice$notice<TRes> {
  factory CopyWith$Query$notice$notice(
    Query$notice$notice instance,
    TRes Function(Query$notice$notice) then,
  ) = _CopyWithImpl$Query$notice$notice;

  factory CopyWith$Query$notice$notice.stub(TRes res) =
      _CopyWithStubImpl$Query$notice$notice;

  TRes call({
    int? index,
    Query$notice$notice$input? input,
    String? payload,
    Query$notice$notice$proof? proof,
    String? $__typename,
  });
  CopyWith$Query$notice$notice$input<TRes> get input;
  CopyWith$Query$notice$notice$proof<TRes> get proof;
}

class _CopyWithImpl$Query$notice$notice<TRes>
    implements CopyWith$Query$notice$notice<TRes> {
  _CopyWithImpl$Query$notice$notice(
    this._instance,
    this._then,
  );

  final Query$notice$notice _instance;

  final TRes Function(Query$notice$notice) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? index = _undefined,
    Object? input = _undefined,
    Object? payload = _undefined,
    Object? proof = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$notice$notice(
        index: index == _undefined || index == null
            ? _instance.index
            : (index as int),
        input: input == _undefined || input == null
            ? _instance.input
            : (input as Query$notice$notice$input),
        payload: payload == _undefined || payload == null
            ? _instance.payload
            : (payload as String),
        proof: proof == _undefined
            ? _instance.proof
            : (proof as Query$notice$notice$proof?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$notice$notice$input<TRes> get input {
    final local$input = _instance.input;
    return CopyWith$Query$notice$notice$input(
        local$input, (e) => call(input: e));
  }

  CopyWith$Query$notice$notice$proof<TRes> get proof {
    final local$proof = _instance.proof;
    return local$proof == null
        ? CopyWith$Query$notice$notice$proof.stub(_then(_instance))
        : CopyWith$Query$notice$notice$proof(
            local$proof, (e) => call(proof: e));
  }
}

class _CopyWithStubImpl$Query$notice$notice<TRes>
    implements CopyWith$Query$notice$notice<TRes> {
  _CopyWithStubImpl$Query$notice$notice(this._res);

  TRes _res;

  call({
    int? index,
    Query$notice$notice$input? input,
    String? payload,
    Query$notice$notice$proof? proof,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$notice$notice$input<TRes> get input =>
      CopyWith$Query$notice$notice$input.stub(_res);

  CopyWith$Query$notice$notice$proof<TRes> get proof =>
      CopyWith$Query$notice$notice$proof.stub(_res);
}

class Query$notice$notice$input {
  Query$notice$notice$input({
    required this.index,
    required this.payload,
    this.$__typename = 'Input',
  });

  factory Query$notice$notice$input.fromJson(Map<String, dynamic> json) {
    final l$index = json['index'];
    final l$payload = json['payload'];
    final l$$__typename = json['__typename'];
    return Query$notice$notice$input(
      index: (l$index as int),
      payload: (l$payload as String),
      $__typename: (l$$__typename as String),
    );
  }

  final int index;

  final String payload;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$index = index;
    _resultData['index'] = l$index;
    final l$payload = payload;
    _resultData['payload'] = l$payload;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$index = index;
    final l$payload = payload;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$index,
      l$payload,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$notice$notice$input) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$index = index;
    final lOther$index = other.index;
    if (l$index != lOther$index) {
      return false;
    }
    final l$payload = payload;
    final lOther$payload = other.payload;
    if (l$payload != lOther$payload) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$notice$notice$input
    on Query$notice$notice$input {
  CopyWith$Query$notice$notice$input<Query$notice$notice$input> get copyWith =>
      CopyWith$Query$notice$notice$input(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$notice$notice$input<TRes> {
  factory CopyWith$Query$notice$notice$input(
    Query$notice$notice$input instance,
    TRes Function(Query$notice$notice$input) then,
  ) = _CopyWithImpl$Query$notice$notice$input;

  factory CopyWith$Query$notice$notice$input.stub(TRes res) =
      _CopyWithStubImpl$Query$notice$notice$input;

  TRes call({
    int? index,
    String? payload,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$notice$notice$input<TRes>
    implements CopyWith$Query$notice$notice$input<TRes> {
  _CopyWithImpl$Query$notice$notice$input(
    this._instance,
    this._then,
  );

  final Query$notice$notice$input _instance;

  final TRes Function(Query$notice$notice$input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? index = _undefined,
    Object? payload = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$notice$notice$input(
        index: index == _undefined || index == null
            ? _instance.index
            : (index as int),
        payload: payload == _undefined || payload == null
            ? _instance.payload
            : (payload as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$notice$notice$input<TRes>
    implements CopyWith$Query$notice$notice$input<TRes> {
  _CopyWithStubImpl$Query$notice$notice$input(this._res);

  TRes _res;

  call({
    int? index,
    String? payload,
    String? $__typename,
  }) =>
      _res;
}

class Query$notice$notice$proof {
  Query$notice$notice$proof({
    required this.validity,
    required this.context,
    this.$__typename = 'Proof',
  });

  factory Query$notice$notice$proof.fromJson(Map<String, dynamic> json) {
    final l$validity = json['validity'];
    final l$context = json['context'];
    final l$$__typename = json['__typename'];
    return Query$notice$notice$proof(
      validity: Query$notice$notice$proof$validity.fromJson(
          (l$validity as Map<String, dynamic>)),
      context: (l$context as String),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$notice$notice$proof$validity validity;

  final String context;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$validity = validity;
    _resultData['validity'] = l$validity.toJson();
    final l$context = context;
    _resultData['context'] = l$context;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$validity = validity;
    final l$context = context;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$validity,
      l$context,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$notice$notice$proof) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$validity = validity;
    final lOther$validity = other.validity;
    if (l$validity != lOther$validity) {
      return false;
    }
    final l$context = context;
    final lOther$context = other.context;
    if (l$context != lOther$context) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$notice$notice$proof
    on Query$notice$notice$proof {
  CopyWith$Query$notice$notice$proof<Query$notice$notice$proof> get copyWith =>
      CopyWith$Query$notice$notice$proof(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$notice$notice$proof<TRes> {
  factory CopyWith$Query$notice$notice$proof(
    Query$notice$notice$proof instance,
    TRes Function(Query$notice$notice$proof) then,
  ) = _CopyWithImpl$Query$notice$notice$proof;

  factory CopyWith$Query$notice$notice$proof.stub(TRes res) =
      _CopyWithStubImpl$Query$notice$notice$proof;

  TRes call({
    Query$notice$notice$proof$validity? validity,
    String? context,
    String? $__typename,
  });
  CopyWith$Query$notice$notice$proof$validity<TRes> get validity;
}

class _CopyWithImpl$Query$notice$notice$proof<TRes>
    implements CopyWith$Query$notice$notice$proof<TRes> {
  _CopyWithImpl$Query$notice$notice$proof(
    this._instance,
    this._then,
  );

  final Query$notice$notice$proof _instance;

  final TRes Function(Query$notice$notice$proof) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? validity = _undefined,
    Object? context = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$notice$notice$proof(
        validity: validity == _undefined || validity == null
            ? _instance.validity
            : (validity as Query$notice$notice$proof$validity),
        context: context == _undefined || context == null
            ? _instance.context
            : (context as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$notice$notice$proof$validity<TRes> get validity {
    final local$validity = _instance.validity;
    return CopyWith$Query$notice$notice$proof$validity(
        local$validity, (e) => call(validity: e));
  }
}

class _CopyWithStubImpl$Query$notice$notice$proof<TRes>
    implements CopyWith$Query$notice$notice$proof<TRes> {
  _CopyWithStubImpl$Query$notice$notice$proof(this._res);

  TRes _res;

  call({
    Query$notice$notice$proof$validity? validity,
    String? context,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$notice$notice$proof$validity<TRes> get validity =>
      CopyWith$Query$notice$notice$proof$validity.stub(_res);
}

class Query$notice$notice$proof$validity {
  Query$notice$notice$proof$validity({
    required this.inputIndex,
    required this.outputIndex,
    required this.outputHashesRootHash,
    required this.vouchersEpochRootHash,
    required this.noticesEpochRootHash,
    required this.machineStateHash,
    required this.keccakInHashesSiblings,
    required this.outputHashesInEpochSiblings,
    this.$__typename = 'OutputValidityProof',
  });

  factory Query$notice$notice$proof$validity.fromJson(
      Map<String, dynamic> json) {
    final l$inputIndex = json['inputIndex'];
    final l$outputIndex = json['outputIndex'];
    final l$outputHashesRootHash = json['outputHashesRootHash'];
    final l$vouchersEpochRootHash = json['vouchersEpochRootHash'];
    final l$noticesEpochRootHash = json['noticesEpochRootHash'];
    final l$machineStateHash = json['machineStateHash'];
    final l$keccakInHashesSiblings = json['keccakInHashesSiblings'];
    final l$outputHashesInEpochSiblings = json['outputHashesInEpochSiblings'];
    final l$$__typename = json['__typename'];
    return Query$notice$notice$proof$validity(
      inputIndex: (l$inputIndex as int),
      outputIndex: (l$outputIndex as int),
      outputHashesRootHash: (l$outputHashesRootHash as String),
      vouchersEpochRootHash: (l$vouchersEpochRootHash as String),
      noticesEpochRootHash: (l$noticesEpochRootHash as String),
      machineStateHash: (l$machineStateHash as String),
      keccakInHashesSiblings: (l$keccakInHashesSiblings as List<dynamic>)
          .map((e) => (e as String))
          .toList(),
      outputHashesInEpochSiblings:
          (l$outputHashesInEpochSiblings as List<dynamic>)
              .map((e) => (e as String))
              .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final int inputIndex;

  final int outputIndex;

  final String outputHashesRootHash;

  final String vouchersEpochRootHash;

  final String noticesEpochRootHash;

  final String machineStateHash;

  final List<String> keccakInHashesSiblings;

  final List<String> outputHashesInEpochSiblings;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$inputIndex = inputIndex;
    _resultData['inputIndex'] = l$inputIndex;
    final l$outputIndex = outputIndex;
    _resultData['outputIndex'] = l$outputIndex;
    final l$outputHashesRootHash = outputHashesRootHash;
    _resultData['outputHashesRootHash'] = l$outputHashesRootHash;
    final l$vouchersEpochRootHash = vouchersEpochRootHash;
    _resultData['vouchersEpochRootHash'] = l$vouchersEpochRootHash;
    final l$noticesEpochRootHash = noticesEpochRootHash;
    _resultData['noticesEpochRootHash'] = l$noticesEpochRootHash;
    final l$machineStateHash = machineStateHash;
    _resultData['machineStateHash'] = l$machineStateHash;
    final l$keccakInHashesSiblings = keccakInHashesSiblings;
    _resultData['keccakInHashesSiblings'] =
        l$keccakInHashesSiblings.map((e) => e).toList();
    final l$outputHashesInEpochSiblings = outputHashesInEpochSiblings;
    _resultData['outputHashesInEpochSiblings'] =
        l$outputHashesInEpochSiblings.map((e) => e).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$inputIndex = inputIndex;
    final l$outputIndex = outputIndex;
    final l$outputHashesRootHash = outputHashesRootHash;
    final l$vouchersEpochRootHash = vouchersEpochRootHash;
    final l$noticesEpochRootHash = noticesEpochRootHash;
    final l$machineStateHash = machineStateHash;
    final l$keccakInHashesSiblings = keccakInHashesSiblings;
    final l$outputHashesInEpochSiblings = outputHashesInEpochSiblings;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$inputIndex,
      l$outputIndex,
      l$outputHashesRootHash,
      l$vouchersEpochRootHash,
      l$noticesEpochRootHash,
      l$machineStateHash,
      Object.hashAll(l$keccakInHashesSiblings.map((v) => v)),
      Object.hashAll(l$outputHashesInEpochSiblings.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$notice$notice$proof$validity) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$inputIndex = inputIndex;
    final lOther$inputIndex = other.inputIndex;
    if (l$inputIndex != lOther$inputIndex) {
      return false;
    }
    final l$outputIndex = outputIndex;
    final lOther$outputIndex = other.outputIndex;
    if (l$outputIndex != lOther$outputIndex) {
      return false;
    }
    final l$outputHashesRootHash = outputHashesRootHash;
    final lOther$outputHashesRootHash = other.outputHashesRootHash;
    if (l$outputHashesRootHash != lOther$outputHashesRootHash) {
      return false;
    }
    final l$vouchersEpochRootHash = vouchersEpochRootHash;
    final lOther$vouchersEpochRootHash = other.vouchersEpochRootHash;
    if (l$vouchersEpochRootHash != lOther$vouchersEpochRootHash) {
      return false;
    }
    final l$noticesEpochRootHash = noticesEpochRootHash;
    final lOther$noticesEpochRootHash = other.noticesEpochRootHash;
    if (l$noticesEpochRootHash != lOther$noticesEpochRootHash) {
      return false;
    }
    final l$machineStateHash = machineStateHash;
    final lOther$machineStateHash = other.machineStateHash;
    if (l$machineStateHash != lOther$machineStateHash) {
      return false;
    }
    final l$keccakInHashesSiblings = keccakInHashesSiblings;
    final lOther$keccakInHashesSiblings = other.keccakInHashesSiblings;
    if (l$keccakInHashesSiblings.length !=
        lOther$keccakInHashesSiblings.length) {
      return false;
    }
    for (int i = 0; i < l$keccakInHashesSiblings.length; i++) {
      final l$keccakInHashesSiblings$entry = l$keccakInHashesSiblings[i];
      final lOther$keccakInHashesSiblings$entry =
          lOther$keccakInHashesSiblings[i];
      if (l$keccakInHashesSiblings$entry !=
          lOther$keccakInHashesSiblings$entry) {
        return false;
      }
    }
    final l$outputHashesInEpochSiblings = outputHashesInEpochSiblings;
    final lOther$outputHashesInEpochSiblings =
        other.outputHashesInEpochSiblings;
    if (l$outputHashesInEpochSiblings.length !=
        lOther$outputHashesInEpochSiblings.length) {
      return false;
    }
    for (int i = 0; i < l$outputHashesInEpochSiblings.length; i++) {
      final l$outputHashesInEpochSiblings$entry =
          l$outputHashesInEpochSiblings[i];
      final lOther$outputHashesInEpochSiblings$entry =
          lOther$outputHashesInEpochSiblings[i];
      if (l$outputHashesInEpochSiblings$entry !=
          lOther$outputHashesInEpochSiblings$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$notice$notice$proof$validity
    on Query$notice$notice$proof$validity {
  CopyWith$Query$notice$notice$proof$validity<
          Query$notice$notice$proof$validity>
      get copyWith => CopyWith$Query$notice$notice$proof$validity(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$notice$notice$proof$validity<TRes> {
  factory CopyWith$Query$notice$notice$proof$validity(
    Query$notice$notice$proof$validity instance,
    TRes Function(Query$notice$notice$proof$validity) then,
  ) = _CopyWithImpl$Query$notice$notice$proof$validity;

  factory CopyWith$Query$notice$notice$proof$validity.stub(TRes res) =
      _CopyWithStubImpl$Query$notice$notice$proof$validity;

  TRes call({
    int? inputIndex,
    int? outputIndex,
    String? outputHashesRootHash,
    String? vouchersEpochRootHash,
    String? noticesEpochRootHash,
    String? machineStateHash,
    List<String>? keccakInHashesSiblings,
    List<String>? outputHashesInEpochSiblings,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$notice$notice$proof$validity<TRes>
    implements CopyWith$Query$notice$notice$proof$validity<TRes> {
  _CopyWithImpl$Query$notice$notice$proof$validity(
    this._instance,
    this._then,
  );

  final Query$notice$notice$proof$validity _instance;

  final TRes Function(Query$notice$notice$proof$validity) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? inputIndex = _undefined,
    Object? outputIndex = _undefined,
    Object? outputHashesRootHash = _undefined,
    Object? vouchersEpochRootHash = _undefined,
    Object? noticesEpochRootHash = _undefined,
    Object? machineStateHash = _undefined,
    Object? keccakInHashesSiblings = _undefined,
    Object? outputHashesInEpochSiblings = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$notice$notice$proof$validity(
        inputIndex: inputIndex == _undefined || inputIndex == null
            ? _instance.inputIndex
            : (inputIndex as int),
        outputIndex: outputIndex == _undefined || outputIndex == null
            ? _instance.outputIndex
            : (outputIndex as int),
        outputHashesRootHash:
            outputHashesRootHash == _undefined || outputHashesRootHash == null
                ? _instance.outputHashesRootHash
                : (outputHashesRootHash as String),
        vouchersEpochRootHash:
            vouchersEpochRootHash == _undefined || vouchersEpochRootHash == null
                ? _instance.vouchersEpochRootHash
                : (vouchersEpochRootHash as String),
        noticesEpochRootHash:
            noticesEpochRootHash == _undefined || noticesEpochRootHash == null
                ? _instance.noticesEpochRootHash
                : (noticesEpochRootHash as String),
        machineStateHash:
            machineStateHash == _undefined || machineStateHash == null
                ? _instance.machineStateHash
                : (machineStateHash as String),
        keccakInHashesSiblings: keccakInHashesSiblings == _undefined ||
                keccakInHashesSiblings == null
            ? _instance.keccakInHashesSiblings
            : (keccakInHashesSiblings as List<String>),
        outputHashesInEpochSiblings:
            outputHashesInEpochSiblings == _undefined ||
                    outputHashesInEpochSiblings == null
                ? _instance.outputHashesInEpochSiblings
                : (outputHashesInEpochSiblings as List<String>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$notice$notice$proof$validity<TRes>
    implements CopyWith$Query$notice$notice$proof$validity<TRes> {
  _CopyWithStubImpl$Query$notice$notice$proof$validity(this._res);

  TRes _res;

  call({
    int? inputIndex,
    int? outputIndex,
    String? outputHashesRootHash,
    String? vouchersEpochRootHash,
    String? noticesEpochRootHash,
    String? machineStateHash,
    List<String>? keccakInHashesSiblings,
    List<String>? outputHashesInEpochSiblings,
    String? $__typename,
  }) =>
      _res;
}

class Query$notices {
  Query$notices({
    required this.notices,
    this.$__typename = 'Query',
  });

  factory Query$notices.fromJson(Map<String, dynamic> json) {
    final l$notices = json['notices'];
    final l$$__typename = json['__typename'];
    return Query$notices(
      notices:
          Query$notices$notices.fromJson((l$notices as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$notices$notices notices;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$notices = notices;
    _resultData['notices'] = l$notices.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$notices = notices;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$notices,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$notices) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$notices = notices;
    final lOther$notices = other.notices;
    if (l$notices != lOther$notices) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$notices on Query$notices {
  CopyWith$Query$notices<Query$notices> get copyWith => CopyWith$Query$notices(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$notices<TRes> {
  factory CopyWith$Query$notices(
    Query$notices instance,
    TRes Function(Query$notices) then,
  ) = _CopyWithImpl$Query$notices;

  factory CopyWith$Query$notices.stub(TRes res) =
      _CopyWithStubImpl$Query$notices;

  TRes call({
    Query$notices$notices? notices,
    String? $__typename,
  });
  CopyWith$Query$notices$notices<TRes> get notices;
}

class _CopyWithImpl$Query$notices<TRes>
    implements CopyWith$Query$notices<TRes> {
  _CopyWithImpl$Query$notices(
    this._instance,
    this._then,
  );

  final Query$notices _instance;

  final TRes Function(Query$notices) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? notices = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$notices(
        notices: notices == _undefined || notices == null
            ? _instance.notices
            : (notices as Query$notices$notices),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$notices$notices<TRes> get notices {
    final local$notices = _instance.notices;
    return CopyWith$Query$notices$notices(
        local$notices, (e) => call(notices: e));
  }
}

class _CopyWithStubImpl$Query$notices<TRes>
    implements CopyWith$Query$notices<TRes> {
  _CopyWithStubImpl$Query$notices(this._res);

  TRes _res;

  call({
    Query$notices$notices? notices,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$notices$notices<TRes> get notices =>
      CopyWith$Query$notices$notices.stub(_res);
}

const documentNodeQuerynotices = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'notices'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'notices'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'edges'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'node'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'index'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'input'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'index'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'payload'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ]),
                  ),
                  FieldNode(
                    name: NameNode(value: 'payload'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$notices _parserFn$Query$notices(Map<String, dynamic> data) =>
    Query$notices.fromJson(data);
typedef OnQueryComplete$Query$notices = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$notices?,
);

class Options$Query$notices extends graphql.QueryOptions<Query$notices> {
  Options$Query$notices({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$notices? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$notices? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$notices(data),
                  ),
          onError: onError,
          document: documentNodeQuerynotices,
          parserFn: _parserFn$Query$notices,
        );

  final OnQueryComplete$Query$notices? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$notices
    extends graphql.WatchQueryOptions<Query$notices> {
  WatchOptions$Query$notices({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$notices? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQuerynotices,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$notices,
        );
}

class FetchMoreOptions$Query$notices extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$notices({required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQuerynotices,
        );
}

extension ClientExtension$Query$notices on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$notices>> query$notices(
          [Options$Query$notices? options]) async =>
      await this.query(options ?? Options$Query$notices());
  graphql.ObservableQuery<Query$notices> watchQuery$notices(
          [WatchOptions$Query$notices? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$notices());
  void writeQuery$notices({
    required Query$notices data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(document: documentNodeQuerynotices)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$notices? readQuery$notices({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(document: documentNodeQuerynotices)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$notices.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$notices> useQuery$notices(
        [Options$Query$notices? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$notices());
graphql.ObservableQuery<Query$notices> useWatchQuery$notices(
        [WatchOptions$Query$notices? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$notices());

class Query$notices$Widget extends graphql_flutter.Query<Query$notices> {
  Query$notices$Widget({
    widgets.Key? key,
    Options$Query$notices? options,
    required graphql_flutter.QueryBuilder<Query$notices> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$notices(),
          builder: builder,
        );
}

class Query$notices$notices {
  Query$notices$notices({
    required this.edges,
    this.$__typename = 'NoticeConnection',
  });

  factory Query$notices$notices.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$notices$notices(
      edges: (l$edges as List<dynamic>)
          .map((e) =>
              Query$notices$notices$edges.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$notices$notices$edges> edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$edges.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$notices$notices) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges.length != lOther$edges.length) {
      return false;
    }
    for (int i = 0; i < l$edges.length; i++) {
      final l$edges$entry = l$edges[i];
      final lOther$edges$entry = lOther$edges[i];
      if (l$edges$entry != lOther$edges$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$notices$notices on Query$notices$notices {
  CopyWith$Query$notices$notices<Query$notices$notices> get copyWith =>
      CopyWith$Query$notices$notices(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$notices$notices<TRes> {
  factory CopyWith$Query$notices$notices(
    Query$notices$notices instance,
    TRes Function(Query$notices$notices) then,
  ) = _CopyWithImpl$Query$notices$notices;

  factory CopyWith$Query$notices$notices.stub(TRes res) =
      _CopyWithStubImpl$Query$notices$notices;

  TRes call({
    List<Query$notices$notices$edges>? edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$notices$notices$edges> Function(
              Iterable<
                  CopyWith$Query$notices$notices$edges<
                      Query$notices$notices$edges>>)
          _fn);
}

class _CopyWithImpl$Query$notices$notices<TRes>
    implements CopyWith$Query$notices$notices<TRes> {
  _CopyWithImpl$Query$notices$notices(
    this._instance,
    this._then,
  );

  final Query$notices$notices _instance;

  final TRes Function(Query$notices$notices) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$notices$notices(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<Query$notices$notices$edges>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$notices$notices$edges> Function(
                  Iterable<
                      CopyWith$Query$notices$notices$edges<
                          Query$notices$notices$edges>>)
              _fn) =>
      call(
          edges: _fn(
              _instance.edges.map((e) => CopyWith$Query$notices$notices$edges(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$notices$notices<TRes>
    implements CopyWith$Query$notices$notices<TRes> {
  _CopyWithStubImpl$Query$notices$notices(this._res);

  TRes _res;

  call({
    List<Query$notices$notices$edges>? edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Query$notices$notices$edges {
  Query$notices$notices$edges({
    required this.node,
    this.$__typename = 'NoticeEdge',
  });

  factory Query$notices$notices$edges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$notices$notices$edges(
      node: Query$notices$notices$edges$node.fromJson(
          (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$notices$notices$edges$node node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$node,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$notices$notices$edges) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$notices$notices$edges
    on Query$notices$notices$edges {
  CopyWith$Query$notices$notices$edges<Query$notices$notices$edges>
      get copyWith => CopyWith$Query$notices$notices$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$notices$notices$edges<TRes> {
  factory CopyWith$Query$notices$notices$edges(
    Query$notices$notices$edges instance,
    TRes Function(Query$notices$notices$edges) then,
  ) = _CopyWithImpl$Query$notices$notices$edges;

  factory CopyWith$Query$notices$notices$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$notices$notices$edges;

  TRes call({
    Query$notices$notices$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$notices$notices$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$notices$notices$edges<TRes>
    implements CopyWith$Query$notices$notices$edges<TRes> {
  _CopyWithImpl$Query$notices$notices$edges(
    this._instance,
    this._then,
  );

  final Query$notices$notices$edges _instance;

  final TRes Function(Query$notices$notices$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$notices$notices$edges(
        node: node == _undefined || node == null
            ? _instance.node
            : (node as Query$notices$notices$edges$node),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$notices$notices$edges$node<TRes> get node {
    final local$node = _instance.node;
    return CopyWith$Query$notices$notices$edges$node(
        local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$notices$notices$edges<TRes>
    implements CopyWith$Query$notices$notices$edges<TRes> {
  _CopyWithStubImpl$Query$notices$notices$edges(this._res);

  TRes _res;

  call({
    Query$notices$notices$edges$node? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$notices$notices$edges$node<TRes> get node =>
      CopyWith$Query$notices$notices$edges$node.stub(_res);
}

class Query$notices$notices$edges$node {
  Query$notices$notices$edges$node({
    required this.index,
    required this.input,
    required this.payload,
    this.$__typename = 'Notice',
  });

  factory Query$notices$notices$edges$node.fromJson(Map<String, dynamic> json) {
    final l$index = json['index'];
    final l$input = json['input'];
    final l$payload = json['payload'];
    final l$$__typename = json['__typename'];
    return Query$notices$notices$edges$node(
      index: (l$index as int),
      input: Query$notices$notices$edges$node$input.fromJson(
          (l$input as Map<String, dynamic>)),
      payload: (l$payload as String),
      $__typename: (l$$__typename as String),
    );
  }

  final int index;

  final Query$notices$notices$edges$node$input input;

  final String payload;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$index = index;
    _resultData['index'] = l$index;
    final l$input = input;
    _resultData['input'] = l$input.toJson();
    final l$payload = payload;
    _resultData['payload'] = l$payload;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$index = index;
    final l$input = input;
    final l$payload = payload;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$index,
      l$input,
      l$payload,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$notices$notices$edges$node) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$index = index;
    final lOther$index = other.index;
    if (l$index != lOther$index) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    final l$payload = payload;
    final lOther$payload = other.payload;
    if (l$payload != lOther$payload) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$notices$notices$edges$node
    on Query$notices$notices$edges$node {
  CopyWith$Query$notices$notices$edges$node<Query$notices$notices$edges$node>
      get copyWith => CopyWith$Query$notices$notices$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$notices$notices$edges$node<TRes> {
  factory CopyWith$Query$notices$notices$edges$node(
    Query$notices$notices$edges$node instance,
    TRes Function(Query$notices$notices$edges$node) then,
  ) = _CopyWithImpl$Query$notices$notices$edges$node;

  factory CopyWith$Query$notices$notices$edges$node.stub(TRes res) =
      _CopyWithStubImpl$Query$notices$notices$edges$node;

  TRes call({
    int? index,
    Query$notices$notices$edges$node$input? input,
    String? payload,
    String? $__typename,
  });
  CopyWith$Query$notices$notices$edges$node$input<TRes> get input;
}

class _CopyWithImpl$Query$notices$notices$edges$node<TRes>
    implements CopyWith$Query$notices$notices$edges$node<TRes> {
  _CopyWithImpl$Query$notices$notices$edges$node(
    this._instance,
    this._then,
  );

  final Query$notices$notices$edges$node _instance;

  final TRes Function(Query$notices$notices$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? index = _undefined,
    Object? input = _undefined,
    Object? payload = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$notices$notices$edges$node(
        index: index == _undefined || index == null
            ? _instance.index
            : (index as int),
        input: input == _undefined || input == null
            ? _instance.input
            : (input as Query$notices$notices$edges$node$input),
        payload: payload == _undefined || payload == null
            ? _instance.payload
            : (payload as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$notices$notices$edges$node$input<TRes> get input {
    final local$input = _instance.input;
    return CopyWith$Query$notices$notices$edges$node$input(
        local$input, (e) => call(input: e));
  }
}

class _CopyWithStubImpl$Query$notices$notices$edges$node<TRes>
    implements CopyWith$Query$notices$notices$edges$node<TRes> {
  _CopyWithStubImpl$Query$notices$notices$edges$node(this._res);

  TRes _res;

  call({
    int? index,
    Query$notices$notices$edges$node$input? input,
    String? payload,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$notices$notices$edges$node$input<TRes> get input =>
      CopyWith$Query$notices$notices$edges$node$input.stub(_res);
}

class Query$notices$notices$edges$node$input {
  Query$notices$notices$edges$node$input({
    required this.index,
    required this.payload,
    this.$__typename = 'Input',
  });

  factory Query$notices$notices$edges$node$input.fromJson(
      Map<String, dynamic> json) {
    final l$index = json['index'];
    final l$payload = json['payload'];
    final l$$__typename = json['__typename'];
    return Query$notices$notices$edges$node$input(
      index: (l$index as int),
      payload: (l$payload as String),
      $__typename: (l$$__typename as String),
    );
  }

  final int index;

  final String payload;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$index = index;
    _resultData['index'] = l$index;
    final l$payload = payload;
    _resultData['payload'] = l$payload;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$index = index;
    final l$payload = payload;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$index,
      l$payload,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$notices$notices$edges$node$input) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$index = index;
    final lOther$index = other.index;
    if (l$index != lOther$index) {
      return false;
    }
    final l$payload = payload;
    final lOther$payload = other.payload;
    if (l$payload != lOther$payload) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$notices$notices$edges$node$input
    on Query$notices$notices$edges$node$input {
  CopyWith$Query$notices$notices$edges$node$input<
          Query$notices$notices$edges$node$input>
      get copyWith => CopyWith$Query$notices$notices$edges$node$input(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$notices$notices$edges$node$input<TRes> {
  factory CopyWith$Query$notices$notices$edges$node$input(
    Query$notices$notices$edges$node$input instance,
    TRes Function(Query$notices$notices$edges$node$input) then,
  ) = _CopyWithImpl$Query$notices$notices$edges$node$input;

  factory CopyWith$Query$notices$notices$edges$node$input.stub(TRes res) =
      _CopyWithStubImpl$Query$notices$notices$edges$node$input;

  TRes call({
    int? index,
    String? payload,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$notices$notices$edges$node$input<TRes>
    implements CopyWith$Query$notices$notices$edges$node$input<TRes> {
  _CopyWithImpl$Query$notices$notices$edges$node$input(
    this._instance,
    this._then,
  );

  final Query$notices$notices$edges$node$input _instance;

  final TRes Function(Query$notices$notices$edges$node$input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? index = _undefined,
    Object? payload = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$notices$notices$edges$node$input(
        index: index == _undefined || index == null
            ? _instance.index
            : (index as int),
        payload: payload == _undefined || payload == null
            ? _instance.payload
            : (payload as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$notices$notices$edges$node$input<TRes>
    implements CopyWith$Query$notices$notices$edges$node$input<TRes> {
  _CopyWithStubImpl$Query$notices$notices$edges$node$input(this._res);

  TRes _res;

  call({
    int? index,
    String? payload,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$noticesByInput {
  factory Variables$Query$noticesByInput({required int inputIndex}) =>
      Variables$Query$noticesByInput._({
        r'inputIndex': inputIndex,
      });

  Variables$Query$noticesByInput._(this._$data);

  factory Variables$Query$noticesByInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$inputIndex = data['inputIndex'];
    result$data['inputIndex'] = (l$inputIndex as int);
    return Variables$Query$noticesByInput._(result$data);
  }

  Map<String, dynamic> _$data;

  int get inputIndex => (_$data['inputIndex'] as int);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$inputIndex = inputIndex;
    result$data['inputIndex'] = l$inputIndex;
    return result$data;
  }

  CopyWith$Variables$Query$noticesByInput<Variables$Query$noticesByInput>
      get copyWith => CopyWith$Variables$Query$noticesByInput(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$noticesByInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$inputIndex = inputIndex;
    final lOther$inputIndex = other.inputIndex;
    if (l$inputIndex != lOther$inputIndex) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$inputIndex = inputIndex;
    return Object.hashAll([l$inputIndex]);
  }
}

abstract class CopyWith$Variables$Query$noticesByInput<TRes> {
  factory CopyWith$Variables$Query$noticesByInput(
    Variables$Query$noticesByInput instance,
    TRes Function(Variables$Query$noticesByInput) then,
  ) = _CopyWithImpl$Variables$Query$noticesByInput;

  factory CopyWith$Variables$Query$noticesByInput.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$noticesByInput;

  TRes call({int? inputIndex});
}

class _CopyWithImpl$Variables$Query$noticesByInput<TRes>
    implements CopyWith$Variables$Query$noticesByInput<TRes> {
  _CopyWithImpl$Variables$Query$noticesByInput(
    this._instance,
    this._then,
  );

  final Variables$Query$noticesByInput _instance;

  final TRes Function(Variables$Query$noticesByInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? inputIndex = _undefined}) =>
      _then(Variables$Query$noticesByInput._({
        ..._instance._$data,
        if (inputIndex != _undefined && inputIndex != null)
          'inputIndex': (inputIndex as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$noticesByInput<TRes>
    implements CopyWith$Variables$Query$noticesByInput<TRes> {
  _CopyWithStubImpl$Variables$Query$noticesByInput(this._res);

  TRes _res;

  call({int? inputIndex}) => _res;
}

class Query$noticesByInput {
  Query$noticesByInput({
    required this.input,
    this.$__typename = 'Query',
  });

  factory Query$noticesByInput.fromJson(Map<String, dynamic> json) {
    final l$input = json['input'];
    final l$$__typename = json['__typename'];
    return Query$noticesByInput(
      input: Query$noticesByInput$input.fromJson(
          (l$input as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$noticesByInput$input input;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$input = input;
    _resultData['input'] = l$input.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$input = input;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$input,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$noticesByInput) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$noticesByInput on Query$noticesByInput {
  CopyWith$Query$noticesByInput<Query$noticesByInput> get copyWith =>
      CopyWith$Query$noticesByInput(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$noticesByInput<TRes> {
  factory CopyWith$Query$noticesByInput(
    Query$noticesByInput instance,
    TRes Function(Query$noticesByInput) then,
  ) = _CopyWithImpl$Query$noticesByInput;

  factory CopyWith$Query$noticesByInput.stub(TRes res) =
      _CopyWithStubImpl$Query$noticesByInput;

  TRes call({
    Query$noticesByInput$input? input,
    String? $__typename,
  });
  CopyWith$Query$noticesByInput$input<TRes> get input;
}

class _CopyWithImpl$Query$noticesByInput<TRes>
    implements CopyWith$Query$noticesByInput<TRes> {
  _CopyWithImpl$Query$noticesByInput(
    this._instance,
    this._then,
  );

  final Query$noticesByInput _instance;

  final TRes Function(Query$noticesByInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? input = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$noticesByInput(
        input: input == _undefined || input == null
            ? _instance.input
            : (input as Query$noticesByInput$input),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$noticesByInput$input<TRes> get input {
    final local$input = _instance.input;
    return CopyWith$Query$noticesByInput$input(
        local$input, (e) => call(input: e));
  }
}

class _CopyWithStubImpl$Query$noticesByInput<TRes>
    implements CopyWith$Query$noticesByInput<TRes> {
  _CopyWithStubImpl$Query$noticesByInput(this._res);

  TRes _res;

  call({
    Query$noticesByInput$input? input,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$noticesByInput$input<TRes> get input =>
      CopyWith$Query$noticesByInput$input.stub(_res);
}

const documentNodeQuerynoticesByInput = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'noticesByInput'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'inputIndex')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'input'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'index'),
            value: VariableNode(name: NameNode(value: 'inputIndex')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'notices'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'edges'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'node'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'index'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'input'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                            name: NameNode(value: 'index'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: '__typename'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                        ]),
                      ),
                      FieldNode(
                        name: NameNode(value: 'payload'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ]),
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$noticesByInput _parserFn$Query$noticesByInput(
        Map<String, dynamic> data) =>
    Query$noticesByInput.fromJson(data);
typedef OnQueryComplete$Query$noticesByInput = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$noticesByInput?,
);

class Options$Query$noticesByInput
    extends graphql.QueryOptions<Query$noticesByInput> {
  Options$Query$noticesByInput({
    String? operationName,
    required Variables$Query$noticesByInput variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$noticesByInput? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$noticesByInput? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$noticesByInput(data),
                  ),
          onError: onError,
          document: documentNodeQuerynoticesByInput,
          parserFn: _parserFn$Query$noticesByInput,
        );

  final OnQueryComplete$Query$noticesByInput? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$noticesByInput
    extends graphql.WatchQueryOptions<Query$noticesByInput> {
  WatchOptions$Query$noticesByInput({
    String? operationName,
    required Variables$Query$noticesByInput variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$noticesByInput? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQuerynoticesByInput,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$noticesByInput,
        );
}

class FetchMoreOptions$Query$noticesByInput extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$noticesByInput({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$noticesByInput variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerynoticesByInput,
        );
}

extension ClientExtension$Query$noticesByInput on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$noticesByInput>> query$noticesByInput(
          Options$Query$noticesByInput options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$noticesByInput> watchQuery$noticesByInput(
          WatchOptions$Query$noticesByInput options) =>
      this.watchQuery(options);
  void writeQuery$noticesByInput({
    required Query$noticesByInput data,
    required Variables$Query$noticesByInput variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerynoticesByInput),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$noticesByInput? readQuery$noticesByInput({
    required Variables$Query$noticesByInput variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerynoticesByInput),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$noticesByInput.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$noticesByInput> useQuery$noticesByInput(
        Options$Query$noticesByInput options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$noticesByInput> useWatchQuery$noticesByInput(
        WatchOptions$Query$noticesByInput options) =>
    graphql_flutter.useWatchQuery(options);

class Query$noticesByInput$Widget
    extends graphql_flutter.Query<Query$noticesByInput> {
  Query$noticesByInput$Widget({
    widgets.Key? key,
    required Options$Query$noticesByInput options,
    required graphql_flutter.QueryBuilder<Query$noticesByInput> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$noticesByInput$input {
  Query$noticesByInput$input({
    required this.notices,
    this.$__typename = 'Input',
  });

  factory Query$noticesByInput$input.fromJson(Map<String, dynamic> json) {
    final l$notices = json['notices'];
    final l$$__typename = json['__typename'];
    return Query$noticesByInput$input(
      notices: Query$noticesByInput$input$notices.fromJson(
          (l$notices as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$noticesByInput$input$notices notices;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$notices = notices;
    _resultData['notices'] = l$notices.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$notices = notices;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$notices,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$noticesByInput$input) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$notices = notices;
    final lOther$notices = other.notices;
    if (l$notices != lOther$notices) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$noticesByInput$input
    on Query$noticesByInput$input {
  CopyWith$Query$noticesByInput$input<Query$noticesByInput$input>
      get copyWith => CopyWith$Query$noticesByInput$input(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$noticesByInput$input<TRes> {
  factory CopyWith$Query$noticesByInput$input(
    Query$noticesByInput$input instance,
    TRes Function(Query$noticesByInput$input) then,
  ) = _CopyWithImpl$Query$noticesByInput$input;

  factory CopyWith$Query$noticesByInput$input.stub(TRes res) =
      _CopyWithStubImpl$Query$noticesByInput$input;

  TRes call({
    Query$noticesByInput$input$notices? notices,
    String? $__typename,
  });
  CopyWith$Query$noticesByInput$input$notices<TRes> get notices;
}

class _CopyWithImpl$Query$noticesByInput$input<TRes>
    implements CopyWith$Query$noticesByInput$input<TRes> {
  _CopyWithImpl$Query$noticesByInput$input(
    this._instance,
    this._then,
  );

  final Query$noticesByInput$input _instance;

  final TRes Function(Query$noticesByInput$input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? notices = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$noticesByInput$input(
        notices: notices == _undefined || notices == null
            ? _instance.notices
            : (notices as Query$noticesByInput$input$notices),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$noticesByInput$input$notices<TRes> get notices {
    final local$notices = _instance.notices;
    return CopyWith$Query$noticesByInput$input$notices(
        local$notices, (e) => call(notices: e));
  }
}

class _CopyWithStubImpl$Query$noticesByInput$input<TRes>
    implements CopyWith$Query$noticesByInput$input<TRes> {
  _CopyWithStubImpl$Query$noticesByInput$input(this._res);

  TRes _res;

  call({
    Query$noticesByInput$input$notices? notices,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$noticesByInput$input$notices<TRes> get notices =>
      CopyWith$Query$noticesByInput$input$notices.stub(_res);
}

class Query$noticesByInput$input$notices {
  Query$noticesByInput$input$notices({
    required this.edges,
    this.$__typename = 'NoticeConnection',
  });

  factory Query$noticesByInput$input$notices.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$noticesByInput$input$notices(
      edges: (l$edges as List<dynamic>)
          .map((e) => Query$noticesByInput$input$notices$edges.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$noticesByInput$input$notices$edges> edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$edges.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$noticesByInput$input$notices) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges.length != lOther$edges.length) {
      return false;
    }
    for (int i = 0; i < l$edges.length; i++) {
      final l$edges$entry = l$edges[i];
      final lOther$edges$entry = lOther$edges[i];
      if (l$edges$entry != lOther$edges$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$noticesByInput$input$notices
    on Query$noticesByInput$input$notices {
  CopyWith$Query$noticesByInput$input$notices<
          Query$noticesByInput$input$notices>
      get copyWith => CopyWith$Query$noticesByInput$input$notices(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$noticesByInput$input$notices<TRes> {
  factory CopyWith$Query$noticesByInput$input$notices(
    Query$noticesByInput$input$notices instance,
    TRes Function(Query$noticesByInput$input$notices) then,
  ) = _CopyWithImpl$Query$noticesByInput$input$notices;

  factory CopyWith$Query$noticesByInput$input$notices.stub(TRes res) =
      _CopyWithStubImpl$Query$noticesByInput$input$notices;

  TRes call({
    List<Query$noticesByInput$input$notices$edges>? edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$noticesByInput$input$notices$edges> Function(
              Iterable<
                  CopyWith$Query$noticesByInput$input$notices$edges<
                      Query$noticesByInput$input$notices$edges>>)
          _fn);
}

class _CopyWithImpl$Query$noticesByInput$input$notices<TRes>
    implements CopyWith$Query$noticesByInput$input$notices<TRes> {
  _CopyWithImpl$Query$noticesByInput$input$notices(
    this._instance,
    this._then,
  );

  final Query$noticesByInput$input$notices _instance;

  final TRes Function(Query$noticesByInput$input$notices) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$noticesByInput$input$notices(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<Query$noticesByInput$input$notices$edges>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$noticesByInput$input$notices$edges> Function(
                  Iterable<
                      CopyWith$Query$noticesByInput$input$notices$edges<
                          Query$noticesByInput$input$notices$edges>>)
              _fn) =>
      call(
          edges: _fn(_instance.edges
              .map((e) => CopyWith$Query$noticesByInput$input$notices$edges(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$noticesByInput$input$notices<TRes>
    implements CopyWith$Query$noticesByInput$input$notices<TRes> {
  _CopyWithStubImpl$Query$noticesByInput$input$notices(this._res);

  TRes _res;

  call({
    List<Query$noticesByInput$input$notices$edges>? edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Query$noticesByInput$input$notices$edges {
  Query$noticesByInput$input$notices$edges({
    required this.node,
    this.$__typename = 'NoticeEdge',
  });

  factory Query$noticesByInput$input$notices$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$noticesByInput$input$notices$edges(
      node: Query$noticesByInput$input$notices$edges$node.fromJson(
          (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$noticesByInput$input$notices$edges$node node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$node,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$noticesByInput$input$notices$edges) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$noticesByInput$input$notices$edges
    on Query$noticesByInput$input$notices$edges {
  CopyWith$Query$noticesByInput$input$notices$edges<
          Query$noticesByInput$input$notices$edges>
      get copyWith => CopyWith$Query$noticesByInput$input$notices$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$noticesByInput$input$notices$edges<TRes> {
  factory CopyWith$Query$noticesByInput$input$notices$edges(
    Query$noticesByInput$input$notices$edges instance,
    TRes Function(Query$noticesByInput$input$notices$edges) then,
  ) = _CopyWithImpl$Query$noticesByInput$input$notices$edges;

  factory CopyWith$Query$noticesByInput$input$notices$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$noticesByInput$input$notices$edges;

  TRes call({
    Query$noticesByInput$input$notices$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$noticesByInput$input$notices$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$noticesByInput$input$notices$edges<TRes>
    implements CopyWith$Query$noticesByInput$input$notices$edges<TRes> {
  _CopyWithImpl$Query$noticesByInput$input$notices$edges(
    this._instance,
    this._then,
  );

  final Query$noticesByInput$input$notices$edges _instance;

  final TRes Function(Query$noticesByInput$input$notices$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$noticesByInput$input$notices$edges(
        node: node == _undefined || node == null
            ? _instance.node
            : (node as Query$noticesByInput$input$notices$edges$node),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$noticesByInput$input$notices$edges$node<TRes> get node {
    final local$node = _instance.node;
    return CopyWith$Query$noticesByInput$input$notices$edges$node(
        local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$noticesByInput$input$notices$edges<TRes>
    implements CopyWith$Query$noticesByInput$input$notices$edges<TRes> {
  _CopyWithStubImpl$Query$noticesByInput$input$notices$edges(this._res);

  TRes _res;

  call({
    Query$noticesByInput$input$notices$edges$node? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$noticesByInput$input$notices$edges$node<TRes> get node =>
      CopyWith$Query$noticesByInput$input$notices$edges$node.stub(_res);
}

class Query$noticesByInput$input$notices$edges$node {
  Query$noticesByInput$input$notices$edges$node({
    required this.index,
    required this.input,
    required this.payload,
    this.$__typename = 'Notice',
  });

  factory Query$noticesByInput$input$notices$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$index = json['index'];
    final l$input = json['input'];
    final l$payload = json['payload'];
    final l$$__typename = json['__typename'];
    return Query$noticesByInput$input$notices$edges$node(
      index: (l$index as int),
      input: Query$noticesByInput$input$notices$edges$node$input.fromJson(
          (l$input as Map<String, dynamic>)),
      payload: (l$payload as String),
      $__typename: (l$$__typename as String),
    );
  }

  final int index;

  final Query$noticesByInput$input$notices$edges$node$input input;

  final String payload;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$index = index;
    _resultData['index'] = l$index;
    final l$input = input;
    _resultData['input'] = l$input.toJson();
    final l$payload = payload;
    _resultData['payload'] = l$payload;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$index = index;
    final l$input = input;
    final l$payload = payload;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$index,
      l$input,
      l$payload,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$noticesByInput$input$notices$edges$node) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$index = index;
    final lOther$index = other.index;
    if (l$index != lOther$index) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    final l$payload = payload;
    final lOther$payload = other.payload;
    if (l$payload != lOther$payload) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$noticesByInput$input$notices$edges$node
    on Query$noticesByInput$input$notices$edges$node {
  CopyWith$Query$noticesByInput$input$notices$edges$node<
          Query$noticesByInput$input$notices$edges$node>
      get copyWith => CopyWith$Query$noticesByInput$input$notices$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$noticesByInput$input$notices$edges$node<TRes> {
  factory CopyWith$Query$noticesByInput$input$notices$edges$node(
    Query$noticesByInput$input$notices$edges$node instance,
    TRes Function(Query$noticesByInput$input$notices$edges$node) then,
  ) = _CopyWithImpl$Query$noticesByInput$input$notices$edges$node;

  factory CopyWith$Query$noticesByInput$input$notices$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Query$noticesByInput$input$notices$edges$node;

  TRes call({
    int? index,
    Query$noticesByInput$input$notices$edges$node$input? input,
    String? payload,
    String? $__typename,
  });
  CopyWith$Query$noticesByInput$input$notices$edges$node$input<TRes> get input;
}

class _CopyWithImpl$Query$noticesByInput$input$notices$edges$node<TRes>
    implements CopyWith$Query$noticesByInput$input$notices$edges$node<TRes> {
  _CopyWithImpl$Query$noticesByInput$input$notices$edges$node(
    this._instance,
    this._then,
  );

  final Query$noticesByInput$input$notices$edges$node _instance;

  final TRes Function(Query$noticesByInput$input$notices$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? index = _undefined,
    Object? input = _undefined,
    Object? payload = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$noticesByInput$input$notices$edges$node(
        index: index == _undefined || index == null
            ? _instance.index
            : (index as int),
        input: input == _undefined || input == null
            ? _instance.input
            : (input as Query$noticesByInput$input$notices$edges$node$input),
        payload: payload == _undefined || payload == null
            ? _instance.payload
            : (payload as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$noticesByInput$input$notices$edges$node$input<TRes> get input {
    final local$input = _instance.input;
    return CopyWith$Query$noticesByInput$input$notices$edges$node$input(
        local$input, (e) => call(input: e));
  }
}

class _CopyWithStubImpl$Query$noticesByInput$input$notices$edges$node<TRes>
    implements CopyWith$Query$noticesByInput$input$notices$edges$node<TRes> {
  _CopyWithStubImpl$Query$noticesByInput$input$notices$edges$node(this._res);

  TRes _res;

  call({
    int? index,
    Query$noticesByInput$input$notices$edges$node$input? input,
    String? payload,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$noticesByInput$input$notices$edges$node$input<TRes>
      get input =>
          CopyWith$Query$noticesByInput$input$notices$edges$node$input.stub(
              _res);
}

class Query$noticesByInput$input$notices$edges$node$input {
  Query$noticesByInput$input$notices$edges$node$input({
    required this.index,
    this.$__typename = 'Input',
  });

  factory Query$noticesByInput$input$notices$edges$node$input.fromJson(
      Map<String, dynamic> json) {
    final l$index = json['index'];
    final l$$__typename = json['__typename'];
    return Query$noticesByInput$input$notices$edges$node$input(
      index: (l$index as int),
      $__typename: (l$$__typename as String),
    );
  }

  final int index;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$index = index;
    _resultData['index'] = l$index;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$index = index;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$index,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$noticesByInput$input$notices$edges$node$input) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$index = index;
    final lOther$index = other.index;
    if (l$index != lOther$index) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$noticesByInput$input$notices$edges$node$input
    on Query$noticesByInput$input$notices$edges$node$input {
  CopyWith$Query$noticesByInput$input$notices$edges$node$input<
          Query$noticesByInput$input$notices$edges$node$input>
      get copyWith =>
          CopyWith$Query$noticesByInput$input$notices$edges$node$input(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$noticesByInput$input$notices$edges$node$input<
    TRes> {
  factory CopyWith$Query$noticesByInput$input$notices$edges$node$input(
    Query$noticesByInput$input$notices$edges$node$input instance,
    TRes Function(Query$noticesByInput$input$notices$edges$node$input) then,
  ) = _CopyWithImpl$Query$noticesByInput$input$notices$edges$node$input;

  factory CopyWith$Query$noticesByInput$input$notices$edges$node$input.stub(
          TRes res) =
      _CopyWithStubImpl$Query$noticesByInput$input$notices$edges$node$input;

  TRes call({
    int? index,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$noticesByInput$input$notices$edges$node$input<TRes>
    implements
        CopyWith$Query$noticesByInput$input$notices$edges$node$input<TRes> {
  _CopyWithImpl$Query$noticesByInput$input$notices$edges$node$input(
    this._instance,
    this._then,
  );

  final Query$noticesByInput$input$notices$edges$node$input _instance;

  final TRes Function(Query$noticesByInput$input$notices$edges$node$input)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? index = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$noticesByInput$input$notices$edges$node$input(
        index: index == _undefined || index == null
            ? _instance.index
            : (index as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$noticesByInput$input$notices$edges$node$input<
        TRes>
    implements
        CopyWith$Query$noticesByInput$input$notices$edges$node$input<TRes> {
  _CopyWithStubImpl$Query$noticesByInput$input$notices$edges$node$input(
      this._res);

  TRes _res;

  call({
    int? index,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$voucher {
  factory Variables$Query$voucher({
    required int voucherIndex,
    required int inputIndex,
  }) =>
      Variables$Query$voucher._({
        r'voucherIndex': voucherIndex,
        r'inputIndex': inputIndex,
      });

  Variables$Query$voucher._(this._$data);

  factory Variables$Query$voucher.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$voucherIndex = data['voucherIndex'];
    result$data['voucherIndex'] = (l$voucherIndex as int);
    final l$inputIndex = data['inputIndex'];
    result$data['inputIndex'] = (l$inputIndex as int);
    return Variables$Query$voucher._(result$data);
  }

  Map<String, dynamic> _$data;

  int get voucherIndex => (_$data['voucherIndex'] as int);

  int get inputIndex => (_$data['inputIndex'] as int);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$voucherIndex = voucherIndex;
    result$data['voucherIndex'] = l$voucherIndex;
    final l$inputIndex = inputIndex;
    result$data['inputIndex'] = l$inputIndex;
    return result$data;
  }

  CopyWith$Variables$Query$voucher<Variables$Query$voucher> get copyWith =>
      CopyWith$Variables$Query$voucher(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$voucher) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$voucherIndex = voucherIndex;
    final lOther$voucherIndex = other.voucherIndex;
    if (l$voucherIndex != lOther$voucherIndex) {
      return false;
    }
    final l$inputIndex = inputIndex;
    final lOther$inputIndex = other.inputIndex;
    if (l$inputIndex != lOther$inputIndex) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$voucherIndex = voucherIndex;
    final l$inputIndex = inputIndex;
    return Object.hashAll([
      l$voucherIndex,
      l$inputIndex,
    ]);
  }
}

abstract class CopyWith$Variables$Query$voucher<TRes> {
  factory CopyWith$Variables$Query$voucher(
    Variables$Query$voucher instance,
    TRes Function(Variables$Query$voucher) then,
  ) = _CopyWithImpl$Variables$Query$voucher;

  factory CopyWith$Variables$Query$voucher.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$voucher;

  TRes call({
    int? voucherIndex,
    int? inputIndex,
  });
}

class _CopyWithImpl$Variables$Query$voucher<TRes>
    implements CopyWith$Variables$Query$voucher<TRes> {
  _CopyWithImpl$Variables$Query$voucher(
    this._instance,
    this._then,
  );

  final Variables$Query$voucher _instance;

  final TRes Function(Variables$Query$voucher) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? voucherIndex = _undefined,
    Object? inputIndex = _undefined,
  }) =>
      _then(Variables$Query$voucher._({
        ..._instance._$data,
        if (voucherIndex != _undefined && voucherIndex != null)
          'voucherIndex': (voucherIndex as int),
        if (inputIndex != _undefined && inputIndex != null)
          'inputIndex': (inputIndex as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$voucher<TRes>
    implements CopyWith$Variables$Query$voucher<TRes> {
  _CopyWithStubImpl$Variables$Query$voucher(this._res);

  TRes _res;

  call({
    int? voucherIndex,
    int? inputIndex,
  }) =>
      _res;
}

class Query$voucher {
  Query$voucher({
    required this.voucher,
    this.$__typename = 'Query',
  });

  factory Query$voucher.fromJson(Map<String, dynamic> json) {
    final l$voucher = json['voucher'];
    final l$$__typename = json['__typename'];
    return Query$voucher(
      voucher:
          Query$voucher$voucher.fromJson((l$voucher as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$voucher$voucher voucher;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$voucher = voucher;
    _resultData['voucher'] = l$voucher.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$voucher = voucher;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$voucher,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$voucher) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$voucher = voucher;
    final lOther$voucher = other.voucher;
    if (l$voucher != lOther$voucher) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$voucher on Query$voucher {
  CopyWith$Query$voucher<Query$voucher> get copyWith => CopyWith$Query$voucher(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$voucher<TRes> {
  factory CopyWith$Query$voucher(
    Query$voucher instance,
    TRes Function(Query$voucher) then,
  ) = _CopyWithImpl$Query$voucher;

  factory CopyWith$Query$voucher.stub(TRes res) =
      _CopyWithStubImpl$Query$voucher;

  TRes call({
    Query$voucher$voucher? voucher,
    String? $__typename,
  });
  CopyWith$Query$voucher$voucher<TRes> get voucher;
}

class _CopyWithImpl$Query$voucher<TRes>
    implements CopyWith$Query$voucher<TRes> {
  _CopyWithImpl$Query$voucher(
    this._instance,
    this._then,
  );

  final Query$voucher _instance;

  final TRes Function(Query$voucher) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? voucher = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$voucher(
        voucher: voucher == _undefined || voucher == null
            ? _instance.voucher
            : (voucher as Query$voucher$voucher),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$voucher$voucher<TRes> get voucher {
    final local$voucher = _instance.voucher;
    return CopyWith$Query$voucher$voucher(
        local$voucher, (e) => call(voucher: e));
  }
}

class _CopyWithStubImpl$Query$voucher<TRes>
    implements CopyWith$Query$voucher<TRes> {
  _CopyWithStubImpl$Query$voucher(this._res);

  TRes _res;

  call({
    Query$voucher$voucher? voucher,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$voucher$voucher<TRes> get voucher =>
      CopyWith$Query$voucher$voucher.stub(_res);
}

const documentNodeQueryvoucher = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'voucher'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'voucherIndex')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'inputIndex')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'voucher'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'voucherIndex'),
            value: VariableNode(name: NameNode(value: 'voucherIndex')),
          ),
          ArgumentNode(
            name: NameNode(value: 'inputIndex'),
            value: VariableNode(name: NameNode(value: 'inputIndex')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'index'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'input'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'index'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'payload'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'destination'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'payload'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'proof'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'validity'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'inputIndex'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'outputIndex'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'outputHashesRootHash'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'vouchersEpochRootHash'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'noticesEpochRootHash'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'machineStateHash'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'keccakInHashesSiblings'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'outputHashesInEpochSiblings'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: 'context'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$voucher _parserFn$Query$voucher(Map<String, dynamic> data) =>
    Query$voucher.fromJson(data);
typedef OnQueryComplete$Query$voucher = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$voucher?,
);

class Options$Query$voucher extends graphql.QueryOptions<Query$voucher> {
  Options$Query$voucher({
    String? operationName,
    required Variables$Query$voucher variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$voucher? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$voucher? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$voucher(data),
                  ),
          onError: onError,
          document: documentNodeQueryvoucher,
          parserFn: _parserFn$Query$voucher,
        );

  final OnQueryComplete$Query$voucher? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$voucher
    extends graphql.WatchQueryOptions<Query$voucher> {
  WatchOptions$Query$voucher({
    String? operationName,
    required Variables$Query$voucher variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$voucher? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryvoucher,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$voucher,
        );
}

class FetchMoreOptions$Query$voucher extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$voucher({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$voucher variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryvoucher,
        );
}

extension ClientExtension$Query$voucher on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$voucher>> query$voucher(
          Options$Query$voucher options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$voucher> watchQuery$voucher(
          WatchOptions$Query$voucher options) =>
      this.watchQuery(options);
  void writeQuery$voucher({
    required Query$voucher data,
    required Variables$Query$voucher variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryvoucher),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$voucher? readQuery$voucher({
    required Variables$Query$voucher variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryvoucher),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$voucher.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$voucher> useQuery$voucher(
        Options$Query$voucher options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$voucher> useWatchQuery$voucher(
        WatchOptions$Query$voucher options) =>
    graphql_flutter.useWatchQuery(options);

class Query$voucher$Widget extends graphql_flutter.Query<Query$voucher> {
  Query$voucher$Widget({
    widgets.Key? key,
    required Options$Query$voucher options,
    required graphql_flutter.QueryBuilder<Query$voucher> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$voucher$voucher {
  Query$voucher$voucher({
    required this.index,
    required this.input,
    required this.destination,
    required this.payload,
    this.proof,
    this.$__typename = 'Voucher',
  });

  factory Query$voucher$voucher.fromJson(Map<String, dynamic> json) {
    final l$index = json['index'];
    final l$input = json['input'];
    final l$destination = json['destination'];
    final l$payload = json['payload'];
    final l$proof = json['proof'];
    final l$$__typename = json['__typename'];
    return Query$voucher$voucher(
      index: (l$index as int),
      input: Query$voucher$voucher$input.fromJson(
          (l$input as Map<String, dynamic>)),
      destination: (l$destination as String),
      payload: (l$payload as String),
      proof: l$proof == null
          ? null
          : Query$voucher$voucher$proof.fromJson(
              (l$proof as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final int index;

  final Query$voucher$voucher$input input;

  final String destination;

  final String payload;

  final Query$voucher$voucher$proof? proof;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$index = index;
    _resultData['index'] = l$index;
    final l$input = input;
    _resultData['input'] = l$input.toJson();
    final l$destination = destination;
    _resultData['destination'] = l$destination;
    final l$payload = payload;
    _resultData['payload'] = l$payload;
    final l$proof = proof;
    _resultData['proof'] = l$proof?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$index = index;
    final l$input = input;
    final l$destination = destination;
    final l$payload = payload;
    final l$proof = proof;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$index,
      l$input,
      l$destination,
      l$payload,
      l$proof,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$voucher$voucher) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$index = index;
    final lOther$index = other.index;
    if (l$index != lOther$index) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    final l$destination = destination;
    final lOther$destination = other.destination;
    if (l$destination != lOther$destination) {
      return false;
    }
    final l$payload = payload;
    final lOther$payload = other.payload;
    if (l$payload != lOther$payload) {
      return false;
    }
    final l$proof = proof;
    final lOther$proof = other.proof;
    if (l$proof != lOther$proof) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$voucher$voucher on Query$voucher$voucher {
  CopyWith$Query$voucher$voucher<Query$voucher$voucher> get copyWith =>
      CopyWith$Query$voucher$voucher(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$voucher$voucher<TRes> {
  factory CopyWith$Query$voucher$voucher(
    Query$voucher$voucher instance,
    TRes Function(Query$voucher$voucher) then,
  ) = _CopyWithImpl$Query$voucher$voucher;

  factory CopyWith$Query$voucher$voucher.stub(TRes res) =
      _CopyWithStubImpl$Query$voucher$voucher;

  TRes call({
    int? index,
    Query$voucher$voucher$input? input,
    String? destination,
    String? payload,
    Query$voucher$voucher$proof? proof,
    String? $__typename,
  });
  CopyWith$Query$voucher$voucher$input<TRes> get input;
  CopyWith$Query$voucher$voucher$proof<TRes> get proof;
}

class _CopyWithImpl$Query$voucher$voucher<TRes>
    implements CopyWith$Query$voucher$voucher<TRes> {
  _CopyWithImpl$Query$voucher$voucher(
    this._instance,
    this._then,
  );

  final Query$voucher$voucher _instance;

  final TRes Function(Query$voucher$voucher) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? index = _undefined,
    Object? input = _undefined,
    Object? destination = _undefined,
    Object? payload = _undefined,
    Object? proof = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$voucher$voucher(
        index: index == _undefined || index == null
            ? _instance.index
            : (index as int),
        input: input == _undefined || input == null
            ? _instance.input
            : (input as Query$voucher$voucher$input),
        destination: destination == _undefined || destination == null
            ? _instance.destination
            : (destination as String),
        payload: payload == _undefined || payload == null
            ? _instance.payload
            : (payload as String),
        proof: proof == _undefined
            ? _instance.proof
            : (proof as Query$voucher$voucher$proof?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$voucher$voucher$input<TRes> get input {
    final local$input = _instance.input;
    return CopyWith$Query$voucher$voucher$input(
        local$input, (e) => call(input: e));
  }

  CopyWith$Query$voucher$voucher$proof<TRes> get proof {
    final local$proof = _instance.proof;
    return local$proof == null
        ? CopyWith$Query$voucher$voucher$proof.stub(_then(_instance))
        : CopyWith$Query$voucher$voucher$proof(
            local$proof, (e) => call(proof: e));
  }
}

class _CopyWithStubImpl$Query$voucher$voucher<TRes>
    implements CopyWith$Query$voucher$voucher<TRes> {
  _CopyWithStubImpl$Query$voucher$voucher(this._res);

  TRes _res;

  call({
    int? index,
    Query$voucher$voucher$input? input,
    String? destination,
    String? payload,
    Query$voucher$voucher$proof? proof,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$voucher$voucher$input<TRes> get input =>
      CopyWith$Query$voucher$voucher$input.stub(_res);

  CopyWith$Query$voucher$voucher$proof<TRes> get proof =>
      CopyWith$Query$voucher$voucher$proof.stub(_res);
}

class Query$voucher$voucher$input {
  Query$voucher$voucher$input({
    required this.index,
    required this.payload,
    this.$__typename = 'Input',
  });

  factory Query$voucher$voucher$input.fromJson(Map<String, dynamic> json) {
    final l$index = json['index'];
    final l$payload = json['payload'];
    final l$$__typename = json['__typename'];
    return Query$voucher$voucher$input(
      index: (l$index as int),
      payload: (l$payload as String),
      $__typename: (l$$__typename as String),
    );
  }

  final int index;

  final String payload;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$index = index;
    _resultData['index'] = l$index;
    final l$payload = payload;
    _resultData['payload'] = l$payload;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$index = index;
    final l$payload = payload;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$index,
      l$payload,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$voucher$voucher$input) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$index = index;
    final lOther$index = other.index;
    if (l$index != lOther$index) {
      return false;
    }
    final l$payload = payload;
    final lOther$payload = other.payload;
    if (l$payload != lOther$payload) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$voucher$voucher$input
    on Query$voucher$voucher$input {
  CopyWith$Query$voucher$voucher$input<Query$voucher$voucher$input>
      get copyWith => CopyWith$Query$voucher$voucher$input(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$voucher$voucher$input<TRes> {
  factory CopyWith$Query$voucher$voucher$input(
    Query$voucher$voucher$input instance,
    TRes Function(Query$voucher$voucher$input) then,
  ) = _CopyWithImpl$Query$voucher$voucher$input;

  factory CopyWith$Query$voucher$voucher$input.stub(TRes res) =
      _CopyWithStubImpl$Query$voucher$voucher$input;

  TRes call({
    int? index,
    String? payload,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$voucher$voucher$input<TRes>
    implements CopyWith$Query$voucher$voucher$input<TRes> {
  _CopyWithImpl$Query$voucher$voucher$input(
    this._instance,
    this._then,
  );

  final Query$voucher$voucher$input _instance;

  final TRes Function(Query$voucher$voucher$input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? index = _undefined,
    Object? payload = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$voucher$voucher$input(
        index: index == _undefined || index == null
            ? _instance.index
            : (index as int),
        payload: payload == _undefined || payload == null
            ? _instance.payload
            : (payload as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$voucher$voucher$input<TRes>
    implements CopyWith$Query$voucher$voucher$input<TRes> {
  _CopyWithStubImpl$Query$voucher$voucher$input(this._res);

  TRes _res;

  call({
    int? index,
    String? payload,
    String? $__typename,
  }) =>
      _res;
}

class Query$voucher$voucher$proof {
  Query$voucher$voucher$proof({
    required this.validity,
    required this.context,
    this.$__typename = 'Proof',
  });

  factory Query$voucher$voucher$proof.fromJson(Map<String, dynamic> json) {
    final l$validity = json['validity'];
    final l$context = json['context'];
    final l$$__typename = json['__typename'];
    return Query$voucher$voucher$proof(
      validity: Query$voucher$voucher$proof$validity.fromJson(
          (l$validity as Map<String, dynamic>)),
      context: (l$context as String),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$voucher$voucher$proof$validity validity;

  final String context;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$validity = validity;
    _resultData['validity'] = l$validity.toJson();
    final l$context = context;
    _resultData['context'] = l$context;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$validity = validity;
    final l$context = context;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$validity,
      l$context,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$voucher$voucher$proof) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$validity = validity;
    final lOther$validity = other.validity;
    if (l$validity != lOther$validity) {
      return false;
    }
    final l$context = context;
    final lOther$context = other.context;
    if (l$context != lOther$context) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$voucher$voucher$proof
    on Query$voucher$voucher$proof {
  CopyWith$Query$voucher$voucher$proof<Query$voucher$voucher$proof>
      get copyWith => CopyWith$Query$voucher$voucher$proof(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$voucher$voucher$proof<TRes> {
  factory CopyWith$Query$voucher$voucher$proof(
    Query$voucher$voucher$proof instance,
    TRes Function(Query$voucher$voucher$proof) then,
  ) = _CopyWithImpl$Query$voucher$voucher$proof;

  factory CopyWith$Query$voucher$voucher$proof.stub(TRes res) =
      _CopyWithStubImpl$Query$voucher$voucher$proof;

  TRes call({
    Query$voucher$voucher$proof$validity? validity,
    String? context,
    String? $__typename,
  });
  CopyWith$Query$voucher$voucher$proof$validity<TRes> get validity;
}

class _CopyWithImpl$Query$voucher$voucher$proof<TRes>
    implements CopyWith$Query$voucher$voucher$proof<TRes> {
  _CopyWithImpl$Query$voucher$voucher$proof(
    this._instance,
    this._then,
  );

  final Query$voucher$voucher$proof _instance;

  final TRes Function(Query$voucher$voucher$proof) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? validity = _undefined,
    Object? context = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$voucher$voucher$proof(
        validity: validity == _undefined || validity == null
            ? _instance.validity
            : (validity as Query$voucher$voucher$proof$validity),
        context: context == _undefined || context == null
            ? _instance.context
            : (context as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$voucher$voucher$proof$validity<TRes> get validity {
    final local$validity = _instance.validity;
    return CopyWith$Query$voucher$voucher$proof$validity(
        local$validity, (e) => call(validity: e));
  }
}

class _CopyWithStubImpl$Query$voucher$voucher$proof<TRes>
    implements CopyWith$Query$voucher$voucher$proof<TRes> {
  _CopyWithStubImpl$Query$voucher$voucher$proof(this._res);

  TRes _res;

  call({
    Query$voucher$voucher$proof$validity? validity,
    String? context,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$voucher$voucher$proof$validity<TRes> get validity =>
      CopyWith$Query$voucher$voucher$proof$validity.stub(_res);
}

class Query$voucher$voucher$proof$validity {
  Query$voucher$voucher$proof$validity({
    required this.inputIndex,
    required this.outputIndex,
    required this.outputHashesRootHash,
    required this.vouchersEpochRootHash,
    required this.noticesEpochRootHash,
    required this.machineStateHash,
    required this.keccakInHashesSiblings,
    required this.outputHashesInEpochSiblings,
    this.$__typename = 'OutputValidityProof',
  });

  factory Query$voucher$voucher$proof$validity.fromJson(
      Map<String, dynamic> json) {
    final l$inputIndex = json['inputIndex'];
    final l$outputIndex = json['outputIndex'];
    final l$outputHashesRootHash = json['outputHashesRootHash'];
    final l$vouchersEpochRootHash = json['vouchersEpochRootHash'];
    final l$noticesEpochRootHash = json['noticesEpochRootHash'];
    final l$machineStateHash = json['machineStateHash'];
    final l$keccakInHashesSiblings = json['keccakInHashesSiblings'];
    final l$outputHashesInEpochSiblings = json['outputHashesInEpochSiblings'];
    final l$$__typename = json['__typename'];
    return Query$voucher$voucher$proof$validity(
      inputIndex: (l$inputIndex as int),
      outputIndex: (l$outputIndex as int),
      outputHashesRootHash: (l$outputHashesRootHash as String),
      vouchersEpochRootHash: (l$vouchersEpochRootHash as String),
      noticesEpochRootHash: (l$noticesEpochRootHash as String),
      machineStateHash: (l$machineStateHash as String),
      keccakInHashesSiblings: (l$keccakInHashesSiblings as List<dynamic>)
          .map((e) => (e as String))
          .toList(),
      outputHashesInEpochSiblings:
          (l$outputHashesInEpochSiblings as List<dynamic>)
              .map((e) => (e as String))
              .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final int inputIndex;

  final int outputIndex;

  final String outputHashesRootHash;

  final String vouchersEpochRootHash;

  final String noticesEpochRootHash;

  final String machineStateHash;

  final List<String> keccakInHashesSiblings;

  final List<String> outputHashesInEpochSiblings;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$inputIndex = inputIndex;
    _resultData['inputIndex'] = l$inputIndex;
    final l$outputIndex = outputIndex;
    _resultData['outputIndex'] = l$outputIndex;
    final l$outputHashesRootHash = outputHashesRootHash;
    _resultData['outputHashesRootHash'] = l$outputHashesRootHash;
    final l$vouchersEpochRootHash = vouchersEpochRootHash;
    _resultData['vouchersEpochRootHash'] = l$vouchersEpochRootHash;
    final l$noticesEpochRootHash = noticesEpochRootHash;
    _resultData['noticesEpochRootHash'] = l$noticesEpochRootHash;
    final l$machineStateHash = machineStateHash;
    _resultData['machineStateHash'] = l$machineStateHash;
    final l$keccakInHashesSiblings = keccakInHashesSiblings;
    _resultData['keccakInHashesSiblings'] =
        l$keccakInHashesSiblings.map((e) => e).toList();
    final l$outputHashesInEpochSiblings = outputHashesInEpochSiblings;
    _resultData['outputHashesInEpochSiblings'] =
        l$outputHashesInEpochSiblings.map((e) => e).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$inputIndex = inputIndex;
    final l$outputIndex = outputIndex;
    final l$outputHashesRootHash = outputHashesRootHash;
    final l$vouchersEpochRootHash = vouchersEpochRootHash;
    final l$noticesEpochRootHash = noticesEpochRootHash;
    final l$machineStateHash = machineStateHash;
    final l$keccakInHashesSiblings = keccakInHashesSiblings;
    final l$outputHashesInEpochSiblings = outputHashesInEpochSiblings;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$inputIndex,
      l$outputIndex,
      l$outputHashesRootHash,
      l$vouchersEpochRootHash,
      l$noticesEpochRootHash,
      l$machineStateHash,
      Object.hashAll(l$keccakInHashesSiblings.map((v) => v)),
      Object.hashAll(l$outputHashesInEpochSiblings.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$voucher$voucher$proof$validity) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$inputIndex = inputIndex;
    final lOther$inputIndex = other.inputIndex;
    if (l$inputIndex != lOther$inputIndex) {
      return false;
    }
    final l$outputIndex = outputIndex;
    final lOther$outputIndex = other.outputIndex;
    if (l$outputIndex != lOther$outputIndex) {
      return false;
    }
    final l$outputHashesRootHash = outputHashesRootHash;
    final lOther$outputHashesRootHash = other.outputHashesRootHash;
    if (l$outputHashesRootHash != lOther$outputHashesRootHash) {
      return false;
    }
    final l$vouchersEpochRootHash = vouchersEpochRootHash;
    final lOther$vouchersEpochRootHash = other.vouchersEpochRootHash;
    if (l$vouchersEpochRootHash != lOther$vouchersEpochRootHash) {
      return false;
    }
    final l$noticesEpochRootHash = noticesEpochRootHash;
    final lOther$noticesEpochRootHash = other.noticesEpochRootHash;
    if (l$noticesEpochRootHash != lOther$noticesEpochRootHash) {
      return false;
    }
    final l$machineStateHash = machineStateHash;
    final lOther$machineStateHash = other.machineStateHash;
    if (l$machineStateHash != lOther$machineStateHash) {
      return false;
    }
    final l$keccakInHashesSiblings = keccakInHashesSiblings;
    final lOther$keccakInHashesSiblings = other.keccakInHashesSiblings;
    if (l$keccakInHashesSiblings.length !=
        lOther$keccakInHashesSiblings.length) {
      return false;
    }
    for (int i = 0; i < l$keccakInHashesSiblings.length; i++) {
      final l$keccakInHashesSiblings$entry = l$keccakInHashesSiblings[i];
      final lOther$keccakInHashesSiblings$entry =
          lOther$keccakInHashesSiblings[i];
      if (l$keccakInHashesSiblings$entry !=
          lOther$keccakInHashesSiblings$entry) {
        return false;
      }
    }
    final l$outputHashesInEpochSiblings = outputHashesInEpochSiblings;
    final lOther$outputHashesInEpochSiblings =
        other.outputHashesInEpochSiblings;
    if (l$outputHashesInEpochSiblings.length !=
        lOther$outputHashesInEpochSiblings.length) {
      return false;
    }
    for (int i = 0; i < l$outputHashesInEpochSiblings.length; i++) {
      final l$outputHashesInEpochSiblings$entry =
          l$outputHashesInEpochSiblings[i];
      final lOther$outputHashesInEpochSiblings$entry =
          lOther$outputHashesInEpochSiblings[i];
      if (l$outputHashesInEpochSiblings$entry !=
          lOther$outputHashesInEpochSiblings$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$voucher$voucher$proof$validity
    on Query$voucher$voucher$proof$validity {
  CopyWith$Query$voucher$voucher$proof$validity<
          Query$voucher$voucher$proof$validity>
      get copyWith => CopyWith$Query$voucher$voucher$proof$validity(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$voucher$voucher$proof$validity<TRes> {
  factory CopyWith$Query$voucher$voucher$proof$validity(
    Query$voucher$voucher$proof$validity instance,
    TRes Function(Query$voucher$voucher$proof$validity) then,
  ) = _CopyWithImpl$Query$voucher$voucher$proof$validity;

  factory CopyWith$Query$voucher$voucher$proof$validity.stub(TRes res) =
      _CopyWithStubImpl$Query$voucher$voucher$proof$validity;

  TRes call({
    int? inputIndex,
    int? outputIndex,
    String? outputHashesRootHash,
    String? vouchersEpochRootHash,
    String? noticesEpochRootHash,
    String? machineStateHash,
    List<String>? keccakInHashesSiblings,
    List<String>? outputHashesInEpochSiblings,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$voucher$voucher$proof$validity<TRes>
    implements CopyWith$Query$voucher$voucher$proof$validity<TRes> {
  _CopyWithImpl$Query$voucher$voucher$proof$validity(
    this._instance,
    this._then,
  );

  final Query$voucher$voucher$proof$validity _instance;

  final TRes Function(Query$voucher$voucher$proof$validity) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? inputIndex = _undefined,
    Object? outputIndex = _undefined,
    Object? outputHashesRootHash = _undefined,
    Object? vouchersEpochRootHash = _undefined,
    Object? noticesEpochRootHash = _undefined,
    Object? machineStateHash = _undefined,
    Object? keccakInHashesSiblings = _undefined,
    Object? outputHashesInEpochSiblings = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$voucher$voucher$proof$validity(
        inputIndex: inputIndex == _undefined || inputIndex == null
            ? _instance.inputIndex
            : (inputIndex as int),
        outputIndex: outputIndex == _undefined || outputIndex == null
            ? _instance.outputIndex
            : (outputIndex as int),
        outputHashesRootHash:
            outputHashesRootHash == _undefined || outputHashesRootHash == null
                ? _instance.outputHashesRootHash
                : (outputHashesRootHash as String),
        vouchersEpochRootHash:
            vouchersEpochRootHash == _undefined || vouchersEpochRootHash == null
                ? _instance.vouchersEpochRootHash
                : (vouchersEpochRootHash as String),
        noticesEpochRootHash:
            noticesEpochRootHash == _undefined || noticesEpochRootHash == null
                ? _instance.noticesEpochRootHash
                : (noticesEpochRootHash as String),
        machineStateHash:
            machineStateHash == _undefined || machineStateHash == null
                ? _instance.machineStateHash
                : (machineStateHash as String),
        keccakInHashesSiblings: keccakInHashesSiblings == _undefined ||
                keccakInHashesSiblings == null
            ? _instance.keccakInHashesSiblings
            : (keccakInHashesSiblings as List<String>),
        outputHashesInEpochSiblings:
            outputHashesInEpochSiblings == _undefined ||
                    outputHashesInEpochSiblings == null
                ? _instance.outputHashesInEpochSiblings
                : (outputHashesInEpochSiblings as List<String>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$voucher$voucher$proof$validity<TRes>
    implements CopyWith$Query$voucher$voucher$proof$validity<TRes> {
  _CopyWithStubImpl$Query$voucher$voucher$proof$validity(this._res);

  TRes _res;

  call({
    int? inputIndex,
    int? outputIndex,
    String? outputHashesRootHash,
    String? vouchersEpochRootHash,
    String? noticesEpochRootHash,
    String? machineStateHash,
    List<String>? keccakInHashesSiblings,
    List<String>? outputHashesInEpochSiblings,
    String? $__typename,
  }) =>
      _res;
}

class Query$vouchers {
  Query$vouchers({
    required this.vouchers,
    this.$__typename = 'Query',
  });

  factory Query$vouchers.fromJson(Map<String, dynamic> json) {
    final l$vouchers = json['vouchers'];
    final l$$__typename = json['__typename'];
    return Query$vouchers(
      vouchers: Query$vouchers$vouchers.fromJson(
          (l$vouchers as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$vouchers$vouchers vouchers;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$vouchers = vouchers;
    _resultData['vouchers'] = l$vouchers.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$vouchers = vouchers;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$vouchers,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$vouchers) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$vouchers = vouchers;
    final lOther$vouchers = other.vouchers;
    if (l$vouchers != lOther$vouchers) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$vouchers on Query$vouchers {
  CopyWith$Query$vouchers<Query$vouchers> get copyWith =>
      CopyWith$Query$vouchers(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$vouchers<TRes> {
  factory CopyWith$Query$vouchers(
    Query$vouchers instance,
    TRes Function(Query$vouchers) then,
  ) = _CopyWithImpl$Query$vouchers;

  factory CopyWith$Query$vouchers.stub(TRes res) =
      _CopyWithStubImpl$Query$vouchers;

  TRes call({
    Query$vouchers$vouchers? vouchers,
    String? $__typename,
  });
  CopyWith$Query$vouchers$vouchers<TRes> get vouchers;
}

class _CopyWithImpl$Query$vouchers<TRes>
    implements CopyWith$Query$vouchers<TRes> {
  _CopyWithImpl$Query$vouchers(
    this._instance,
    this._then,
  );

  final Query$vouchers _instance;

  final TRes Function(Query$vouchers) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? vouchers = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$vouchers(
        vouchers: vouchers == _undefined || vouchers == null
            ? _instance.vouchers
            : (vouchers as Query$vouchers$vouchers),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$vouchers$vouchers<TRes> get vouchers {
    final local$vouchers = _instance.vouchers;
    return CopyWith$Query$vouchers$vouchers(
        local$vouchers, (e) => call(vouchers: e));
  }
}

class _CopyWithStubImpl$Query$vouchers<TRes>
    implements CopyWith$Query$vouchers<TRes> {
  _CopyWithStubImpl$Query$vouchers(this._res);

  TRes _res;

  call({
    Query$vouchers$vouchers? vouchers,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$vouchers$vouchers<TRes> get vouchers =>
      CopyWith$Query$vouchers$vouchers.stub(_res);
}

const documentNodeQueryvouchers = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'vouchers'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'vouchers'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'edges'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'node'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'index'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'input'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'index'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'payload'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ]),
                  ),
                  FieldNode(
                    name: NameNode(value: 'destination'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'payload'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$vouchers _parserFn$Query$vouchers(Map<String, dynamic> data) =>
    Query$vouchers.fromJson(data);
typedef OnQueryComplete$Query$vouchers = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$vouchers?,
);

class Options$Query$vouchers extends graphql.QueryOptions<Query$vouchers> {
  Options$Query$vouchers({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$vouchers? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$vouchers? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$vouchers(data),
                  ),
          onError: onError,
          document: documentNodeQueryvouchers,
          parserFn: _parserFn$Query$vouchers,
        );

  final OnQueryComplete$Query$vouchers? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$vouchers
    extends graphql.WatchQueryOptions<Query$vouchers> {
  WatchOptions$Query$vouchers({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$vouchers? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryvouchers,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$vouchers,
        );
}

class FetchMoreOptions$Query$vouchers extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$vouchers({required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryvouchers,
        );
}

extension ClientExtension$Query$vouchers on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$vouchers>> query$vouchers(
          [Options$Query$vouchers? options]) async =>
      await this.query(options ?? Options$Query$vouchers());
  graphql.ObservableQuery<Query$vouchers> watchQuery$vouchers(
          [WatchOptions$Query$vouchers? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$vouchers());
  void writeQuery$vouchers({
    required Query$vouchers data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(document: documentNodeQueryvouchers)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$vouchers? readQuery$vouchers({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryvouchers)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$vouchers.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$vouchers> useQuery$vouchers(
        [Options$Query$vouchers? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$vouchers());
graphql.ObservableQuery<Query$vouchers> useWatchQuery$vouchers(
        [WatchOptions$Query$vouchers? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$vouchers());

class Query$vouchers$Widget extends graphql_flutter.Query<Query$vouchers> {
  Query$vouchers$Widget({
    widgets.Key? key,
    Options$Query$vouchers? options,
    required graphql_flutter.QueryBuilder<Query$vouchers> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$vouchers(),
          builder: builder,
        );
}

class Query$vouchers$vouchers {
  Query$vouchers$vouchers({
    required this.edges,
    this.$__typename = 'VoucherConnection',
  });

  factory Query$vouchers$vouchers.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$vouchers$vouchers(
      edges: (l$edges as List<dynamic>)
          .map((e) => Query$vouchers$vouchers$edges.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$vouchers$vouchers$edges> edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$edges.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$vouchers$vouchers) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges.length != lOther$edges.length) {
      return false;
    }
    for (int i = 0; i < l$edges.length; i++) {
      final l$edges$entry = l$edges[i];
      final lOther$edges$entry = lOther$edges[i];
      if (l$edges$entry != lOther$edges$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$vouchers$vouchers on Query$vouchers$vouchers {
  CopyWith$Query$vouchers$vouchers<Query$vouchers$vouchers> get copyWith =>
      CopyWith$Query$vouchers$vouchers(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$vouchers$vouchers<TRes> {
  factory CopyWith$Query$vouchers$vouchers(
    Query$vouchers$vouchers instance,
    TRes Function(Query$vouchers$vouchers) then,
  ) = _CopyWithImpl$Query$vouchers$vouchers;

  factory CopyWith$Query$vouchers$vouchers.stub(TRes res) =
      _CopyWithStubImpl$Query$vouchers$vouchers;

  TRes call({
    List<Query$vouchers$vouchers$edges>? edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$vouchers$vouchers$edges> Function(
              Iterable<
                  CopyWith$Query$vouchers$vouchers$edges<
                      Query$vouchers$vouchers$edges>>)
          _fn);
}

class _CopyWithImpl$Query$vouchers$vouchers<TRes>
    implements CopyWith$Query$vouchers$vouchers<TRes> {
  _CopyWithImpl$Query$vouchers$vouchers(
    this._instance,
    this._then,
  );

  final Query$vouchers$vouchers _instance;

  final TRes Function(Query$vouchers$vouchers) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$vouchers$vouchers(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<Query$vouchers$vouchers$edges>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$vouchers$vouchers$edges> Function(
                  Iterable<
                      CopyWith$Query$vouchers$vouchers$edges<
                          Query$vouchers$vouchers$edges>>)
              _fn) =>
      call(
          edges: _fn(
              _instance.edges.map((e) => CopyWith$Query$vouchers$vouchers$edges(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$vouchers$vouchers<TRes>
    implements CopyWith$Query$vouchers$vouchers<TRes> {
  _CopyWithStubImpl$Query$vouchers$vouchers(this._res);

  TRes _res;

  call({
    List<Query$vouchers$vouchers$edges>? edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Query$vouchers$vouchers$edges {
  Query$vouchers$vouchers$edges({
    required this.node,
    this.$__typename = 'VoucherEdge',
  });

  factory Query$vouchers$vouchers$edges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$vouchers$vouchers$edges(
      node: Query$vouchers$vouchers$edges$node.fromJson(
          (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$vouchers$vouchers$edges$node node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$node,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$vouchers$vouchers$edges) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$vouchers$vouchers$edges
    on Query$vouchers$vouchers$edges {
  CopyWith$Query$vouchers$vouchers$edges<Query$vouchers$vouchers$edges>
      get copyWith => CopyWith$Query$vouchers$vouchers$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$vouchers$vouchers$edges<TRes> {
  factory CopyWith$Query$vouchers$vouchers$edges(
    Query$vouchers$vouchers$edges instance,
    TRes Function(Query$vouchers$vouchers$edges) then,
  ) = _CopyWithImpl$Query$vouchers$vouchers$edges;

  factory CopyWith$Query$vouchers$vouchers$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$vouchers$vouchers$edges;

  TRes call({
    Query$vouchers$vouchers$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$vouchers$vouchers$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$vouchers$vouchers$edges<TRes>
    implements CopyWith$Query$vouchers$vouchers$edges<TRes> {
  _CopyWithImpl$Query$vouchers$vouchers$edges(
    this._instance,
    this._then,
  );

  final Query$vouchers$vouchers$edges _instance;

  final TRes Function(Query$vouchers$vouchers$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$vouchers$vouchers$edges(
        node: node == _undefined || node == null
            ? _instance.node
            : (node as Query$vouchers$vouchers$edges$node),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$vouchers$vouchers$edges$node<TRes> get node {
    final local$node = _instance.node;
    return CopyWith$Query$vouchers$vouchers$edges$node(
        local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$vouchers$vouchers$edges<TRes>
    implements CopyWith$Query$vouchers$vouchers$edges<TRes> {
  _CopyWithStubImpl$Query$vouchers$vouchers$edges(this._res);

  TRes _res;

  call({
    Query$vouchers$vouchers$edges$node? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$vouchers$vouchers$edges$node<TRes> get node =>
      CopyWith$Query$vouchers$vouchers$edges$node.stub(_res);
}

class Query$vouchers$vouchers$edges$node {
  Query$vouchers$vouchers$edges$node({
    required this.index,
    required this.input,
    required this.destination,
    required this.payload,
    this.$__typename = 'Voucher',
  });

  factory Query$vouchers$vouchers$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$index = json['index'];
    final l$input = json['input'];
    final l$destination = json['destination'];
    final l$payload = json['payload'];
    final l$$__typename = json['__typename'];
    return Query$vouchers$vouchers$edges$node(
      index: (l$index as int),
      input: Query$vouchers$vouchers$edges$node$input.fromJson(
          (l$input as Map<String, dynamic>)),
      destination: (l$destination as String),
      payload: (l$payload as String),
      $__typename: (l$$__typename as String),
    );
  }

  final int index;

  final Query$vouchers$vouchers$edges$node$input input;

  final String destination;

  final String payload;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$index = index;
    _resultData['index'] = l$index;
    final l$input = input;
    _resultData['input'] = l$input.toJson();
    final l$destination = destination;
    _resultData['destination'] = l$destination;
    final l$payload = payload;
    _resultData['payload'] = l$payload;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$index = index;
    final l$input = input;
    final l$destination = destination;
    final l$payload = payload;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$index,
      l$input,
      l$destination,
      l$payload,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$vouchers$vouchers$edges$node) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$index = index;
    final lOther$index = other.index;
    if (l$index != lOther$index) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    final l$destination = destination;
    final lOther$destination = other.destination;
    if (l$destination != lOther$destination) {
      return false;
    }
    final l$payload = payload;
    final lOther$payload = other.payload;
    if (l$payload != lOther$payload) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$vouchers$vouchers$edges$node
    on Query$vouchers$vouchers$edges$node {
  CopyWith$Query$vouchers$vouchers$edges$node<
          Query$vouchers$vouchers$edges$node>
      get copyWith => CopyWith$Query$vouchers$vouchers$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$vouchers$vouchers$edges$node<TRes> {
  factory CopyWith$Query$vouchers$vouchers$edges$node(
    Query$vouchers$vouchers$edges$node instance,
    TRes Function(Query$vouchers$vouchers$edges$node) then,
  ) = _CopyWithImpl$Query$vouchers$vouchers$edges$node;

  factory CopyWith$Query$vouchers$vouchers$edges$node.stub(TRes res) =
      _CopyWithStubImpl$Query$vouchers$vouchers$edges$node;

  TRes call({
    int? index,
    Query$vouchers$vouchers$edges$node$input? input,
    String? destination,
    String? payload,
    String? $__typename,
  });
  CopyWith$Query$vouchers$vouchers$edges$node$input<TRes> get input;
}

class _CopyWithImpl$Query$vouchers$vouchers$edges$node<TRes>
    implements CopyWith$Query$vouchers$vouchers$edges$node<TRes> {
  _CopyWithImpl$Query$vouchers$vouchers$edges$node(
    this._instance,
    this._then,
  );

  final Query$vouchers$vouchers$edges$node _instance;

  final TRes Function(Query$vouchers$vouchers$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? index = _undefined,
    Object? input = _undefined,
    Object? destination = _undefined,
    Object? payload = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$vouchers$vouchers$edges$node(
        index: index == _undefined || index == null
            ? _instance.index
            : (index as int),
        input: input == _undefined || input == null
            ? _instance.input
            : (input as Query$vouchers$vouchers$edges$node$input),
        destination: destination == _undefined || destination == null
            ? _instance.destination
            : (destination as String),
        payload: payload == _undefined || payload == null
            ? _instance.payload
            : (payload as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$vouchers$vouchers$edges$node$input<TRes> get input {
    final local$input = _instance.input;
    return CopyWith$Query$vouchers$vouchers$edges$node$input(
        local$input, (e) => call(input: e));
  }
}

class _CopyWithStubImpl$Query$vouchers$vouchers$edges$node<TRes>
    implements CopyWith$Query$vouchers$vouchers$edges$node<TRes> {
  _CopyWithStubImpl$Query$vouchers$vouchers$edges$node(this._res);

  TRes _res;

  call({
    int? index,
    Query$vouchers$vouchers$edges$node$input? input,
    String? destination,
    String? payload,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$vouchers$vouchers$edges$node$input<TRes> get input =>
      CopyWith$Query$vouchers$vouchers$edges$node$input.stub(_res);
}

class Query$vouchers$vouchers$edges$node$input {
  Query$vouchers$vouchers$edges$node$input({
    required this.index,
    required this.payload,
    this.$__typename = 'Input',
  });

  factory Query$vouchers$vouchers$edges$node$input.fromJson(
      Map<String, dynamic> json) {
    final l$index = json['index'];
    final l$payload = json['payload'];
    final l$$__typename = json['__typename'];
    return Query$vouchers$vouchers$edges$node$input(
      index: (l$index as int),
      payload: (l$payload as String),
      $__typename: (l$$__typename as String),
    );
  }

  final int index;

  final String payload;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$index = index;
    _resultData['index'] = l$index;
    final l$payload = payload;
    _resultData['payload'] = l$payload;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$index = index;
    final l$payload = payload;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$index,
      l$payload,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$vouchers$vouchers$edges$node$input) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$index = index;
    final lOther$index = other.index;
    if (l$index != lOther$index) {
      return false;
    }
    final l$payload = payload;
    final lOther$payload = other.payload;
    if (l$payload != lOther$payload) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$vouchers$vouchers$edges$node$input
    on Query$vouchers$vouchers$edges$node$input {
  CopyWith$Query$vouchers$vouchers$edges$node$input<
          Query$vouchers$vouchers$edges$node$input>
      get copyWith => CopyWith$Query$vouchers$vouchers$edges$node$input(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$vouchers$vouchers$edges$node$input<TRes> {
  factory CopyWith$Query$vouchers$vouchers$edges$node$input(
    Query$vouchers$vouchers$edges$node$input instance,
    TRes Function(Query$vouchers$vouchers$edges$node$input) then,
  ) = _CopyWithImpl$Query$vouchers$vouchers$edges$node$input;

  factory CopyWith$Query$vouchers$vouchers$edges$node$input.stub(TRes res) =
      _CopyWithStubImpl$Query$vouchers$vouchers$edges$node$input;

  TRes call({
    int? index,
    String? payload,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$vouchers$vouchers$edges$node$input<TRes>
    implements CopyWith$Query$vouchers$vouchers$edges$node$input<TRes> {
  _CopyWithImpl$Query$vouchers$vouchers$edges$node$input(
    this._instance,
    this._then,
  );

  final Query$vouchers$vouchers$edges$node$input _instance;

  final TRes Function(Query$vouchers$vouchers$edges$node$input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? index = _undefined,
    Object? payload = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$vouchers$vouchers$edges$node$input(
        index: index == _undefined || index == null
            ? _instance.index
            : (index as int),
        payload: payload == _undefined || payload == null
            ? _instance.payload
            : (payload as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$vouchers$vouchers$edges$node$input<TRes>
    implements CopyWith$Query$vouchers$vouchers$edges$node$input<TRes> {
  _CopyWithStubImpl$Query$vouchers$vouchers$edges$node$input(this._res);

  TRes _res;

  call({
    int? index,
    String? payload,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$vouchersByInput {
  factory Variables$Query$vouchersByInput({required int inputIndex}) =>
      Variables$Query$vouchersByInput._({
        r'inputIndex': inputIndex,
      });

  Variables$Query$vouchersByInput._(this._$data);

  factory Variables$Query$vouchersByInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$inputIndex = data['inputIndex'];
    result$data['inputIndex'] = (l$inputIndex as int);
    return Variables$Query$vouchersByInput._(result$data);
  }

  Map<String, dynamic> _$data;

  int get inputIndex => (_$data['inputIndex'] as int);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$inputIndex = inputIndex;
    result$data['inputIndex'] = l$inputIndex;
    return result$data;
  }

  CopyWith$Variables$Query$vouchersByInput<Variables$Query$vouchersByInput>
      get copyWith => CopyWith$Variables$Query$vouchersByInput(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$vouchersByInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$inputIndex = inputIndex;
    final lOther$inputIndex = other.inputIndex;
    if (l$inputIndex != lOther$inputIndex) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$inputIndex = inputIndex;
    return Object.hashAll([l$inputIndex]);
  }
}

abstract class CopyWith$Variables$Query$vouchersByInput<TRes> {
  factory CopyWith$Variables$Query$vouchersByInput(
    Variables$Query$vouchersByInput instance,
    TRes Function(Variables$Query$vouchersByInput) then,
  ) = _CopyWithImpl$Variables$Query$vouchersByInput;

  factory CopyWith$Variables$Query$vouchersByInput.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$vouchersByInput;

  TRes call({int? inputIndex});
}

class _CopyWithImpl$Variables$Query$vouchersByInput<TRes>
    implements CopyWith$Variables$Query$vouchersByInput<TRes> {
  _CopyWithImpl$Variables$Query$vouchersByInput(
    this._instance,
    this._then,
  );

  final Variables$Query$vouchersByInput _instance;

  final TRes Function(Variables$Query$vouchersByInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? inputIndex = _undefined}) =>
      _then(Variables$Query$vouchersByInput._({
        ..._instance._$data,
        if (inputIndex != _undefined && inputIndex != null)
          'inputIndex': (inputIndex as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$vouchersByInput<TRes>
    implements CopyWith$Variables$Query$vouchersByInput<TRes> {
  _CopyWithStubImpl$Variables$Query$vouchersByInput(this._res);

  TRes _res;

  call({int? inputIndex}) => _res;
}

class Query$vouchersByInput {
  Query$vouchersByInput({
    required this.input,
    this.$__typename = 'Query',
  });

  factory Query$vouchersByInput.fromJson(Map<String, dynamic> json) {
    final l$input = json['input'];
    final l$$__typename = json['__typename'];
    return Query$vouchersByInput(
      input: Query$vouchersByInput$input.fromJson(
          (l$input as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$vouchersByInput$input input;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$input = input;
    _resultData['input'] = l$input.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$input = input;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$input,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$vouchersByInput) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$vouchersByInput on Query$vouchersByInput {
  CopyWith$Query$vouchersByInput<Query$vouchersByInput> get copyWith =>
      CopyWith$Query$vouchersByInput(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$vouchersByInput<TRes> {
  factory CopyWith$Query$vouchersByInput(
    Query$vouchersByInput instance,
    TRes Function(Query$vouchersByInput) then,
  ) = _CopyWithImpl$Query$vouchersByInput;

  factory CopyWith$Query$vouchersByInput.stub(TRes res) =
      _CopyWithStubImpl$Query$vouchersByInput;

  TRes call({
    Query$vouchersByInput$input? input,
    String? $__typename,
  });
  CopyWith$Query$vouchersByInput$input<TRes> get input;
}

class _CopyWithImpl$Query$vouchersByInput<TRes>
    implements CopyWith$Query$vouchersByInput<TRes> {
  _CopyWithImpl$Query$vouchersByInput(
    this._instance,
    this._then,
  );

  final Query$vouchersByInput _instance;

  final TRes Function(Query$vouchersByInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? input = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$vouchersByInput(
        input: input == _undefined || input == null
            ? _instance.input
            : (input as Query$vouchersByInput$input),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$vouchersByInput$input<TRes> get input {
    final local$input = _instance.input;
    return CopyWith$Query$vouchersByInput$input(
        local$input, (e) => call(input: e));
  }
}

class _CopyWithStubImpl$Query$vouchersByInput<TRes>
    implements CopyWith$Query$vouchersByInput<TRes> {
  _CopyWithStubImpl$Query$vouchersByInput(this._res);

  TRes _res;

  call({
    Query$vouchersByInput$input? input,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$vouchersByInput$input<TRes> get input =>
      CopyWith$Query$vouchersByInput$input.stub(_res);
}

const documentNodeQueryvouchersByInput = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'vouchersByInput'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'inputIndex')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'input'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'index'),
            value: VariableNode(name: NameNode(value: 'inputIndex')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'vouchers'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'edges'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'node'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'index'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'input'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                            name: NameNode(value: 'index'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: '__typename'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                        ]),
                      ),
                      FieldNode(
                        name: NameNode(value: 'destination'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'payload'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ]),
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$vouchersByInput _parserFn$Query$vouchersByInput(
        Map<String, dynamic> data) =>
    Query$vouchersByInput.fromJson(data);
typedef OnQueryComplete$Query$vouchersByInput = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$vouchersByInput?,
);

class Options$Query$vouchersByInput
    extends graphql.QueryOptions<Query$vouchersByInput> {
  Options$Query$vouchersByInput({
    String? operationName,
    required Variables$Query$vouchersByInput variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$vouchersByInput? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$vouchersByInput? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$vouchersByInput(data),
                  ),
          onError: onError,
          document: documentNodeQueryvouchersByInput,
          parserFn: _parserFn$Query$vouchersByInput,
        );

  final OnQueryComplete$Query$vouchersByInput? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$vouchersByInput
    extends graphql.WatchQueryOptions<Query$vouchersByInput> {
  WatchOptions$Query$vouchersByInput({
    String? operationName,
    required Variables$Query$vouchersByInput variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$vouchersByInput? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryvouchersByInput,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$vouchersByInput,
        );
}

class FetchMoreOptions$Query$vouchersByInput extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$vouchersByInput({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$vouchersByInput variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryvouchersByInput,
        );
}

extension ClientExtension$Query$vouchersByInput on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$vouchersByInput>> query$vouchersByInput(
          Options$Query$vouchersByInput options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$vouchersByInput> watchQuery$vouchersByInput(
          WatchOptions$Query$vouchersByInput options) =>
      this.watchQuery(options);
  void writeQuery$vouchersByInput({
    required Query$vouchersByInput data,
    required Variables$Query$vouchersByInput variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryvouchersByInput),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$vouchersByInput? readQuery$vouchersByInput({
    required Variables$Query$vouchersByInput variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryvouchersByInput),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$vouchersByInput.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$vouchersByInput> useQuery$vouchersByInput(
        Options$Query$vouchersByInput options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$vouchersByInput> useWatchQuery$vouchersByInput(
        WatchOptions$Query$vouchersByInput options) =>
    graphql_flutter.useWatchQuery(options);

class Query$vouchersByInput$Widget
    extends graphql_flutter.Query<Query$vouchersByInput> {
  Query$vouchersByInput$Widget({
    widgets.Key? key,
    required Options$Query$vouchersByInput options,
    required graphql_flutter.QueryBuilder<Query$vouchersByInput> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$vouchersByInput$input {
  Query$vouchersByInput$input({
    required this.vouchers,
    this.$__typename = 'Input',
  });

  factory Query$vouchersByInput$input.fromJson(Map<String, dynamic> json) {
    final l$vouchers = json['vouchers'];
    final l$$__typename = json['__typename'];
    return Query$vouchersByInput$input(
      vouchers: Query$vouchersByInput$input$vouchers.fromJson(
          (l$vouchers as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$vouchersByInput$input$vouchers vouchers;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$vouchers = vouchers;
    _resultData['vouchers'] = l$vouchers.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$vouchers = vouchers;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$vouchers,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$vouchersByInput$input) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$vouchers = vouchers;
    final lOther$vouchers = other.vouchers;
    if (l$vouchers != lOther$vouchers) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$vouchersByInput$input
    on Query$vouchersByInput$input {
  CopyWith$Query$vouchersByInput$input<Query$vouchersByInput$input>
      get copyWith => CopyWith$Query$vouchersByInput$input(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$vouchersByInput$input<TRes> {
  factory CopyWith$Query$vouchersByInput$input(
    Query$vouchersByInput$input instance,
    TRes Function(Query$vouchersByInput$input) then,
  ) = _CopyWithImpl$Query$vouchersByInput$input;

  factory CopyWith$Query$vouchersByInput$input.stub(TRes res) =
      _CopyWithStubImpl$Query$vouchersByInput$input;

  TRes call({
    Query$vouchersByInput$input$vouchers? vouchers,
    String? $__typename,
  });
  CopyWith$Query$vouchersByInput$input$vouchers<TRes> get vouchers;
}

class _CopyWithImpl$Query$vouchersByInput$input<TRes>
    implements CopyWith$Query$vouchersByInput$input<TRes> {
  _CopyWithImpl$Query$vouchersByInput$input(
    this._instance,
    this._then,
  );

  final Query$vouchersByInput$input _instance;

  final TRes Function(Query$vouchersByInput$input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? vouchers = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$vouchersByInput$input(
        vouchers: vouchers == _undefined || vouchers == null
            ? _instance.vouchers
            : (vouchers as Query$vouchersByInput$input$vouchers),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$vouchersByInput$input$vouchers<TRes> get vouchers {
    final local$vouchers = _instance.vouchers;
    return CopyWith$Query$vouchersByInput$input$vouchers(
        local$vouchers, (e) => call(vouchers: e));
  }
}

class _CopyWithStubImpl$Query$vouchersByInput$input<TRes>
    implements CopyWith$Query$vouchersByInput$input<TRes> {
  _CopyWithStubImpl$Query$vouchersByInput$input(this._res);

  TRes _res;

  call({
    Query$vouchersByInput$input$vouchers? vouchers,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$vouchersByInput$input$vouchers<TRes> get vouchers =>
      CopyWith$Query$vouchersByInput$input$vouchers.stub(_res);
}

class Query$vouchersByInput$input$vouchers {
  Query$vouchersByInput$input$vouchers({
    required this.edges,
    this.$__typename = 'VoucherConnection',
  });

  factory Query$vouchersByInput$input$vouchers.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$vouchersByInput$input$vouchers(
      edges: (l$edges as List<dynamic>)
          .map((e) => Query$vouchersByInput$input$vouchers$edges.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$vouchersByInput$input$vouchers$edges> edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$edges.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$vouchersByInput$input$vouchers) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges.length != lOther$edges.length) {
      return false;
    }
    for (int i = 0; i < l$edges.length; i++) {
      final l$edges$entry = l$edges[i];
      final lOther$edges$entry = lOther$edges[i];
      if (l$edges$entry != lOther$edges$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$vouchersByInput$input$vouchers
    on Query$vouchersByInput$input$vouchers {
  CopyWith$Query$vouchersByInput$input$vouchers<
          Query$vouchersByInput$input$vouchers>
      get copyWith => CopyWith$Query$vouchersByInput$input$vouchers(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$vouchersByInput$input$vouchers<TRes> {
  factory CopyWith$Query$vouchersByInput$input$vouchers(
    Query$vouchersByInput$input$vouchers instance,
    TRes Function(Query$vouchersByInput$input$vouchers) then,
  ) = _CopyWithImpl$Query$vouchersByInput$input$vouchers;

  factory CopyWith$Query$vouchersByInput$input$vouchers.stub(TRes res) =
      _CopyWithStubImpl$Query$vouchersByInput$input$vouchers;

  TRes call({
    List<Query$vouchersByInput$input$vouchers$edges>? edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$vouchersByInput$input$vouchers$edges> Function(
              Iterable<
                  CopyWith$Query$vouchersByInput$input$vouchers$edges<
                      Query$vouchersByInput$input$vouchers$edges>>)
          _fn);
}

class _CopyWithImpl$Query$vouchersByInput$input$vouchers<TRes>
    implements CopyWith$Query$vouchersByInput$input$vouchers<TRes> {
  _CopyWithImpl$Query$vouchersByInput$input$vouchers(
    this._instance,
    this._then,
  );

  final Query$vouchersByInput$input$vouchers _instance;

  final TRes Function(Query$vouchersByInput$input$vouchers) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$vouchersByInput$input$vouchers(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<Query$vouchersByInput$input$vouchers$edges>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$vouchersByInput$input$vouchers$edges> Function(
                  Iterable<
                      CopyWith$Query$vouchersByInput$input$vouchers$edges<
                          Query$vouchersByInput$input$vouchers$edges>>)
              _fn) =>
      call(
          edges: _fn(_instance.edges
              .map((e) => CopyWith$Query$vouchersByInput$input$vouchers$edges(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$vouchersByInput$input$vouchers<TRes>
    implements CopyWith$Query$vouchersByInput$input$vouchers<TRes> {
  _CopyWithStubImpl$Query$vouchersByInput$input$vouchers(this._res);

  TRes _res;

  call({
    List<Query$vouchersByInput$input$vouchers$edges>? edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Query$vouchersByInput$input$vouchers$edges {
  Query$vouchersByInput$input$vouchers$edges({
    required this.node,
    this.$__typename = 'VoucherEdge',
  });

  factory Query$vouchersByInput$input$vouchers$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$vouchersByInput$input$vouchers$edges(
      node: Query$vouchersByInput$input$vouchers$edges$node.fromJson(
          (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$vouchersByInput$input$vouchers$edges$node node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$node,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$vouchersByInput$input$vouchers$edges) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$vouchersByInput$input$vouchers$edges
    on Query$vouchersByInput$input$vouchers$edges {
  CopyWith$Query$vouchersByInput$input$vouchers$edges<
          Query$vouchersByInput$input$vouchers$edges>
      get copyWith => CopyWith$Query$vouchersByInput$input$vouchers$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$vouchersByInput$input$vouchers$edges<TRes> {
  factory CopyWith$Query$vouchersByInput$input$vouchers$edges(
    Query$vouchersByInput$input$vouchers$edges instance,
    TRes Function(Query$vouchersByInput$input$vouchers$edges) then,
  ) = _CopyWithImpl$Query$vouchersByInput$input$vouchers$edges;

  factory CopyWith$Query$vouchersByInput$input$vouchers$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$vouchersByInput$input$vouchers$edges;

  TRes call({
    Query$vouchersByInput$input$vouchers$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$vouchersByInput$input$vouchers$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$vouchersByInput$input$vouchers$edges<TRes>
    implements CopyWith$Query$vouchersByInput$input$vouchers$edges<TRes> {
  _CopyWithImpl$Query$vouchersByInput$input$vouchers$edges(
    this._instance,
    this._then,
  );

  final Query$vouchersByInput$input$vouchers$edges _instance;

  final TRes Function(Query$vouchersByInput$input$vouchers$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$vouchersByInput$input$vouchers$edges(
        node: node == _undefined || node == null
            ? _instance.node
            : (node as Query$vouchersByInput$input$vouchers$edges$node),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$vouchersByInput$input$vouchers$edges$node<TRes> get node {
    final local$node = _instance.node;
    return CopyWith$Query$vouchersByInput$input$vouchers$edges$node(
        local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$vouchersByInput$input$vouchers$edges<TRes>
    implements CopyWith$Query$vouchersByInput$input$vouchers$edges<TRes> {
  _CopyWithStubImpl$Query$vouchersByInput$input$vouchers$edges(this._res);

  TRes _res;

  call({
    Query$vouchersByInput$input$vouchers$edges$node? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$vouchersByInput$input$vouchers$edges$node<TRes> get node =>
      CopyWith$Query$vouchersByInput$input$vouchers$edges$node.stub(_res);
}

class Query$vouchersByInput$input$vouchers$edges$node {
  Query$vouchersByInput$input$vouchers$edges$node({
    required this.index,
    required this.input,
    required this.destination,
    required this.payload,
    this.$__typename = 'Voucher',
  });

  factory Query$vouchersByInput$input$vouchers$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$index = json['index'];
    final l$input = json['input'];
    final l$destination = json['destination'];
    final l$payload = json['payload'];
    final l$$__typename = json['__typename'];
    return Query$vouchersByInput$input$vouchers$edges$node(
      index: (l$index as int),
      input: Query$vouchersByInput$input$vouchers$edges$node$input.fromJson(
          (l$input as Map<String, dynamic>)),
      destination: (l$destination as String),
      payload: (l$payload as String),
      $__typename: (l$$__typename as String),
    );
  }

  final int index;

  final Query$vouchersByInput$input$vouchers$edges$node$input input;

  final String destination;

  final String payload;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$index = index;
    _resultData['index'] = l$index;
    final l$input = input;
    _resultData['input'] = l$input.toJson();
    final l$destination = destination;
    _resultData['destination'] = l$destination;
    final l$payload = payload;
    _resultData['payload'] = l$payload;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$index = index;
    final l$input = input;
    final l$destination = destination;
    final l$payload = payload;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$index,
      l$input,
      l$destination,
      l$payload,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$vouchersByInput$input$vouchers$edges$node) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$index = index;
    final lOther$index = other.index;
    if (l$index != lOther$index) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    final l$destination = destination;
    final lOther$destination = other.destination;
    if (l$destination != lOther$destination) {
      return false;
    }
    final l$payload = payload;
    final lOther$payload = other.payload;
    if (l$payload != lOther$payload) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$vouchersByInput$input$vouchers$edges$node
    on Query$vouchersByInput$input$vouchers$edges$node {
  CopyWith$Query$vouchersByInput$input$vouchers$edges$node<
          Query$vouchersByInput$input$vouchers$edges$node>
      get copyWith => CopyWith$Query$vouchersByInput$input$vouchers$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$vouchersByInput$input$vouchers$edges$node<TRes> {
  factory CopyWith$Query$vouchersByInput$input$vouchers$edges$node(
    Query$vouchersByInput$input$vouchers$edges$node instance,
    TRes Function(Query$vouchersByInput$input$vouchers$edges$node) then,
  ) = _CopyWithImpl$Query$vouchersByInput$input$vouchers$edges$node;

  factory CopyWith$Query$vouchersByInput$input$vouchers$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Query$vouchersByInput$input$vouchers$edges$node;

  TRes call({
    int? index,
    Query$vouchersByInput$input$vouchers$edges$node$input? input,
    String? destination,
    String? payload,
    String? $__typename,
  });
  CopyWith$Query$vouchersByInput$input$vouchers$edges$node$input<TRes>
      get input;
}

class _CopyWithImpl$Query$vouchersByInput$input$vouchers$edges$node<TRes>
    implements CopyWith$Query$vouchersByInput$input$vouchers$edges$node<TRes> {
  _CopyWithImpl$Query$vouchersByInput$input$vouchers$edges$node(
    this._instance,
    this._then,
  );

  final Query$vouchersByInput$input$vouchers$edges$node _instance;

  final TRes Function(Query$vouchersByInput$input$vouchers$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? index = _undefined,
    Object? input = _undefined,
    Object? destination = _undefined,
    Object? payload = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$vouchersByInput$input$vouchers$edges$node(
        index: index == _undefined || index == null
            ? _instance.index
            : (index as int),
        input: input == _undefined || input == null
            ? _instance.input
            : (input as Query$vouchersByInput$input$vouchers$edges$node$input),
        destination: destination == _undefined || destination == null
            ? _instance.destination
            : (destination as String),
        payload: payload == _undefined || payload == null
            ? _instance.payload
            : (payload as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$vouchersByInput$input$vouchers$edges$node$input<TRes>
      get input {
    final local$input = _instance.input;
    return CopyWith$Query$vouchersByInput$input$vouchers$edges$node$input(
        local$input, (e) => call(input: e));
  }
}

class _CopyWithStubImpl$Query$vouchersByInput$input$vouchers$edges$node<TRes>
    implements CopyWith$Query$vouchersByInput$input$vouchers$edges$node<TRes> {
  _CopyWithStubImpl$Query$vouchersByInput$input$vouchers$edges$node(this._res);

  TRes _res;

  call({
    int? index,
    Query$vouchersByInput$input$vouchers$edges$node$input? input,
    String? destination,
    String? payload,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$vouchersByInput$input$vouchers$edges$node$input<TRes>
      get input =>
          CopyWith$Query$vouchersByInput$input$vouchers$edges$node$input.stub(
              _res);
}

class Query$vouchersByInput$input$vouchers$edges$node$input {
  Query$vouchersByInput$input$vouchers$edges$node$input({
    required this.index,
    this.$__typename = 'Input',
  });

  factory Query$vouchersByInput$input$vouchers$edges$node$input.fromJson(
      Map<String, dynamic> json) {
    final l$index = json['index'];
    final l$$__typename = json['__typename'];
    return Query$vouchersByInput$input$vouchers$edges$node$input(
      index: (l$index as int),
      $__typename: (l$$__typename as String),
    );
  }

  final int index;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$index = index;
    _resultData['index'] = l$index;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$index = index;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$index,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$vouchersByInput$input$vouchers$edges$node$input) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$index = index;
    final lOther$index = other.index;
    if (l$index != lOther$index) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$vouchersByInput$input$vouchers$edges$node$input
    on Query$vouchersByInput$input$vouchers$edges$node$input {
  CopyWith$Query$vouchersByInput$input$vouchers$edges$node$input<
          Query$vouchersByInput$input$vouchers$edges$node$input>
      get copyWith =>
          CopyWith$Query$vouchersByInput$input$vouchers$edges$node$input(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$vouchersByInput$input$vouchers$edges$node$input<
    TRes> {
  factory CopyWith$Query$vouchersByInput$input$vouchers$edges$node$input(
    Query$vouchersByInput$input$vouchers$edges$node$input instance,
    TRes Function(Query$vouchersByInput$input$vouchers$edges$node$input) then,
  ) = _CopyWithImpl$Query$vouchersByInput$input$vouchers$edges$node$input;

  factory CopyWith$Query$vouchersByInput$input$vouchers$edges$node$input.stub(
          TRes res) =
      _CopyWithStubImpl$Query$vouchersByInput$input$vouchers$edges$node$input;

  TRes call({
    int? index,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$vouchersByInput$input$vouchers$edges$node$input<TRes>
    implements
        CopyWith$Query$vouchersByInput$input$vouchers$edges$node$input<TRes> {
  _CopyWithImpl$Query$vouchersByInput$input$vouchers$edges$node$input(
    this._instance,
    this._then,
  );

  final Query$vouchersByInput$input$vouchers$edges$node$input _instance;

  final TRes Function(Query$vouchersByInput$input$vouchers$edges$node$input)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? index = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$vouchersByInput$input$vouchers$edges$node$input(
        index: index == _undefined || index == null
            ? _instance.index
            : (index as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$vouchersByInput$input$vouchers$edges$node$input<
        TRes>
    implements
        CopyWith$Query$vouchersByInput$input$vouchers$edges$node$input<TRes> {
  _CopyWithStubImpl$Query$vouchersByInput$input$vouchers$edges$node$input(
      this._res);

  TRes _res;

  call({
    int? index,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$report {
  factory Variables$Query$report({
    required int reportIndex,
    required int inputIndex,
  }) =>
      Variables$Query$report._({
        r'reportIndex': reportIndex,
        r'inputIndex': inputIndex,
      });

  Variables$Query$report._(this._$data);

  factory Variables$Query$report.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$reportIndex = data['reportIndex'];
    result$data['reportIndex'] = (l$reportIndex as int);
    final l$inputIndex = data['inputIndex'];
    result$data['inputIndex'] = (l$inputIndex as int);
    return Variables$Query$report._(result$data);
  }

  Map<String, dynamic> _$data;

  int get reportIndex => (_$data['reportIndex'] as int);

  int get inputIndex => (_$data['inputIndex'] as int);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$reportIndex = reportIndex;
    result$data['reportIndex'] = l$reportIndex;
    final l$inputIndex = inputIndex;
    result$data['inputIndex'] = l$inputIndex;
    return result$data;
  }

  CopyWith$Variables$Query$report<Variables$Query$report> get copyWith =>
      CopyWith$Variables$Query$report(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$report) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$reportIndex = reportIndex;
    final lOther$reportIndex = other.reportIndex;
    if (l$reportIndex != lOther$reportIndex) {
      return false;
    }
    final l$inputIndex = inputIndex;
    final lOther$inputIndex = other.inputIndex;
    if (l$inputIndex != lOther$inputIndex) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$reportIndex = reportIndex;
    final l$inputIndex = inputIndex;
    return Object.hashAll([
      l$reportIndex,
      l$inputIndex,
    ]);
  }
}

abstract class CopyWith$Variables$Query$report<TRes> {
  factory CopyWith$Variables$Query$report(
    Variables$Query$report instance,
    TRes Function(Variables$Query$report) then,
  ) = _CopyWithImpl$Variables$Query$report;

  factory CopyWith$Variables$Query$report.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$report;

  TRes call({
    int? reportIndex,
    int? inputIndex,
  });
}

class _CopyWithImpl$Variables$Query$report<TRes>
    implements CopyWith$Variables$Query$report<TRes> {
  _CopyWithImpl$Variables$Query$report(
    this._instance,
    this._then,
  );

  final Variables$Query$report _instance;

  final TRes Function(Variables$Query$report) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? reportIndex = _undefined,
    Object? inputIndex = _undefined,
  }) =>
      _then(Variables$Query$report._({
        ..._instance._$data,
        if (reportIndex != _undefined && reportIndex != null)
          'reportIndex': (reportIndex as int),
        if (inputIndex != _undefined && inputIndex != null)
          'inputIndex': (inputIndex as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$report<TRes>
    implements CopyWith$Variables$Query$report<TRes> {
  _CopyWithStubImpl$Variables$Query$report(this._res);

  TRes _res;

  call({
    int? reportIndex,
    int? inputIndex,
  }) =>
      _res;
}

class Query$report {
  Query$report({
    required this.report,
    this.$__typename = 'Query',
  });

  factory Query$report.fromJson(Map<String, dynamic> json) {
    final l$report = json['report'];
    final l$$__typename = json['__typename'];
    return Query$report(
      report: Query$report$report.fromJson((l$report as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$report$report report;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$report = report;
    _resultData['report'] = l$report.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$report = report;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$report,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$report) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$report = report;
    final lOther$report = other.report;
    if (l$report != lOther$report) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$report on Query$report {
  CopyWith$Query$report<Query$report> get copyWith => CopyWith$Query$report(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$report<TRes> {
  factory CopyWith$Query$report(
    Query$report instance,
    TRes Function(Query$report) then,
  ) = _CopyWithImpl$Query$report;

  factory CopyWith$Query$report.stub(TRes res) = _CopyWithStubImpl$Query$report;

  TRes call({
    Query$report$report? report,
    String? $__typename,
  });
  CopyWith$Query$report$report<TRes> get report;
}

class _CopyWithImpl$Query$report<TRes> implements CopyWith$Query$report<TRes> {
  _CopyWithImpl$Query$report(
    this._instance,
    this._then,
  );

  final Query$report _instance;

  final TRes Function(Query$report) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? report = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$report(
        report: report == _undefined || report == null
            ? _instance.report
            : (report as Query$report$report),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$report$report<TRes> get report {
    final local$report = _instance.report;
    return CopyWith$Query$report$report(local$report, (e) => call(report: e));
  }
}

class _CopyWithStubImpl$Query$report<TRes>
    implements CopyWith$Query$report<TRes> {
  _CopyWithStubImpl$Query$report(this._res);

  TRes _res;

  call({
    Query$report$report? report,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$report$report<TRes> get report =>
      CopyWith$Query$report$report.stub(_res);
}

const documentNodeQueryreport = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'report'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'reportIndex')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'inputIndex')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'report'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'reportIndex'),
            value: VariableNode(name: NameNode(value: 'reportIndex')),
          ),
          ArgumentNode(
            name: NameNode(value: 'inputIndex'),
            value: VariableNode(name: NameNode(value: 'inputIndex')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'index'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'input'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'index'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'payload'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'payload'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$report _parserFn$Query$report(Map<String, dynamic> data) =>
    Query$report.fromJson(data);
typedef OnQueryComplete$Query$report = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$report?,
);

class Options$Query$report extends graphql.QueryOptions<Query$report> {
  Options$Query$report({
    String? operationName,
    required Variables$Query$report variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$report? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$report? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$report(data),
                  ),
          onError: onError,
          document: documentNodeQueryreport,
          parserFn: _parserFn$Query$report,
        );

  final OnQueryComplete$Query$report? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$report
    extends graphql.WatchQueryOptions<Query$report> {
  WatchOptions$Query$report({
    String? operationName,
    required Variables$Query$report variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$report? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryreport,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$report,
        );
}

class FetchMoreOptions$Query$report extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$report({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$report variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryreport,
        );
}

extension ClientExtension$Query$report on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$report>> query$report(
          Options$Query$report options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$report> watchQuery$report(
          WatchOptions$Query$report options) =>
      this.watchQuery(options);
  void writeQuery$report({
    required Query$report data,
    required Variables$Query$report variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryreport),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$report? readQuery$report({
    required Variables$Query$report variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryreport),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$report.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$report> useQuery$report(
        Options$Query$report options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$report> useWatchQuery$report(
        WatchOptions$Query$report options) =>
    graphql_flutter.useWatchQuery(options);

class Query$report$Widget extends graphql_flutter.Query<Query$report> {
  Query$report$Widget({
    widgets.Key? key,
    required Options$Query$report options,
    required graphql_flutter.QueryBuilder<Query$report> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$report$report {
  Query$report$report({
    required this.index,
    required this.input,
    required this.payload,
    this.$__typename = 'Report',
  });

  factory Query$report$report.fromJson(Map<String, dynamic> json) {
    final l$index = json['index'];
    final l$input = json['input'];
    final l$payload = json['payload'];
    final l$$__typename = json['__typename'];
    return Query$report$report(
      index: (l$index as int),
      input:
          Query$report$report$input.fromJson((l$input as Map<String, dynamic>)),
      payload: (l$payload as String),
      $__typename: (l$$__typename as String),
    );
  }

  final int index;

  final Query$report$report$input input;

  final String payload;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$index = index;
    _resultData['index'] = l$index;
    final l$input = input;
    _resultData['input'] = l$input.toJson();
    final l$payload = payload;
    _resultData['payload'] = l$payload;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$index = index;
    final l$input = input;
    final l$payload = payload;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$index,
      l$input,
      l$payload,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$report$report) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$index = index;
    final lOther$index = other.index;
    if (l$index != lOther$index) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    final l$payload = payload;
    final lOther$payload = other.payload;
    if (l$payload != lOther$payload) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$report$report on Query$report$report {
  CopyWith$Query$report$report<Query$report$report> get copyWith =>
      CopyWith$Query$report$report(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$report$report<TRes> {
  factory CopyWith$Query$report$report(
    Query$report$report instance,
    TRes Function(Query$report$report) then,
  ) = _CopyWithImpl$Query$report$report;

  factory CopyWith$Query$report$report.stub(TRes res) =
      _CopyWithStubImpl$Query$report$report;

  TRes call({
    int? index,
    Query$report$report$input? input,
    String? payload,
    String? $__typename,
  });
  CopyWith$Query$report$report$input<TRes> get input;
}

class _CopyWithImpl$Query$report$report<TRes>
    implements CopyWith$Query$report$report<TRes> {
  _CopyWithImpl$Query$report$report(
    this._instance,
    this._then,
  );

  final Query$report$report _instance;

  final TRes Function(Query$report$report) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? index = _undefined,
    Object? input = _undefined,
    Object? payload = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$report$report(
        index: index == _undefined || index == null
            ? _instance.index
            : (index as int),
        input: input == _undefined || input == null
            ? _instance.input
            : (input as Query$report$report$input),
        payload: payload == _undefined || payload == null
            ? _instance.payload
            : (payload as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$report$report$input<TRes> get input {
    final local$input = _instance.input;
    return CopyWith$Query$report$report$input(
        local$input, (e) => call(input: e));
  }
}

class _CopyWithStubImpl$Query$report$report<TRes>
    implements CopyWith$Query$report$report<TRes> {
  _CopyWithStubImpl$Query$report$report(this._res);

  TRes _res;

  call({
    int? index,
    Query$report$report$input? input,
    String? payload,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$report$report$input<TRes> get input =>
      CopyWith$Query$report$report$input.stub(_res);
}

class Query$report$report$input {
  Query$report$report$input({
    required this.index,
    required this.payload,
    this.$__typename = 'Input',
  });

  factory Query$report$report$input.fromJson(Map<String, dynamic> json) {
    final l$index = json['index'];
    final l$payload = json['payload'];
    final l$$__typename = json['__typename'];
    return Query$report$report$input(
      index: (l$index as int),
      payload: (l$payload as String),
      $__typename: (l$$__typename as String),
    );
  }

  final int index;

  final String payload;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$index = index;
    _resultData['index'] = l$index;
    final l$payload = payload;
    _resultData['payload'] = l$payload;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$index = index;
    final l$payload = payload;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$index,
      l$payload,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$report$report$input) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$index = index;
    final lOther$index = other.index;
    if (l$index != lOther$index) {
      return false;
    }
    final l$payload = payload;
    final lOther$payload = other.payload;
    if (l$payload != lOther$payload) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$report$report$input
    on Query$report$report$input {
  CopyWith$Query$report$report$input<Query$report$report$input> get copyWith =>
      CopyWith$Query$report$report$input(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$report$report$input<TRes> {
  factory CopyWith$Query$report$report$input(
    Query$report$report$input instance,
    TRes Function(Query$report$report$input) then,
  ) = _CopyWithImpl$Query$report$report$input;

  factory CopyWith$Query$report$report$input.stub(TRes res) =
      _CopyWithStubImpl$Query$report$report$input;

  TRes call({
    int? index,
    String? payload,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$report$report$input<TRes>
    implements CopyWith$Query$report$report$input<TRes> {
  _CopyWithImpl$Query$report$report$input(
    this._instance,
    this._then,
  );

  final Query$report$report$input _instance;

  final TRes Function(Query$report$report$input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? index = _undefined,
    Object? payload = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$report$report$input(
        index: index == _undefined || index == null
            ? _instance.index
            : (index as int),
        payload: payload == _undefined || payload == null
            ? _instance.payload
            : (payload as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$report$report$input<TRes>
    implements CopyWith$Query$report$report$input<TRes> {
  _CopyWithStubImpl$Query$report$report$input(this._res);

  TRes _res;

  call({
    int? index,
    String? payload,
    String? $__typename,
  }) =>
      _res;
}

class Query$reports {
  Query$reports({
    required this.reports,
    this.$__typename = 'Query',
  });

  factory Query$reports.fromJson(Map<String, dynamic> json) {
    final l$reports = json['reports'];
    final l$$__typename = json['__typename'];
    return Query$reports(
      reports:
          Query$reports$reports.fromJson((l$reports as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$reports$reports reports;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$reports = reports;
    _resultData['reports'] = l$reports.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$reports = reports;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$reports,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$reports) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$reports = reports;
    final lOther$reports = other.reports;
    if (l$reports != lOther$reports) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$reports on Query$reports {
  CopyWith$Query$reports<Query$reports> get copyWith => CopyWith$Query$reports(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$reports<TRes> {
  factory CopyWith$Query$reports(
    Query$reports instance,
    TRes Function(Query$reports) then,
  ) = _CopyWithImpl$Query$reports;

  factory CopyWith$Query$reports.stub(TRes res) =
      _CopyWithStubImpl$Query$reports;

  TRes call({
    Query$reports$reports? reports,
    String? $__typename,
  });
  CopyWith$Query$reports$reports<TRes> get reports;
}

class _CopyWithImpl$Query$reports<TRes>
    implements CopyWith$Query$reports<TRes> {
  _CopyWithImpl$Query$reports(
    this._instance,
    this._then,
  );

  final Query$reports _instance;

  final TRes Function(Query$reports) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? reports = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$reports(
        reports: reports == _undefined || reports == null
            ? _instance.reports
            : (reports as Query$reports$reports),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$reports$reports<TRes> get reports {
    final local$reports = _instance.reports;
    return CopyWith$Query$reports$reports(
        local$reports, (e) => call(reports: e));
  }
}

class _CopyWithStubImpl$Query$reports<TRes>
    implements CopyWith$Query$reports<TRes> {
  _CopyWithStubImpl$Query$reports(this._res);

  TRes _res;

  call({
    Query$reports$reports? reports,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$reports$reports<TRes> get reports =>
      CopyWith$Query$reports$reports.stub(_res);
}

const documentNodeQueryreports = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'reports'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'reports'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'edges'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'node'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'index'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'input'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'index'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'payload'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ]),
                  ),
                  FieldNode(
                    name: NameNode(value: 'payload'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$reports _parserFn$Query$reports(Map<String, dynamic> data) =>
    Query$reports.fromJson(data);
typedef OnQueryComplete$Query$reports = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$reports?,
);

class Options$Query$reports extends graphql.QueryOptions<Query$reports> {
  Options$Query$reports({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$reports? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$reports? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$reports(data),
                  ),
          onError: onError,
          document: documentNodeQueryreports,
          parserFn: _parserFn$Query$reports,
        );

  final OnQueryComplete$Query$reports? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$reports
    extends graphql.WatchQueryOptions<Query$reports> {
  WatchOptions$Query$reports({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$reports? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryreports,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$reports,
        );
}

class FetchMoreOptions$Query$reports extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$reports({required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryreports,
        );
}

extension ClientExtension$Query$reports on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$reports>> query$reports(
          [Options$Query$reports? options]) async =>
      await this.query(options ?? Options$Query$reports());
  graphql.ObservableQuery<Query$reports> watchQuery$reports(
          [WatchOptions$Query$reports? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$reports());
  void writeQuery$reports({
    required Query$reports data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(document: documentNodeQueryreports)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$reports? readQuery$reports({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryreports)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$reports.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$reports> useQuery$reports(
        [Options$Query$reports? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$reports());
graphql.ObservableQuery<Query$reports> useWatchQuery$reports(
        [WatchOptions$Query$reports? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$reports());

class Query$reports$Widget extends graphql_flutter.Query<Query$reports> {
  Query$reports$Widget({
    widgets.Key? key,
    Options$Query$reports? options,
    required graphql_flutter.QueryBuilder<Query$reports> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$reports(),
          builder: builder,
        );
}

class Query$reports$reports {
  Query$reports$reports({
    required this.edges,
    this.$__typename = 'ReportConnection',
  });

  factory Query$reports$reports.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$reports$reports(
      edges: (l$edges as List<dynamic>)
          .map((e) =>
              Query$reports$reports$edges.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$reports$reports$edges> edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$edges.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$reports$reports) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges.length != lOther$edges.length) {
      return false;
    }
    for (int i = 0; i < l$edges.length; i++) {
      final l$edges$entry = l$edges[i];
      final lOther$edges$entry = lOther$edges[i];
      if (l$edges$entry != lOther$edges$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$reports$reports on Query$reports$reports {
  CopyWith$Query$reports$reports<Query$reports$reports> get copyWith =>
      CopyWith$Query$reports$reports(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$reports$reports<TRes> {
  factory CopyWith$Query$reports$reports(
    Query$reports$reports instance,
    TRes Function(Query$reports$reports) then,
  ) = _CopyWithImpl$Query$reports$reports;

  factory CopyWith$Query$reports$reports.stub(TRes res) =
      _CopyWithStubImpl$Query$reports$reports;

  TRes call({
    List<Query$reports$reports$edges>? edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$reports$reports$edges> Function(
              Iterable<
                  CopyWith$Query$reports$reports$edges<
                      Query$reports$reports$edges>>)
          _fn);
}

class _CopyWithImpl$Query$reports$reports<TRes>
    implements CopyWith$Query$reports$reports<TRes> {
  _CopyWithImpl$Query$reports$reports(
    this._instance,
    this._then,
  );

  final Query$reports$reports _instance;

  final TRes Function(Query$reports$reports) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$reports$reports(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<Query$reports$reports$edges>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$reports$reports$edges> Function(
                  Iterable<
                      CopyWith$Query$reports$reports$edges<
                          Query$reports$reports$edges>>)
              _fn) =>
      call(
          edges: _fn(
              _instance.edges.map((e) => CopyWith$Query$reports$reports$edges(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$reports$reports<TRes>
    implements CopyWith$Query$reports$reports<TRes> {
  _CopyWithStubImpl$Query$reports$reports(this._res);

  TRes _res;

  call({
    List<Query$reports$reports$edges>? edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Query$reports$reports$edges {
  Query$reports$reports$edges({
    required this.node,
    this.$__typename = 'ReportEdge',
  });

  factory Query$reports$reports$edges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$reports$reports$edges(
      node: Query$reports$reports$edges$node.fromJson(
          (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$reports$reports$edges$node node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$node,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$reports$reports$edges) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$reports$reports$edges
    on Query$reports$reports$edges {
  CopyWith$Query$reports$reports$edges<Query$reports$reports$edges>
      get copyWith => CopyWith$Query$reports$reports$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$reports$reports$edges<TRes> {
  factory CopyWith$Query$reports$reports$edges(
    Query$reports$reports$edges instance,
    TRes Function(Query$reports$reports$edges) then,
  ) = _CopyWithImpl$Query$reports$reports$edges;

  factory CopyWith$Query$reports$reports$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$reports$reports$edges;

  TRes call({
    Query$reports$reports$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$reports$reports$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$reports$reports$edges<TRes>
    implements CopyWith$Query$reports$reports$edges<TRes> {
  _CopyWithImpl$Query$reports$reports$edges(
    this._instance,
    this._then,
  );

  final Query$reports$reports$edges _instance;

  final TRes Function(Query$reports$reports$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$reports$reports$edges(
        node: node == _undefined || node == null
            ? _instance.node
            : (node as Query$reports$reports$edges$node),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$reports$reports$edges$node<TRes> get node {
    final local$node = _instance.node;
    return CopyWith$Query$reports$reports$edges$node(
        local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$reports$reports$edges<TRes>
    implements CopyWith$Query$reports$reports$edges<TRes> {
  _CopyWithStubImpl$Query$reports$reports$edges(this._res);

  TRes _res;

  call({
    Query$reports$reports$edges$node? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$reports$reports$edges$node<TRes> get node =>
      CopyWith$Query$reports$reports$edges$node.stub(_res);
}

class Query$reports$reports$edges$node {
  Query$reports$reports$edges$node({
    required this.index,
    required this.input,
    required this.payload,
    this.$__typename = 'Report',
  });

  factory Query$reports$reports$edges$node.fromJson(Map<String, dynamic> json) {
    final l$index = json['index'];
    final l$input = json['input'];
    final l$payload = json['payload'];
    final l$$__typename = json['__typename'];
    return Query$reports$reports$edges$node(
      index: (l$index as int),
      input: Query$reports$reports$edges$node$input.fromJson(
          (l$input as Map<String, dynamic>)),
      payload: (l$payload as String),
      $__typename: (l$$__typename as String),
    );
  }

  final int index;

  final Query$reports$reports$edges$node$input input;

  final String payload;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$index = index;
    _resultData['index'] = l$index;
    final l$input = input;
    _resultData['input'] = l$input.toJson();
    final l$payload = payload;
    _resultData['payload'] = l$payload;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$index = index;
    final l$input = input;
    final l$payload = payload;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$index,
      l$input,
      l$payload,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$reports$reports$edges$node) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$index = index;
    final lOther$index = other.index;
    if (l$index != lOther$index) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    final l$payload = payload;
    final lOther$payload = other.payload;
    if (l$payload != lOther$payload) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$reports$reports$edges$node
    on Query$reports$reports$edges$node {
  CopyWith$Query$reports$reports$edges$node<Query$reports$reports$edges$node>
      get copyWith => CopyWith$Query$reports$reports$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$reports$reports$edges$node<TRes> {
  factory CopyWith$Query$reports$reports$edges$node(
    Query$reports$reports$edges$node instance,
    TRes Function(Query$reports$reports$edges$node) then,
  ) = _CopyWithImpl$Query$reports$reports$edges$node;

  factory CopyWith$Query$reports$reports$edges$node.stub(TRes res) =
      _CopyWithStubImpl$Query$reports$reports$edges$node;

  TRes call({
    int? index,
    Query$reports$reports$edges$node$input? input,
    String? payload,
    String? $__typename,
  });
  CopyWith$Query$reports$reports$edges$node$input<TRes> get input;
}

class _CopyWithImpl$Query$reports$reports$edges$node<TRes>
    implements CopyWith$Query$reports$reports$edges$node<TRes> {
  _CopyWithImpl$Query$reports$reports$edges$node(
    this._instance,
    this._then,
  );

  final Query$reports$reports$edges$node _instance;

  final TRes Function(Query$reports$reports$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? index = _undefined,
    Object? input = _undefined,
    Object? payload = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$reports$reports$edges$node(
        index: index == _undefined || index == null
            ? _instance.index
            : (index as int),
        input: input == _undefined || input == null
            ? _instance.input
            : (input as Query$reports$reports$edges$node$input),
        payload: payload == _undefined || payload == null
            ? _instance.payload
            : (payload as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$reports$reports$edges$node$input<TRes> get input {
    final local$input = _instance.input;
    return CopyWith$Query$reports$reports$edges$node$input(
        local$input, (e) => call(input: e));
  }
}

class _CopyWithStubImpl$Query$reports$reports$edges$node<TRes>
    implements CopyWith$Query$reports$reports$edges$node<TRes> {
  _CopyWithStubImpl$Query$reports$reports$edges$node(this._res);

  TRes _res;

  call({
    int? index,
    Query$reports$reports$edges$node$input? input,
    String? payload,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$reports$reports$edges$node$input<TRes> get input =>
      CopyWith$Query$reports$reports$edges$node$input.stub(_res);
}

class Query$reports$reports$edges$node$input {
  Query$reports$reports$edges$node$input({
    required this.index,
    required this.payload,
    this.$__typename = 'Input',
  });

  factory Query$reports$reports$edges$node$input.fromJson(
      Map<String, dynamic> json) {
    final l$index = json['index'];
    final l$payload = json['payload'];
    final l$$__typename = json['__typename'];
    return Query$reports$reports$edges$node$input(
      index: (l$index as int),
      payload: (l$payload as String),
      $__typename: (l$$__typename as String),
    );
  }

  final int index;

  final String payload;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$index = index;
    _resultData['index'] = l$index;
    final l$payload = payload;
    _resultData['payload'] = l$payload;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$index = index;
    final l$payload = payload;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$index,
      l$payload,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$reports$reports$edges$node$input) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$index = index;
    final lOther$index = other.index;
    if (l$index != lOther$index) {
      return false;
    }
    final l$payload = payload;
    final lOther$payload = other.payload;
    if (l$payload != lOther$payload) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$reports$reports$edges$node$input
    on Query$reports$reports$edges$node$input {
  CopyWith$Query$reports$reports$edges$node$input<
          Query$reports$reports$edges$node$input>
      get copyWith => CopyWith$Query$reports$reports$edges$node$input(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$reports$reports$edges$node$input<TRes> {
  factory CopyWith$Query$reports$reports$edges$node$input(
    Query$reports$reports$edges$node$input instance,
    TRes Function(Query$reports$reports$edges$node$input) then,
  ) = _CopyWithImpl$Query$reports$reports$edges$node$input;

  factory CopyWith$Query$reports$reports$edges$node$input.stub(TRes res) =
      _CopyWithStubImpl$Query$reports$reports$edges$node$input;

  TRes call({
    int? index,
    String? payload,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$reports$reports$edges$node$input<TRes>
    implements CopyWith$Query$reports$reports$edges$node$input<TRes> {
  _CopyWithImpl$Query$reports$reports$edges$node$input(
    this._instance,
    this._then,
  );

  final Query$reports$reports$edges$node$input _instance;

  final TRes Function(Query$reports$reports$edges$node$input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? index = _undefined,
    Object? payload = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$reports$reports$edges$node$input(
        index: index == _undefined || index == null
            ? _instance.index
            : (index as int),
        payload: payload == _undefined || payload == null
            ? _instance.payload
            : (payload as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$reports$reports$edges$node$input<TRes>
    implements CopyWith$Query$reports$reports$edges$node$input<TRes> {
  _CopyWithStubImpl$Query$reports$reports$edges$node$input(this._res);

  TRes _res;

  call({
    int? index,
    String? payload,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$reportsByInput {
  factory Variables$Query$reportsByInput({required int inputIndex}) =>
      Variables$Query$reportsByInput._({
        r'inputIndex': inputIndex,
      });

  Variables$Query$reportsByInput._(this._$data);

  factory Variables$Query$reportsByInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$inputIndex = data['inputIndex'];
    result$data['inputIndex'] = (l$inputIndex as int);
    return Variables$Query$reportsByInput._(result$data);
  }

  Map<String, dynamic> _$data;

  int get inputIndex => (_$data['inputIndex'] as int);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$inputIndex = inputIndex;
    result$data['inputIndex'] = l$inputIndex;
    return result$data;
  }

  CopyWith$Variables$Query$reportsByInput<Variables$Query$reportsByInput>
      get copyWith => CopyWith$Variables$Query$reportsByInput(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$reportsByInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$inputIndex = inputIndex;
    final lOther$inputIndex = other.inputIndex;
    if (l$inputIndex != lOther$inputIndex) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$inputIndex = inputIndex;
    return Object.hashAll([l$inputIndex]);
  }
}

abstract class CopyWith$Variables$Query$reportsByInput<TRes> {
  factory CopyWith$Variables$Query$reportsByInput(
    Variables$Query$reportsByInput instance,
    TRes Function(Variables$Query$reportsByInput) then,
  ) = _CopyWithImpl$Variables$Query$reportsByInput;

  factory CopyWith$Variables$Query$reportsByInput.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$reportsByInput;

  TRes call({int? inputIndex});
}

class _CopyWithImpl$Variables$Query$reportsByInput<TRes>
    implements CopyWith$Variables$Query$reportsByInput<TRes> {
  _CopyWithImpl$Variables$Query$reportsByInput(
    this._instance,
    this._then,
  );

  final Variables$Query$reportsByInput _instance;

  final TRes Function(Variables$Query$reportsByInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? inputIndex = _undefined}) =>
      _then(Variables$Query$reportsByInput._({
        ..._instance._$data,
        if (inputIndex != _undefined && inputIndex != null)
          'inputIndex': (inputIndex as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$reportsByInput<TRes>
    implements CopyWith$Variables$Query$reportsByInput<TRes> {
  _CopyWithStubImpl$Variables$Query$reportsByInput(this._res);

  TRes _res;

  call({int? inputIndex}) => _res;
}

class Query$reportsByInput {
  Query$reportsByInput({
    required this.input,
    this.$__typename = 'Query',
  });

  factory Query$reportsByInput.fromJson(Map<String, dynamic> json) {
    final l$input = json['input'];
    final l$$__typename = json['__typename'];
    return Query$reportsByInput(
      input: Query$reportsByInput$input.fromJson(
          (l$input as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$reportsByInput$input input;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$input = input;
    _resultData['input'] = l$input.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$input = input;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$input,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$reportsByInput) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$reportsByInput on Query$reportsByInput {
  CopyWith$Query$reportsByInput<Query$reportsByInput> get copyWith =>
      CopyWith$Query$reportsByInput(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$reportsByInput<TRes> {
  factory CopyWith$Query$reportsByInput(
    Query$reportsByInput instance,
    TRes Function(Query$reportsByInput) then,
  ) = _CopyWithImpl$Query$reportsByInput;

  factory CopyWith$Query$reportsByInput.stub(TRes res) =
      _CopyWithStubImpl$Query$reportsByInput;

  TRes call({
    Query$reportsByInput$input? input,
    String? $__typename,
  });
  CopyWith$Query$reportsByInput$input<TRes> get input;
}

class _CopyWithImpl$Query$reportsByInput<TRes>
    implements CopyWith$Query$reportsByInput<TRes> {
  _CopyWithImpl$Query$reportsByInput(
    this._instance,
    this._then,
  );

  final Query$reportsByInput _instance;

  final TRes Function(Query$reportsByInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? input = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$reportsByInput(
        input: input == _undefined || input == null
            ? _instance.input
            : (input as Query$reportsByInput$input),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$reportsByInput$input<TRes> get input {
    final local$input = _instance.input;
    return CopyWith$Query$reportsByInput$input(
        local$input, (e) => call(input: e));
  }
}

class _CopyWithStubImpl$Query$reportsByInput<TRes>
    implements CopyWith$Query$reportsByInput<TRes> {
  _CopyWithStubImpl$Query$reportsByInput(this._res);

  TRes _res;

  call({
    Query$reportsByInput$input? input,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$reportsByInput$input<TRes> get input =>
      CopyWith$Query$reportsByInput$input.stub(_res);
}

const documentNodeQueryreportsByInput = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'reportsByInput'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'inputIndex')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'input'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'index'),
            value: VariableNode(name: NameNode(value: 'inputIndex')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'reports'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'edges'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'node'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'index'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'input'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                            name: NameNode(value: 'index'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: '__typename'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                        ]),
                      ),
                      FieldNode(
                        name: NameNode(value: 'payload'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ]),
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$reportsByInput _parserFn$Query$reportsByInput(
        Map<String, dynamic> data) =>
    Query$reportsByInput.fromJson(data);
typedef OnQueryComplete$Query$reportsByInput = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$reportsByInput?,
);

class Options$Query$reportsByInput
    extends graphql.QueryOptions<Query$reportsByInput> {
  Options$Query$reportsByInput({
    String? operationName,
    required Variables$Query$reportsByInput variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$reportsByInput? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$reportsByInput? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$reportsByInput(data),
                  ),
          onError: onError,
          document: documentNodeQueryreportsByInput,
          parserFn: _parserFn$Query$reportsByInput,
        );

  final OnQueryComplete$Query$reportsByInput? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$reportsByInput
    extends graphql.WatchQueryOptions<Query$reportsByInput> {
  WatchOptions$Query$reportsByInput({
    String? operationName,
    required Variables$Query$reportsByInput variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$reportsByInput? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryreportsByInput,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$reportsByInput,
        );
}

class FetchMoreOptions$Query$reportsByInput extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$reportsByInput({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$reportsByInput variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryreportsByInput,
        );
}

extension ClientExtension$Query$reportsByInput on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$reportsByInput>> query$reportsByInput(
          Options$Query$reportsByInput options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$reportsByInput> watchQuery$reportsByInput(
          WatchOptions$Query$reportsByInput options) =>
      this.watchQuery(options);
  void writeQuery$reportsByInput({
    required Query$reportsByInput data,
    required Variables$Query$reportsByInput variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryreportsByInput),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$reportsByInput? readQuery$reportsByInput({
    required Variables$Query$reportsByInput variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryreportsByInput),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$reportsByInput.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$reportsByInput> useQuery$reportsByInput(
        Options$Query$reportsByInput options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$reportsByInput> useWatchQuery$reportsByInput(
        WatchOptions$Query$reportsByInput options) =>
    graphql_flutter.useWatchQuery(options);

class Query$reportsByInput$Widget
    extends graphql_flutter.Query<Query$reportsByInput> {
  Query$reportsByInput$Widget({
    widgets.Key? key,
    required Options$Query$reportsByInput options,
    required graphql_flutter.QueryBuilder<Query$reportsByInput> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$reportsByInput$input {
  Query$reportsByInput$input({
    required this.reports,
    this.$__typename = 'Input',
  });

  factory Query$reportsByInput$input.fromJson(Map<String, dynamic> json) {
    final l$reports = json['reports'];
    final l$$__typename = json['__typename'];
    return Query$reportsByInput$input(
      reports: Query$reportsByInput$input$reports.fromJson(
          (l$reports as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$reportsByInput$input$reports reports;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$reports = reports;
    _resultData['reports'] = l$reports.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$reports = reports;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$reports,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$reportsByInput$input) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$reports = reports;
    final lOther$reports = other.reports;
    if (l$reports != lOther$reports) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$reportsByInput$input
    on Query$reportsByInput$input {
  CopyWith$Query$reportsByInput$input<Query$reportsByInput$input>
      get copyWith => CopyWith$Query$reportsByInput$input(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$reportsByInput$input<TRes> {
  factory CopyWith$Query$reportsByInput$input(
    Query$reportsByInput$input instance,
    TRes Function(Query$reportsByInput$input) then,
  ) = _CopyWithImpl$Query$reportsByInput$input;

  factory CopyWith$Query$reportsByInput$input.stub(TRes res) =
      _CopyWithStubImpl$Query$reportsByInput$input;

  TRes call({
    Query$reportsByInput$input$reports? reports,
    String? $__typename,
  });
  CopyWith$Query$reportsByInput$input$reports<TRes> get reports;
}

class _CopyWithImpl$Query$reportsByInput$input<TRes>
    implements CopyWith$Query$reportsByInput$input<TRes> {
  _CopyWithImpl$Query$reportsByInput$input(
    this._instance,
    this._then,
  );

  final Query$reportsByInput$input _instance;

  final TRes Function(Query$reportsByInput$input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? reports = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$reportsByInput$input(
        reports: reports == _undefined || reports == null
            ? _instance.reports
            : (reports as Query$reportsByInput$input$reports),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$reportsByInput$input$reports<TRes> get reports {
    final local$reports = _instance.reports;
    return CopyWith$Query$reportsByInput$input$reports(
        local$reports, (e) => call(reports: e));
  }
}

class _CopyWithStubImpl$Query$reportsByInput$input<TRes>
    implements CopyWith$Query$reportsByInput$input<TRes> {
  _CopyWithStubImpl$Query$reportsByInput$input(this._res);

  TRes _res;

  call({
    Query$reportsByInput$input$reports? reports,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$reportsByInput$input$reports<TRes> get reports =>
      CopyWith$Query$reportsByInput$input$reports.stub(_res);
}

class Query$reportsByInput$input$reports {
  Query$reportsByInput$input$reports({
    required this.edges,
    this.$__typename = 'ReportConnection',
  });

  factory Query$reportsByInput$input$reports.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$reportsByInput$input$reports(
      edges: (l$edges as List<dynamic>)
          .map((e) => Query$reportsByInput$input$reports$edges.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$reportsByInput$input$reports$edges> edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$edges.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$reportsByInput$input$reports) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges.length != lOther$edges.length) {
      return false;
    }
    for (int i = 0; i < l$edges.length; i++) {
      final l$edges$entry = l$edges[i];
      final lOther$edges$entry = lOther$edges[i];
      if (l$edges$entry != lOther$edges$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$reportsByInput$input$reports
    on Query$reportsByInput$input$reports {
  CopyWith$Query$reportsByInput$input$reports<
          Query$reportsByInput$input$reports>
      get copyWith => CopyWith$Query$reportsByInput$input$reports(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$reportsByInput$input$reports<TRes> {
  factory CopyWith$Query$reportsByInput$input$reports(
    Query$reportsByInput$input$reports instance,
    TRes Function(Query$reportsByInput$input$reports) then,
  ) = _CopyWithImpl$Query$reportsByInput$input$reports;

  factory CopyWith$Query$reportsByInput$input$reports.stub(TRes res) =
      _CopyWithStubImpl$Query$reportsByInput$input$reports;

  TRes call({
    List<Query$reportsByInput$input$reports$edges>? edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$reportsByInput$input$reports$edges> Function(
              Iterable<
                  CopyWith$Query$reportsByInput$input$reports$edges<
                      Query$reportsByInput$input$reports$edges>>)
          _fn);
}

class _CopyWithImpl$Query$reportsByInput$input$reports<TRes>
    implements CopyWith$Query$reportsByInput$input$reports<TRes> {
  _CopyWithImpl$Query$reportsByInput$input$reports(
    this._instance,
    this._then,
  );

  final Query$reportsByInput$input$reports _instance;

  final TRes Function(Query$reportsByInput$input$reports) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$reportsByInput$input$reports(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<Query$reportsByInput$input$reports$edges>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$reportsByInput$input$reports$edges> Function(
                  Iterable<
                      CopyWith$Query$reportsByInput$input$reports$edges<
                          Query$reportsByInput$input$reports$edges>>)
              _fn) =>
      call(
          edges: _fn(_instance.edges
              .map((e) => CopyWith$Query$reportsByInput$input$reports$edges(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$reportsByInput$input$reports<TRes>
    implements CopyWith$Query$reportsByInput$input$reports<TRes> {
  _CopyWithStubImpl$Query$reportsByInput$input$reports(this._res);

  TRes _res;

  call({
    List<Query$reportsByInput$input$reports$edges>? edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Query$reportsByInput$input$reports$edges {
  Query$reportsByInput$input$reports$edges({
    required this.node,
    this.$__typename = 'ReportEdge',
  });

  factory Query$reportsByInput$input$reports$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$reportsByInput$input$reports$edges(
      node: Query$reportsByInput$input$reports$edges$node.fromJson(
          (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$reportsByInput$input$reports$edges$node node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$node,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$reportsByInput$input$reports$edges) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$reportsByInput$input$reports$edges
    on Query$reportsByInput$input$reports$edges {
  CopyWith$Query$reportsByInput$input$reports$edges<
          Query$reportsByInput$input$reports$edges>
      get copyWith => CopyWith$Query$reportsByInput$input$reports$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$reportsByInput$input$reports$edges<TRes> {
  factory CopyWith$Query$reportsByInput$input$reports$edges(
    Query$reportsByInput$input$reports$edges instance,
    TRes Function(Query$reportsByInput$input$reports$edges) then,
  ) = _CopyWithImpl$Query$reportsByInput$input$reports$edges;

  factory CopyWith$Query$reportsByInput$input$reports$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$reportsByInput$input$reports$edges;

  TRes call({
    Query$reportsByInput$input$reports$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$reportsByInput$input$reports$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$reportsByInput$input$reports$edges<TRes>
    implements CopyWith$Query$reportsByInput$input$reports$edges<TRes> {
  _CopyWithImpl$Query$reportsByInput$input$reports$edges(
    this._instance,
    this._then,
  );

  final Query$reportsByInput$input$reports$edges _instance;

  final TRes Function(Query$reportsByInput$input$reports$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$reportsByInput$input$reports$edges(
        node: node == _undefined || node == null
            ? _instance.node
            : (node as Query$reportsByInput$input$reports$edges$node),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$reportsByInput$input$reports$edges$node<TRes> get node {
    final local$node = _instance.node;
    return CopyWith$Query$reportsByInput$input$reports$edges$node(
        local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$reportsByInput$input$reports$edges<TRes>
    implements CopyWith$Query$reportsByInput$input$reports$edges<TRes> {
  _CopyWithStubImpl$Query$reportsByInput$input$reports$edges(this._res);

  TRes _res;

  call({
    Query$reportsByInput$input$reports$edges$node? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$reportsByInput$input$reports$edges$node<TRes> get node =>
      CopyWith$Query$reportsByInput$input$reports$edges$node.stub(_res);
}

class Query$reportsByInput$input$reports$edges$node {
  Query$reportsByInput$input$reports$edges$node({
    required this.index,
    required this.input,
    required this.payload,
    this.$__typename = 'Report',
  });

  factory Query$reportsByInput$input$reports$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$index = json['index'];
    final l$input = json['input'];
    final l$payload = json['payload'];
    final l$$__typename = json['__typename'];
    return Query$reportsByInput$input$reports$edges$node(
      index: (l$index as int),
      input: Query$reportsByInput$input$reports$edges$node$input.fromJson(
          (l$input as Map<String, dynamic>)),
      payload: (l$payload as String),
      $__typename: (l$$__typename as String),
    );
  }

  final int index;

  final Query$reportsByInput$input$reports$edges$node$input input;

  final String payload;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$index = index;
    _resultData['index'] = l$index;
    final l$input = input;
    _resultData['input'] = l$input.toJson();
    final l$payload = payload;
    _resultData['payload'] = l$payload;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$index = index;
    final l$input = input;
    final l$payload = payload;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$index,
      l$input,
      l$payload,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$reportsByInput$input$reports$edges$node) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$index = index;
    final lOther$index = other.index;
    if (l$index != lOther$index) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    final l$payload = payload;
    final lOther$payload = other.payload;
    if (l$payload != lOther$payload) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$reportsByInput$input$reports$edges$node
    on Query$reportsByInput$input$reports$edges$node {
  CopyWith$Query$reportsByInput$input$reports$edges$node<
          Query$reportsByInput$input$reports$edges$node>
      get copyWith => CopyWith$Query$reportsByInput$input$reports$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$reportsByInput$input$reports$edges$node<TRes> {
  factory CopyWith$Query$reportsByInput$input$reports$edges$node(
    Query$reportsByInput$input$reports$edges$node instance,
    TRes Function(Query$reportsByInput$input$reports$edges$node) then,
  ) = _CopyWithImpl$Query$reportsByInput$input$reports$edges$node;

  factory CopyWith$Query$reportsByInput$input$reports$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Query$reportsByInput$input$reports$edges$node;

  TRes call({
    int? index,
    Query$reportsByInput$input$reports$edges$node$input? input,
    String? payload,
    String? $__typename,
  });
  CopyWith$Query$reportsByInput$input$reports$edges$node$input<TRes> get input;
}

class _CopyWithImpl$Query$reportsByInput$input$reports$edges$node<TRes>
    implements CopyWith$Query$reportsByInput$input$reports$edges$node<TRes> {
  _CopyWithImpl$Query$reportsByInput$input$reports$edges$node(
    this._instance,
    this._then,
  );

  final Query$reportsByInput$input$reports$edges$node _instance;

  final TRes Function(Query$reportsByInput$input$reports$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? index = _undefined,
    Object? input = _undefined,
    Object? payload = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$reportsByInput$input$reports$edges$node(
        index: index == _undefined || index == null
            ? _instance.index
            : (index as int),
        input: input == _undefined || input == null
            ? _instance.input
            : (input as Query$reportsByInput$input$reports$edges$node$input),
        payload: payload == _undefined || payload == null
            ? _instance.payload
            : (payload as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$reportsByInput$input$reports$edges$node$input<TRes> get input {
    final local$input = _instance.input;
    return CopyWith$Query$reportsByInput$input$reports$edges$node$input(
        local$input, (e) => call(input: e));
  }
}

class _CopyWithStubImpl$Query$reportsByInput$input$reports$edges$node<TRes>
    implements CopyWith$Query$reportsByInput$input$reports$edges$node<TRes> {
  _CopyWithStubImpl$Query$reportsByInput$input$reports$edges$node(this._res);

  TRes _res;

  call({
    int? index,
    Query$reportsByInput$input$reports$edges$node$input? input,
    String? payload,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$reportsByInput$input$reports$edges$node$input<TRes>
      get input =>
          CopyWith$Query$reportsByInput$input$reports$edges$node$input.stub(
              _res);
}

class Query$reportsByInput$input$reports$edges$node$input {
  Query$reportsByInput$input$reports$edges$node$input({
    required this.index,
    this.$__typename = 'Input',
  });

  factory Query$reportsByInput$input$reports$edges$node$input.fromJson(
      Map<String, dynamic> json) {
    final l$index = json['index'];
    final l$$__typename = json['__typename'];
    return Query$reportsByInput$input$reports$edges$node$input(
      index: (l$index as int),
      $__typename: (l$$__typename as String),
    );
  }

  final int index;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$index = index;
    _resultData['index'] = l$index;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$index = index;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$index,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$reportsByInput$input$reports$edges$node$input) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$index = index;
    final lOther$index = other.index;
    if (l$index != lOther$index) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$reportsByInput$input$reports$edges$node$input
    on Query$reportsByInput$input$reports$edges$node$input {
  CopyWith$Query$reportsByInput$input$reports$edges$node$input<
          Query$reportsByInput$input$reports$edges$node$input>
      get copyWith =>
          CopyWith$Query$reportsByInput$input$reports$edges$node$input(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$reportsByInput$input$reports$edges$node$input<
    TRes> {
  factory CopyWith$Query$reportsByInput$input$reports$edges$node$input(
    Query$reportsByInput$input$reports$edges$node$input instance,
    TRes Function(Query$reportsByInput$input$reports$edges$node$input) then,
  ) = _CopyWithImpl$Query$reportsByInput$input$reports$edges$node$input;

  factory CopyWith$Query$reportsByInput$input$reports$edges$node$input.stub(
          TRes res) =
      _CopyWithStubImpl$Query$reportsByInput$input$reports$edges$node$input;

  TRes call({
    int? index,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$reportsByInput$input$reports$edges$node$input<TRes>
    implements
        CopyWith$Query$reportsByInput$input$reports$edges$node$input<TRes> {
  _CopyWithImpl$Query$reportsByInput$input$reports$edges$node$input(
    this._instance,
    this._then,
  );

  final Query$reportsByInput$input$reports$edges$node$input _instance;

  final TRes Function(Query$reportsByInput$input$reports$edges$node$input)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? index = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$reportsByInput$input$reports$edges$node$input(
        index: index == _undefined || index == null
            ? _instance.index
            : (index as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$reportsByInput$input$reports$edges$node$input<
        TRes>
    implements
        CopyWith$Query$reportsByInput$input$reports$edges$node$input<TRes> {
  _CopyWithStubImpl$Query$reportsByInput$input$reports$edges$node$input(
      this._res);

  TRes _res;

  call({
    int? index,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getInput {
  factory Variables$Query$getInput({required int inputIndex}) =>
      Variables$Query$getInput._({
        r'inputIndex': inputIndex,
      });

  Variables$Query$getInput._(this._$data);

  factory Variables$Query$getInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$inputIndex = data['inputIndex'];
    result$data['inputIndex'] = (l$inputIndex as int);
    return Variables$Query$getInput._(result$data);
  }

  Map<String, dynamic> _$data;

  int get inputIndex => (_$data['inputIndex'] as int);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$inputIndex = inputIndex;
    result$data['inputIndex'] = l$inputIndex;
    return result$data;
  }

  CopyWith$Variables$Query$getInput<Variables$Query$getInput> get copyWith =>
      CopyWith$Variables$Query$getInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$inputIndex = inputIndex;
    final lOther$inputIndex = other.inputIndex;
    if (l$inputIndex != lOther$inputIndex) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$inputIndex = inputIndex;
    return Object.hashAll([l$inputIndex]);
  }
}

abstract class CopyWith$Variables$Query$getInput<TRes> {
  factory CopyWith$Variables$Query$getInput(
    Variables$Query$getInput instance,
    TRes Function(Variables$Query$getInput) then,
  ) = _CopyWithImpl$Variables$Query$getInput;

  factory CopyWith$Variables$Query$getInput.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getInput;

  TRes call({int? inputIndex});
}

class _CopyWithImpl$Variables$Query$getInput<TRes>
    implements CopyWith$Variables$Query$getInput<TRes> {
  _CopyWithImpl$Variables$Query$getInput(
    this._instance,
    this._then,
  );

  final Variables$Query$getInput _instance;

  final TRes Function(Variables$Query$getInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? inputIndex = _undefined}) =>
      _then(Variables$Query$getInput._({
        ..._instance._$data,
        if (inputIndex != _undefined && inputIndex != null)
          'inputIndex': (inputIndex as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getInput<TRes>
    implements CopyWith$Variables$Query$getInput<TRes> {
  _CopyWithStubImpl$Variables$Query$getInput(this._res);

  TRes _res;

  call({int? inputIndex}) => _res;
}

class Query$getInput {
  Query$getInput({
    required this.input,
    this.$__typename = 'Query',
  });

  factory Query$getInput.fromJson(Map<String, dynamic> json) {
    final l$input = json['input'];
    final l$$__typename = json['__typename'];
    return Query$getInput(
      input: Query$getInput$input.fromJson((l$input as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getInput$input input;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$input = input;
    _resultData['input'] = l$input.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$input = input;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$input,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getInput) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getInput on Query$getInput {
  CopyWith$Query$getInput<Query$getInput> get copyWith =>
      CopyWith$Query$getInput(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getInput<TRes> {
  factory CopyWith$Query$getInput(
    Query$getInput instance,
    TRes Function(Query$getInput) then,
  ) = _CopyWithImpl$Query$getInput;

  factory CopyWith$Query$getInput.stub(TRes res) =
      _CopyWithStubImpl$Query$getInput;

  TRes call({
    Query$getInput$input? input,
    String? $__typename,
  });
  CopyWith$Query$getInput$input<TRes> get input;
}

class _CopyWithImpl$Query$getInput<TRes>
    implements CopyWith$Query$getInput<TRes> {
  _CopyWithImpl$Query$getInput(
    this._instance,
    this._then,
  );

  final Query$getInput _instance;

  final TRes Function(Query$getInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? input = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getInput(
        input: input == _undefined || input == null
            ? _instance.input
            : (input as Query$getInput$input),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$getInput$input<TRes> get input {
    final local$input = _instance.input;
    return CopyWith$Query$getInput$input(local$input, (e) => call(input: e));
  }
}

class _CopyWithStubImpl$Query$getInput<TRes>
    implements CopyWith$Query$getInput<TRes> {
  _CopyWithStubImpl$Query$getInput(this._res);

  TRes _res;

  call({
    Query$getInput$input? input,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$getInput$input<TRes> get input =>
      CopyWith$Query$getInput$input.stub(_res);
}

const documentNodeQuerygetInput = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getInput'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'inputIndex')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'input'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'index'),
            value: VariableNode(name: NameNode(value: 'inputIndex')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'reports'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'edges'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'node'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'index'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'input'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                            name: NameNode(value: 'index'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: '__typename'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                        ]),
                      ),
                      FieldNode(
                        name: NameNode(value: 'payload'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ]),
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'notices'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'edges'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'node'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'index'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'input'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                            name: NameNode(value: 'index'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: '__typename'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                        ]),
                      ),
                      FieldNode(
                        name: NameNode(value: 'payload'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ]),
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$getInput _parserFn$Query$getInput(Map<String, dynamic> data) =>
    Query$getInput.fromJson(data);
typedef OnQueryComplete$Query$getInput = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$getInput?,
);

class Options$Query$getInput extends graphql.QueryOptions<Query$getInput> {
  Options$Query$getInput({
    String? operationName,
    required Variables$Query$getInput variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$getInput? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$getInput? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$getInput(data),
                  ),
          onError: onError,
          document: documentNodeQuerygetInput,
          parserFn: _parserFn$Query$getInput,
        );

  final OnQueryComplete$Query$getInput? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$getInput
    extends graphql.WatchQueryOptions<Query$getInput> {
  WatchOptions$Query$getInput({
    String? operationName,
    required Variables$Query$getInput variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$getInput? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQuerygetInput,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getInput,
        );
}

class FetchMoreOptions$Query$getInput extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getInput({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getInput variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetInput,
        );
}

extension ClientExtension$Query$getInput on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getInput>> query$getInput(
          Options$Query$getInput options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$getInput> watchQuery$getInput(
          WatchOptions$Query$getInput options) =>
      this.watchQuery(options);
  void writeQuery$getInput({
    required Query$getInput data,
    required Variables$Query$getInput variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQuerygetInput),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getInput? readQuery$getInput({
    required Variables$Query$getInput variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerygetInput),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getInput.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$getInput> useQuery$getInput(
        Options$Query$getInput options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$getInput> useWatchQuery$getInput(
        WatchOptions$Query$getInput options) =>
    graphql_flutter.useWatchQuery(options);

class Query$getInput$Widget extends graphql_flutter.Query<Query$getInput> {
  Query$getInput$Widget({
    widgets.Key? key,
    required Options$Query$getInput options,
    required graphql_flutter.QueryBuilder<Query$getInput> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$getInput$input {
  Query$getInput$input({
    required this.reports,
    required this.notices,
    this.$__typename = 'Input',
  });

  factory Query$getInput$input.fromJson(Map<String, dynamic> json) {
    final l$reports = json['reports'];
    final l$notices = json['notices'];
    final l$$__typename = json['__typename'];
    return Query$getInput$input(
      reports: Query$getInput$input$reports.fromJson(
          (l$reports as Map<String, dynamic>)),
      notices: Query$getInput$input$notices.fromJson(
          (l$notices as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getInput$input$reports reports;

  final Query$getInput$input$notices notices;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$reports = reports;
    _resultData['reports'] = l$reports.toJson();
    final l$notices = notices;
    _resultData['notices'] = l$notices.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$reports = reports;
    final l$notices = notices;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$reports,
      l$notices,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getInput$input) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$reports = reports;
    final lOther$reports = other.reports;
    if (l$reports != lOther$reports) {
      return false;
    }
    final l$notices = notices;
    final lOther$notices = other.notices;
    if (l$notices != lOther$notices) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getInput$input on Query$getInput$input {
  CopyWith$Query$getInput$input<Query$getInput$input> get copyWith =>
      CopyWith$Query$getInput$input(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getInput$input<TRes> {
  factory CopyWith$Query$getInput$input(
    Query$getInput$input instance,
    TRes Function(Query$getInput$input) then,
  ) = _CopyWithImpl$Query$getInput$input;

  factory CopyWith$Query$getInput$input.stub(TRes res) =
      _CopyWithStubImpl$Query$getInput$input;

  TRes call({
    Query$getInput$input$reports? reports,
    Query$getInput$input$notices? notices,
    String? $__typename,
  });
  CopyWith$Query$getInput$input$reports<TRes> get reports;
  CopyWith$Query$getInput$input$notices<TRes> get notices;
}

class _CopyWithImpl$Query$getInput$input<TRes>
    implements CopyWith$Query$getInput$input<TRes> {
  _CopyWithImpl$Query$getInput$input(
    this._instance,
    this._then,
  );

  final Query$getInput$input _instance;

  final TRes Function(Query$getInput$input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? reports = _undefined,
    Object? notices = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getInput$input(
        reports: reports == _undefined || reports == null
            ? _instance.reports
            : (reports as Query$getInput$input$reports),
        notices: notices == _undefined || notices == null
            ? _instance.notices
            : (notices as Query$getInput$input$notices),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$getInput$input$reports<TRes> get reports {
    final local$reports = _instance.reports;
    return CopyWith$Query$getInput$input$reports(
        local$reports, (e) => call(reports: e));
  }

  CopyWith$Query$getInput$input$notices<TRes> get notices {
    final local$notices = _instance.notices;
    return CopyWith$Query$getInput$input$notices(
        local$notices, (e) => call(notices: e));
  }
}

class _CopyWithStubImpl$Query$getInput$input<TRes>
    implements CopyWith$Query$getInput$input<TRes> {
  _CopyWithStubImpl$Query$getInput$input(this._res);

  TRes _res;

  call({
    Query$getInput$input$reports? reports,
    Query$getInput$input$notices? notices,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$getInput$input$reports<TRes> get reports =>
      CopyWith$Query$getInput$input$reports.stub(_res);

  CopyWith$Query$getInput$input$notices<TRes> get notices =>
      CopyWith$Query$getInput$input$notices.stub(_res);
}

class Query$getInput$input$reports {
  Query$getInput$input$reports({
    required this.edges,
    this.$__typename = 'ReportConnection',
  });

  factory Query$getInput$input$reports.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$getInput$input$reports(
      edges: (l$edges as List<dynamic>)
          .map((e) => Query$getInput$input$reports$edges.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$getInput$input$reports$edges> edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$edges.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getInput$input$reports) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges.length != lOther$edges.length) {
      return false;
    }
    for (int i = 0; i < l$edges.length; i++) {
      final l$edges$entry = l$edges[i];
      final lOther$edges$entry = lOther$edges[i];
      if (l$edges$entry != lOther$edges$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getInput$input$reports
    on Query$getInput$input$reports {
  CopyWith$Query$getInput$input$reports<Query$getInput$input$reports>
      get copyWith => CopyWith$Query$getInput$input$reports(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getInput$input$reports<TRes> {
  factory CopyWith$Query$getInput$input$reports(
    Query$getInput$input$reports instance,
    TRes Function(Query$getInput$input$reports) then,
  ) = _CopyWithImpl$Query$getInput$input$reports;

  factory CopyWith$Query$getInput$input$reports.stub(TRes res) =
      _CopyWithStubImpl$Query$getInput$input$reports;

  TRes call({
    List<Query$getInput$input$reports$edges>? edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$getInput$input$reports$edges> Function(
              Iterable<
                  CopyWith$Query$getInput$input$reports$edges<
                      Query$getInput$input$reports$edges>>)
          _fn);
}

class _CopyWithImpl$Query$getInput$input$reports<TRes>
    implements CopyWith$Query$getInput$input$reports<TRes> {
  _CopyWithImpl$Query$getInput$input$reports(
    this._instance,
    this._then,
  );

  final Query$getInput$input$reports _instance;

  final TRes Function(Query$getInput$input$reports) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getInput$input$reports(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<Query$getInput$input$reports$edges>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$getInput$input$reports$edges> Function(
                  Iterable<
                      CopyWith$Query$getInput$input$reports$edges<
                          Query$getInput$input$reports$edges>>)
              _fn) =>
      call(
          edges: _fn(_instance.edges
              .map((e) => CopyWith$Query$getInput$input$reports$edges(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getInput$input$reports<TRes>
    implements CopyWith$Query$getInput$input$reports<TRes> {
  _CopyWithStubImpl$Query$getInput$input$reports(this._res);

  TRes _res;

  call({
    List<Query$getInput$input$reports$edges>? edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Query$getInput$input$reports$edges {
  Query$getInput$input$reports$edges({
    required this.node,
    this.$__typename = 'ReportEdge',
  });

  factory Query$getInput$input$reports$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$getInput$input$reports$edges(
      node: Query$getInput$input$reports$edges$node.fromJson(
          (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getInput$input$reports$edges$node node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$node,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getInput$input$reports$edges) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getInput$input$reports$edges
    on Query$getInput$input$reports$edges {
  CopyWith$Query$getInput$input$reports$edges<
          Query$getInput$input$reports$edges>
      get copyWith => CopyWith$Query$getInput$input$reports$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getInput$input$reports$edges<TRes> {
  factory CopyWith$Query$getInput$input$reports$edges(
    Query$getInput$input$reports$edges instance,
    TRes Function(Query$getInput$input$reports$edges) then,
  ) = _CopyWithImpl$Query$getInput$input$reports$edges;

  factory CopyWith$Query$getInput$input$reports$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$getInput$input$reports$edges;

  TRes call({
    Query$getInput$input$reports$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$getInput$input$reports$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$getInput$input$reports$edges<TRes>
    implements CopyWith$Query$getInput$input$reports$edges<TRes> {
  _CopyWithImpl$Query$getInput$input$reports$edges(
    this._instance,
    this._then,
  );

  final Query$getInput$input$reports$edges _instance;

  final TRes Function(Query$getInput$input$reports$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getInput$input$reports$edges(
        node: node == _undefined || node == null
            ? _instance.node
            : (node as Query$getInput$input$reports$edges$node),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$getInput$input$reports$edges$node<TRes> get node {
    final local$node = _instance.node;
    return CopyWith$Query$getInput$input$reports$edges$node(
        local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$getInput$input$reports$edges<TRes>
    implements CopyWith$Query$getInput$input$reports$edges<TRes> {
  _CopyWithStubImpl$Query$getInput$input$reports$edges(this._res);

  TRes _res;

  call({
    Query$getInput$input$reports$edges$node? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$getInput$input$reports$edges$node<TRes> get node =>
      CopyWith$Query$getInput$input$reports$edges$node.stub(_res);
}

class Query$getInput$input$reports$edges$node {
  Query$getInput$input$reports$edges$node({
    required this.index,
    required this.input,
    required this.payload,
    this.$__typename = 'Report',
  });

  factory Query$getInput$input$reports$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$index = json['index'];
    final l$input = json['input'];
    final l$payload = json['payload'];
    final l$$__typename = json['__typename'];
    return Query$getInput$input$reports$edges$node(
      index: (l$index as int),
      input: Query$getInput$input$reports$edges$node$input.fromJson(
          (l$input as Map<String, dynamic>)),
      payload: (l$payload as String),
      $__typename: (l$$__typename as String),
    );
  }

  final int index;

  final Query$getInput$input$reports$edges$node$input input;

  final String payload;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$index = index;
    _resultData['index'] = l$index;
    final l$input = input;
    _resultData['input'] = l$input.toJson();
    final l$payload = payload;
    _resultData['payload'] = l$payload;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$index = index;
    final l$input = input;
    final l$payload = payload;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$index,
      l$input,
      l$payload,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getInput$input$reports$edges$node) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$index = index;
    final lOther$index = other.index;
    if (l$index != lOther$index) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    final l$payload = payload;
    final lOther$payload = other.payload;
    if (l$payload != lOther$payload) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getInput$input$reports$edges$node
    on Query$getInput$input$reports$edges$node {
  CopyWith$Query$getInput$input$reports$edges$node<
          Query$getInput$input$reports$edges$node>
      get copyWith => CopyWith$Query$getInput$input$reports$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getInput$input$reports$edges$node<TRes> {
  factory CopyWith$Query$getInput$input$reports$edges$node(
    Query$getInput$input$reports$edges$node instance,
    TRes Function(Query$getInput$input$reports$edges$node) then,
  ) = _CopyWithImpl$Query$getInput$input$reports$edges$node;

  factory CopyWith$Query$getInput$input$reports$edges$node.stub(TRes res) =
      _CopyWithStubImpl$Query$getInput$input$reports$edges$node;

  TRes call({
    int? index,
    Query$getInput$input$reports$edges$node$input? input,
    String? payload,
    String? $__typename,
  });
  CopyWith$Query$getInput$input$reports$edges$node$input<TRes> get input;
}

class _CopyWithImpl$Query$getInput$input$reports$edges$node<TRes>
    implements CopyWith$Query$getInput$input$reports$edges$node<TRes> {
  _CopyWithImpl$Query$getInput$input$reports$edges$node(
    this._instance,
    this._then,
  );

  final Query$getInput$input$reports$edges$node _instance;

  final TRes Function(Query$getInput$input$reports$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? index = _undefined,
    Object? input = _undefined,
    Object? payload = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getInput$input$reports$edges$node(
        index: index == _undefined || index == null
            ? _instance.index
            : (index as int),
        input: input == _undefined || input == null
            ? _instance.input
            : (input as Query$getInput$input$reports$edges$node$input),
        payload: payload == _undefined || payload == null
            ? _instance.payload
            : (payload as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$getInput$input$reports$edges$node$input<TRes> get input {
    final local$input = _instance.input;
    return CopyWith$Query$getInput$input$reports$edges$node$input(
        local$input, (e) => call(input: e));
  }
}

class _CopyWithStubImpl$Query$getInput$input$reports$edges$node<TRes>
    implements CopyWith$Query$getInput$input$reports$edges$node<TRes> {
  _CopyWithStubImpl$Query$getInput$input$reports$edges$node(this._res);

  TRes _res;

  call({
    int? index,
    Query$getInput$input$reports$edges$node$input? input,
    String? payload,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$getInput$input$reports$edges$node$input<TRes> get input =>
      CopyWith$Query$getInput$input$reports$edges$node$input.stub(_res);
}

class Query$getInput$input$reports$edges$node$input {
  Query$getInput$input$reports$edges$node$input({
    required this.index,
    this.$__typename = 'Input',
  });

  factory Query$getInput$input$reports$edges$node$input.fromJson(
      Map<String, dynamic> json) {
    final l$index = json['index'];
    final l$$__typename = json['__typename'];
    return Query$getInput$input$reports$edges$node$input(
      index: (l$index as int),
      $__typename: (l$$__typename as String),
    );
  }

  final int index;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$index = index;
    _resultData['index'] = l$index;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$index = index;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$index,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getInput$input$reports$edges$node$input) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$index = index;
    final lOther$index = other.index;
    if (l$index != lOther$index) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getInput$input$reports$edges$node$input
    on Query$getInput$input$reports$edges$node$input {
  CopyWith$Query$getInput$input$reports$edges$node$input<
          Query$getInput$input$reports$edges$node$input>
      get copyWith => CopyWith$Query$getInput$input$reports$edges$node$input(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getInput$input$reports$edges$node$input<TRes> {
  factory CopyWith$Query$getInput$input$reports$edges$node$input(
    Query$getInput$input$reports$edges$node$input instance,
    TRes Function(Query$getInput$input$reports$edges$node$input) then,
  ) = _CopyWithImpl$Query$getInput$input$reports$edges$node$input;

  factory CopyWith$Query$getInput$input$reports$edges$node$input.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getInput$input$reports$edges$node$input;

  TRes call({
    int? index,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getInput$input$reports$edges$node$input<TRes>
    implements CopyWith$Query$getInput$input$reports$edges$node$input<TRes> {
  _CopyWithImpl$Query$getInput$input$reports$edges$node$input(
    this._instance,
    this._then,
  );

  final Query$getInput$input$reports$edges$node$input _instance;

  final TRes Function(Query$getInput$input$reports$edges$node$input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? index = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getInput$input$reports$edges$node$input(
        index: index == _undefined || index == null
            ? _instance.index
            : (index as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getInput$input$reports$edges$node$input<TRes>
    implements CopyWith$Query$getInput$input$reports$edges$node$input<TRes> {
  _CopyWithStubImpl$Query$getInput$input$reports$edges$node$input(this._res);

  TRes _res;

  call({
    int? index,
    String? $__typename,
  }) =>
      _res;
}

class Query$getInput$input$notices {
  Query$getInput$input$notices({
    required this.edges,
    this.$__typename = 'NoticeConnection',
  });

  factory Query$getInput$input$notices.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$getInput$input$notices(
      edges: (l$edges as List<dynamic>)
          .map((e) => Query$getInput$input$notices$edges.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$getInput$input$notices$edges> edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$edges.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getInput$input$notices) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges.length != lOther$edges.length) {
      return false;
    }
    for (int i = 0; i < l$edges.length; i++) {
      final l$edges$entry = l$edges[i];
      final lOther$edges$entry = lOther$edges[i];
      if (l$edges$entry != lOther$edges$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getInput$input$notices
    on Query$getInput$input$notices {
  CopyWith$Query$getInput$input$notices<Query$getInput$input$notices>
      get copyWith => CopyWith$Query$getInput$input$notices(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getInput$input$notices<TRes> {
  factory CopyWith$Query$getInput$input$notices(
    Query$getInput$input$notices instance,
    TRes Function(Query$getInput$input$notices) then,
  ) = _CopyWithImpl$Query$getInput$input$notices;

  factory CopyWith$Query$getInput$input$notices.stub(TRes res) =
      _CopyWithStubImpl$Query$getInput$input$notices;

  TRes call({
    List<Query$getInput$input$notices$edges>? edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$getInput$input$notices$edges> Function(
              Iterable<
                  CopyWith$Query$getInput$input$notices$edges<
                      Query$getInput$input$notices$edges>>)
          _fn);
}

class _CopyWithImpl$Query$getInput$input$notices<TRes>
    implements CopyWith$Query$getInput$input$notices<TRes> {
  _CopyWithImpl$Query$getInput$input$notices(
    this._instance,
    this._then,
  );

  final Query$getInput$input$notices _instance;

  final TRes Function(Query$getInput$input$notices) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getInput$input$notices(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<Query$getInput$input$notices$edges>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$getInput$input$notices$edges> Function(
                  Iterable<
                      CopyWith$Query$getInput$input$notices$edges<
                          Query$getInput$input$notices$edges>>)
              _fn) =>
      call(
          edges: _fn(_instance.edges
              .map((e) => CopyWith$Query$getInput$input$notices$edges(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getInput$input$notices<TRes>
    implements CopyWith$Query$getInput$input$notices<TRes> {
  _CopyWithStubImpl$Query$getInput$input$notices(this._res);

  TRes _res;

  call({
    List<Query$getInput$input$notices$edges>? edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Query$getInput$input$notices$edges {
  Query$getInput$input$notices$edges({
    required this.node,
    this.$__typename = 'NoticeEdge',
  });

  factory Query$getInput$input$notices$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$getInput$input$notices$edges(
      node: Query$getInput$input$notices$edges$node.fromJson(
          (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getInput$input$notices$edges$node node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$node,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getInput$input$notices$edges) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getInput$input$notices$edges
    on Query$getInput$input$notices$edges {
  CopyWith$Query$getInput$input$notices$edges<
          Query$getInput$input$notices$edges>
      get copyWith => CopyWith$Query$getInput$input$notices$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getInput$input$notices$edges<TRes> {
  factory CopyWith$Query$getInput$input$notices$edges(
    Query$getInput$input$notices$edges instance,
    TRes Function(Query$getInput$input$notices$edges) then,
  ) = _CopyWithImpl$Query$getInput$input$notices$edges;

  factory CopyWith$Query$getInput$input$notices$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$getInput$input$notices$edges;

  TRes call({
    Query$getInput$input$notices$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$getInput$input$notices$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$getInput$input$notices$edges<TRes>
    implements CopyWith$Query$getInput$input$notices$edges<TRes> {
  _CopyWithImpl$Query$getInput$input$notices$edges(
    this._instance,
    this._then,
  );

  final Query$getInput$input$notices$edges _instance;

  final TRes Function(Query$getInput$input$notices$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getInput$input$notices$edges(
        node: node == _undefined || node == null
            ? _instance.node
            : (node as Query$getInput$input$notices$edges$node),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$getInput$input$notices$edges$node<TRes> get node {
    final local$node = _instance.node;
    return CopyWith$Query$getInput$input$notices$edges$node(
        local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$getInput$input$notices$edges<TRes>
    implements CopyWith$Query$getInput$input$notices$edges<TRes> {
  _CopyWithStubImpl$Query$getInput$input$notices$edges(this._res);

  TRes _res;

  call({
    Query$getInput$input$notices$edges$node? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$getInput$input$notices$edges$node<TRes> get node =>
      CopyWith$Query$getInput$input$notices$edges$node.stub(_res);
}

class Query$getInput$input$notices$edges$node {
  Query$getInput$input$notices$edges$node({
    required this.index,
    required this.input,
    required this.payload,
    this.$__typename = 'Notice',
  });

  factory Query$getInput$input$notices$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$index = json['index'];
    final l$input = json['input'];
    final l$payload = json['payload'];
    final l$$__typename = json['__typename'];
    return Query$getInput$input$notices$edges$node(
      index: (l$index as int),
      input: Query$getInput$input$notices$edges$node$input.fromJson(
          (l$input as Map<String, dynamic>)),
      payload: (l$payload as String),
      $__typename: (l$$__typename as String),
    );
  }

  final int index;

  final Query$getInput$input$notices$edges$node$input input;

  final String payload;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$index = index;
    _resultData['index'] = l$index;
    final l$input = input;
    _resultData['input'] = l$input.toJson();
    final l$payload = payload;
    _resultData['payload'] = l$payload;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$index = index;
    final l$input = input;
    final l$payload = payload;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$index,
      l$input,
      l$payload,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getInput$input$notices$edges$node) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$index = index;
    final lOther$index = other.index;
    if (l$index != lOther$index) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    final l$payload = payload;
    final lOther$payload = other.payload;
    if (l$payload != lOther$payload) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getInput$input$notices$edges$node
    on Query$getInput$input$notices$edges$node {
  CopyWith$Query$getInput$input$notices$edges$node<
          Query$getInput$input$notices$edges$node>
      get copyWith => CopyWith$Query$getInput$input$notices$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getInput$input$notices$edges$node<TRes> {
  factory CopyWith$Query$getInput$input$notices$edges$node(
    Query$getInput$input$notices$edges$node instance,
    TRes Function(Query$getInput$input$notices$edges$node) then,
  ) = _CopyWithImpl$Query$getInput$input$notices$edges$node;

  factory CopyWith$Query$getInput$input$notices$edges$node.stub(TRes res) =
      _CopyWithStubImpl$Query$getInput$input$notices$edges$node;

  TRes call({
    int? index,
    Query$getInput$input$notices$edges$node$input? input,
    String? payload,
    String? $__typename,
  });
  CopyWith$Query$getInput$input$notices$edges$node$input<TRes> get input;
}

class _CopyWithImpl$Query$getInput$input$notices$edges$node<TRes>
    implements CopyWith$Query$getInput$input$notices$edges$node<TRes> {
  _CopyWithImpl$Query$getInput$input$notices$edges$node(
    this._instance,
    this._then,
  );

  final Query$getInput$input$notices$edges$node _instance;

  final TRes Function(Query$getInput$input$notices$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? index = _undefined,
    Object? input = _undefined,
    Object? payload = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getInput$input$notices$edges$node(
        index: index == _undefined || index == null
            ? _instance.index
            : (index as int),
        input: input == _undefined || input == null
            ? _instance.input
            : (input as Query$getInput$input$notices$edges$node$input),
        payload: payload == _undefined || payload == null
            ? _instance.payload
            : (payload as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$getInput$input$notices$edges$node$input<TRes> get input {
    final local$input = _instance.input;
    return CopyWith$Query$getInput$input$notices$edges$node$input(
        local$input, (e) => call(input: e));
  }
}

class _CopyWithStubImpl$Query$getInput$input$notices$edges$node<TRes>
    implements CopyWith$Query$getInput$input$notices$edges$node<TRes> {
  _CopyWithStubImpl$Query$getInput$input$notices$edges$node(this._res);

  TRes _res;

  call({
    int? index,
    Query$getInput$input$notices$edges$node$input? input,
    String? payload,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$getInput$input$notices$edges$node$input<TRes> get input =>
      CopyWith$Query$getInput$input$notices$edges$node$input.stub(_res);
}

class Query$getInput$input$notices$edges$node$input {
  Query$getInput$input$notices$edges$node$input({
    required this.index,
    this.$__typename = 'Input',
  });

  factory Query$getInput$input$notices$edges$node$input.fromJson(
      Map<String, dynamic> json) {
    final l$index = json['index'];
    final l$$__typename = json['__typename'];
    return Query$getInput$input$notices$edges$node$input(
      index: (l$index as int),
      $__typename: (l$$__typename as String),
    );
  }

  final int index;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$index = index;
    _resultData['index'] = l$index;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$index = index;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$index,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getInput$input$notices$edges$node$input) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$index = index;
    final lOther$index = other.index;
    if (l$index != lOther$index) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getInput$input$notices$edges$node$input
    on Query$getInput$input$notices$edges$node$input {
  CopyWith$Query$getInput$input$notices$edges$node$input<
          Query$getInput$input$notices$edges$node$input>
      get copyWith => CopyWith$Query$getInput$input$notices$edges$node$input(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getInput$input$notices$edges$node$input<TRes> {
  factory CopyWith$Query$getInput$input$notices$edges$node$input(
    Query$getInput$input$notices$edges$node$input instance,
    TRes Function(Query$getInput$input$notices$edges$node$input) then,
  ) = _CopyWithImpl$Query$getInput$input$notices$edges$node$input;

  factory CopyWith$Query$getInput$input$notices$edges$node$input.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getInput$input$notices$edges$node$input;

  TRes call({
    int? index,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getInput$input$notices$edges$node$input<TRes>
    implements CopyWith$Query$getInput$input$notices$edges$node$input<TRes> {
  _CopyWithImpl$Query$getInput$input$notices$edges$node$input(
    this._instance,
    this._then,
  );

  final Query$getInput$input$notices$edges$node$input _instance;

  final TRes Function(Query$getInput$input$notices$edges$node$input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? index = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getInput$input$notices$edges$node$input(
        index: index == _undefined || index == null
            ? _instance.index
            : (index as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getInput$input$notices$edges$node$input<TRes>
    implements CopyWith$Query$getInput$input$notices$edges$node$input<TRes> {
  _CopyWithStubImpl$Query$getInput$input$notices$edges$node$input(this._res);

  TRes _res;

  call({
    int? index,
    String? $__typename,
  }) =>
      _res;
}
