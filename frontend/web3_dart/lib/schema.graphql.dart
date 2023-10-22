class Input$InputFilter {
  factory Input$InputFilter({
    int? indexLowerThan,
    int? indexGreaterThan,
  }) =>
      Input$InputFilter._({
        if (indexLowerThan != null) r'indexLowerThan': indexLowerThan,
        if (indexGreaterThan != null) r'indexGreaterThan': indexGreaterThan,
      });

  Input$InputFilter._(this._$data);

  factory Input$InputFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('indexLowerThan')) {
      final l$indexLowerThan = data['indexLowerThan'];
      result$data['indexLowerThan'] = (l$indexLowerThan as int?);
    }
    if (data.containsKey('indexGreaterThan')) {
      final l$indexGreaterThan = data['indexGreaterThan'];
      result$data['indexGreaterThan'] = (l$indexGreaterThan as int?);
    }
    return Input$InputFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get indexLowerThan => (_$data['indexLowerThan'] as int?);

  int? get indexGreaterThan => (_$data['indexGreaterThan'] as int?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('indexLowerThan')) {
      final l$indexLowerThan = indexLowerThan;
      result$data['indexLowerThan'] = l$indexLowerThan;
    }
    if (_$data.containsKey('indexGreaterThan')) {
      final l$indexGreaterThan = indexGreaterThan;
      result$data['indexGreaterThan'] = l$indexGreaterThan;
    }
    return result$data;
  }

  CopyWith$Input$InputFilter<Input$InputFilter> get copyWith =>
      CopyWith$Input$InputFilter(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$InputFilter) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$indexLowerThan = indexLowerThan;
    final lOther$indexLowerThan = other.indexLowerThan;
    if (_$data.containsKey('indexLowerThan') !=
        other._$data.containsKey('indexLowerThan')) {
      return false;
    }
    if (l$indexLowerThan != lOther$indexLowerThan) {
      return false;
    }
    final l$indexGreaterThan = indexGreaterThan;
    final lOther$indexGreaterThan = other.indexGreaterThan;
    if (_$data.containsKey('indexGreaterThan') !=
        other._$data.containsKey('indexGreaterThan')) {
      return false;
    }
    if (l$indexGreaterThan != lOther$indexGreaterThan) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$indexLowerThan = indexLowerThan;
    final l$indexGreaterThan = indexGreaterThan;
    return Object.hashAll([
      _$data.containsKey('indexLowerThan') ? l$indexLowerThan : const {},
      _$data.containsKey('indexGreaterThan') ? l$indexGreaterThan : const {},
    ]);
  }
}

abstract class CopyWith$Input$InputFilter<TRes> {
  factory CopyWith$Input$InputFilter(
    Input$InputFilter instance,
    TRes Function(Input$InputFilter) then,
  ) = _CopyWithImpl$Input$InputFilter;

  factory CopyWith$Input$InputFilter.stub(TRes res) =
      _CopyWithStubImpl$Input$InputFilter;

  TRes call({
    int? indexLowerThan,
    int? indexGreaterThan,
  });
}

class _CopyWithImpl$Input$InputFilter<TRes>
    implements CopyWith$Input$InputFilter<TRes> {
  _CopyWithImpl$Input$InputFilter(
    this._instance,
    this._then,
  );

  final Input$InputFilter _instance;

  final TRes Function(Input$InputFilter) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? indexLowerThan = _undefined,
    Object? indexGreaterThan = _undefined,
  }) =>
      _then(Input$InputFilter._({
        ..._instance._$data,
        if (indexLowerThan != _undefined)
          'indexLowerThan': (indexLowerThan as int?),
        if (indexGreaterThan != _undefined)
          'indexGreaterThan': (indexGreaterThan as int?),
      }));
}

class _CopyWithStubImpl$Input$InputFilter<TRes>
    implements CopyWith$Input$InputFilter<TRes> {
  _CopyWithStubImpl$Input$InputFilter(this._res);

  TRes _res;

  call({
    int? indexLowerThan,
    int? indexGreaterThan,
  }) =>
      _res;
}

enum Enum$__TypeKind {
  SCALAR,
  OBJECT,
  INTERFACE,
  UNION,
  ENUM,
  INPUT_OBJECT,
  LIST,
  NON_NULL,
  $unknown
}

String toJson$Enum$__TypeKind(Enum$__TypeKind e) {
  switch (e) {
    case Enum$__TypeKind.SCALAR:
      return r'SCALAR';
    case Enum$__TypeKind.OBJECT:
      return r'OBJECT';
    case Enum$__TypeKind.INTERFACE:
      return r'INTERFACE';
    case Enum$__TypeKind.UNION:
      return r'UNION';
    case Enum$__TypeKind.ENUM:
      return r'ENUM';
    case Enum$__TypeKind.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__TypeKind.LIST:
      return r'LIST';
    case Enum$__TypeKind.NON_NULL:
      return r'NON_NULL';
    case Enum$__TypeKind.$unknown:
      return r'$unknown';
  }
}

Enum$__TypeKind fromJson$Enum$__TypeKind(String value) {
  switch (value) {
    case r'SCALAR':
      return Enum$__TypeKind.SCALAR;
    case r'OBJECT':
      return Enum$__TypeKind.OBJECT;
    case r'INTERFACE':
      return Enum$__TypeKind.INTERFACE;
    case r'UNION':
      return Enum$__TypeKind.UNION;
    case r'ENUM':
      return Enum$__TypeKind.ENUM;
    case r'INPUT_OBJECT':
      return Enum$__TypeKind.INPUT_OBJECT;
    case r'LIST':
      return Enum$__TypeKind.LIST;
    case r'NON_NULL':
      return Enum$__TypeKind.NON_NULL;
    default:
      return Enum$__TypeKind.$unknown;
  }
}

enum Enum$__DirectiveLocation {
  QUERY,
  MUTATION,
  SUBSCRIPTION,
  FIELD,
  FRAGMENT_DEFINITION,
  FRAGMENT_SPREAD,
  INLINE_FRAGMENT,
  VARIABLE_DEFINITION,
  SCHEMA,
  SCALAR,
  OBJECT,
  FIELD_DEFINITION,
  ARGUMENT_DEFINITION,
  INTERFACE,
  UNION,
  ENUM,
  ENUM_VALUE,
  INPUT_OBJECT,
  INPUT_FIELD_DEFINITION,
  $unknown
}

String toJson$Enum$__DirectiveLocation(Enum$__DirectiveLocation e) {
  switch (e) {
    case Enum$__DirectiveLocation.QUERY:
      return r'QUERY';
    case Enum$__DirectiveLocation.MUTATION:
      return r'MUTATION';
    case Enum$__DirectiveLocation.SUBSCRIPTION:
      return r'SUBSCRIPTION';
    case Enum$__DirectiveLocation.FIELD:
      return r'FIELD';
    case Enum$__DirectiveLocation.FRAGMENT_DEFINITION:
      return r'FRAGMENT_DEFINITION';
    case Enum$__DirectiveLocation.FRAGMENT_SPREAD:
      return r'FRAGMENT_SPREAD';
    case Enum$__DirectiveLocation.INLINE_FRAGMENT:
      return r'INLINE_FRAGMENT';
    case Enum$__DirectiveLocation.VARIABLE_DEFINITION:
      return r'VARIABLE_DEFINITION';
    case Enum$__DirectiveLocation.SCHEMA:
      return r'SCHEMA';
    case Enum$__DirectiveLocation.SCALAR:
      return r'SCALAR';
    case Enum$__DirectiveLocation.OBJECT:
      return r'OBJECT';
    case Enum$__DirectiveLocation.FIELD_DEFINITION:
      return r'FIELD_DEFINITION';
    case Enum$__DirectiveLocation.ARGUMENT_DEFINITION:
      return r'ARGUMENT_DEFINITION';
    case Enum$__DirectiveLocation.INTERFACE:
      return r'INTERFACE';
    case Enum$__DirectiveLocation.UNION:
      return r'UNION';
    case Enum$__DirectiveLocation.ENUM:
      return r'ENUM';
    case Enum$__DirectiveLocation.ENUM_VALUE:
      return r'ENUM_VALUE';
    case Enum$__DirectiveLocation.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION:
      return r'INPUT_FIELD_DEFINITION';
    case Enum$__DirectiveLocation.$unknown:
      return r'$unknown';
  }
}

Enum$__DirectiveLocation fromJson$Enum$__DirectiveLocation(String value) {
  switch (value) {
    case r'QUERY':
      return Enum$__DirectiveLocation.QUERY;
    case r'MUTATION':
      return Enum$__DirectiveLocation.MUTATION;
    case r'SUBSCRIPTION':
      return Enum$__DirectiveLocation.SUBSCRIPTION;
    case r'FIELD':
      return Enum$__DirectiveLocation.FIELD;
    case r'FRAGMENT_DEFINITION':
      return Enum$__DirectiveLocation.FRAGMENT_DEFINITION;
    case r'FRAGMENT_SPREAD':
      return Enum$__DirectiveLocation.FRAGMENT_SPREAD;
    case r'INLINE_FRAGMENT':
      return Enum$__DirectiveLocation.INLINE_FRAGMENT;
    case r'VARIABLE_DEFINITION':
      return Enum$__DirectiveLocation.VARIABLE_DEFINITION;
    case r'SCHEMA':
      return Enum$__DirectiveLocation.SCHEMA;
    case r'SCALAR':
      return Enum$__DirectiveLocation.SCALAR;
    case r'OBJECT':
      return Enum$__DirectiveLocation.OBJECT;
    case r'FIELD_DEFINITION':
      return Enum$__DirectiveLocation.FIELD_DEFINITION;
    case r'ARGUMENT_DEFINITION':
      return Enum$__DirectiveLocation.ARGUMENT_DEFINITION;
    case r'INTERFACE':
      return Enum$__DirectiveLocation.INTERFACE;
    case r'UNION':
      return Enum$__DirectiveLocation.UNION;
    case r'ENUM':
      return Enum$__DirectiveLocation.ENUM;
    case r'ENUM_VALUE':
      return Enum$__DirectiveLocation.ENUM_VALUE;
    case r'INPUT_OBJECT':
      return Enum$__DirectiveLocation.INPUT_OBJECT;
    case r'INPUT_FIELD_DEFINITION':
      return Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION;
    default:
      return Enum$__DirectiveLocation.$unknown;
  }
}

const possibleTypesMap = <String, Set<String>>{};
