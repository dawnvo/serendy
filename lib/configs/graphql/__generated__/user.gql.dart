import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Fragment$UserFields {
  Fragment$UserFields({
    required this.id,
    required this.name,
    required this.email,
    this.image,
    this.$__typename = 'User',
  });

  factory Fragment$UserFields.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$email = json['email'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Fragment$UserFields(
      id: (l$id as String),
      name: (l$name as String),
      email: (l$email as String),
      image: (l$image as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String email;

  final String? image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$email = email;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$email,
      l$image,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$UserFields) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
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

extension UtilityExtension$Fragment$UserFields on Fragment$UserFields {
  CopyWith$Fragment$UserFields<Fragment$UserFields> get copyWith =>
      CopyWith$Fragment$UserFields(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$UserFields<TRes> {
  factory CopyWith$Fragment$UserFields(
    Fragment$UserFields instance,
    TRes Function(Fragment$UserFields) then,
  ) = _CopyWithImpl$Fragment$UserFields;

  factory CopyWith$Fragment$UserFields.stub(TRes res) =
      _CopyWithStubImpl$Fragment$UserFields;

  TRes call({
    String? id,
    String? name,
    String? email,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$UserFields<TRes>
    implements CopyWith$Fragment$UserFields<TRes> {
  _CopyWithImpl$Fragment$UserFields(
    this._instance,
    this._then,
  );

  final Fragment$UserFields _instance;

  final TRes Function(Fragment$UserFields) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? email = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$UserFields(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        email: email == _undefined || email == null
            ? _instance.email
            : (email as String),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$UserFields<TRes>
    implements CopyWith$Fragment$UserFields<TRes> {
  _CopyWithStubImpl$Fragment$UserFields(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? email,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionUserFields = FragmentDefinitionNode(
  name: NameNode(value: 'UserFields'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'User'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'id'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'name'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'email'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'image'),
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
);
const documentNodeFragmentUserFields = DocumentNode(definitions: [
  fragmentDefinitionUserFields,
]);

extension ClientExtension$Fragment$UserFields on graphql.GraphQLClient {
  void writeFragment$UserFields({
    required Fragment$UserFields data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'UserFields',
            document: documentNodeFragmentUserFields,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$UserFields? readFragment$UserFields({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'UserFields',
          document: documentNodeFragmentUserFields,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$UserFields.fromJson(result);
  }
}

class Query$GetMe {
  Query$GetMe({
    required this.GetMe,
    this.$__typename = 'Query',
  });

  factory Query$GetMe.fromJson(Map<String, dynamic> json) {
    final l$GetMe = json['GetMe'];
    final l$$__typename = json['__typename'];
    return Query$GetMe(
      GetMe: Fragment$UserFields.fromJson((l$GetMe as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$UserFields GetMe;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$GetMe = GetMe;
    _resultData['GetMe'] = l$GetMe.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$GetMe = GetMe;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$GetMe,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetMe) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$GetMe = GetMe;
    final lOther$GetMe = other.GetMe;
    if (l$GetMe != lOther$GetMe) {
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

extension UtilityExtension$Query$GetMe on Query$GetMe {
  CopyWith$Query$GetMe<Query$GetMe> get copyWith => CopyWith$Query$GetMe(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetMe<TRes> {
  factory CopyWith$Query$GetMe(
    Query$GetMe instance,
    TRes Function(Query$GetMe) then,
  ) = _CopyWithImpl$Query$GetMe;

  factory CopyWith$Query$GetMe.stub(TRes res) = _CopyWithStubImpl$Query$GetMe;

  TRes call({
    Fragment$UserFields? GetMe,
    String? $__typename,
  });
  CopyWith$Fragment$UserFields<TRes> get GetMe;
}

class _CopyWithImpl$Query$GetMe<TRes> implements CopyWith$Query$GetMe<TRes> {
  _CopyWithImpl$Query$GetMe(
    this._instance,
    this._then,
  );

  final Query$GetMe _instance;

  final TRes Function(Query$GetMe) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? GetMe = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMe(
        GetMe: GetMe == _undefined || GetMe == null
            ? _instance.GetMe
            : (GetMe as Fragment$UserFields),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$UserFields<TRes> get GetMe {
    final local$GetMe = _instance.GetMe;
    return CopyWith$Fragment$UserFields(local$GetMe, (e) => call(GetMe: e));
  }
}

class _CopyWithStubImpl$Query$GetMe<TRes>
    implements CopyWith$Query$GetMe<TRes> {
  _CopyWithStubImpl$Query$GetMe(this._res);

  TRes _res;

  call({
    Fragment$UserFields? GetMe,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$UserFields<TRes> get GetMe =>
      CopyWith$Fragment$UserFields.stub(_res);
}

const documentNodeQueryGetMe = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetMe'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'GetMe'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'UserFields'),
            directives: [],
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
  fragmentDefinitionUserFields,
]);
Query$GetMe _parserFn$Query$GetMe(Map<String, dynamic> data) =>
    Query$GetMe.fromJson(data);
typedef OnQueryComplete$Query$GetMe = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetMe?,
);

class Options$Query$GetMe extends graphql.QueryOptions<Query$GetMe> {
  Options$Query$GetMe({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMe? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetMe? onComplete,
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
                    data == null ? null : _parserFn$Query$GetMe(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetMe,
          parserFn: _parserFn$Query$GetMe,
        );

  final OnQueryComplete$Query$GetMe? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetMe extends graphql.WatchQueryOptions<Query$GetMe> {
  WatchOptions$Query$GetMe({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMe? typedOptimisticResult,
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
          document: documentNodeQueryGetMe,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetMe,
        );
}

class FetchMoreOptions$Query$GetMe extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetMe({required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryGetMe,
        );
}

extension ClientExtension$Query$GetMe on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetMe>> query$GetMe(
          [Options$Query$GetMe? options]) async =>
      await this.query(options ?? Options$Query$GetMe());
  graphql.ObservableQuery<Query$GetMe> watchQuery$GetMe(
          [WatchOptions$Query$GetMe? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$GetMe());
  void writeQuery$GetMe({
    required Query$GetMe data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(document: documentNodeQueryGetMe)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetMe? readQuery$GetMe({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryGetMe)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetMe.fromJson(result);
  }
}

class Variables$Mutation$SignUp {
  factory Variables$Mutation$SignUp({
    required String name,
    required String email,
    String? image,
  }) =>
      Variables$Mutation$SignUp._({
        r'name': name,
        r'email': email,
        if (image != null) r'image': image,
      });

  Variables$Mutation$SignUp._(this._$data);

  factory Variables$Mutation$SignUp.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    if (data.containsKey('image')) {
      final l$image = data['image'];
      result$data['image'] = (l$image as String?);
    }
    return Variables$Mutation$SignUp._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);
  String get email => (_$data['email'] as String);
  String? get image => (_$data['image'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    final l$email = email;
    result$data['email'] = l$email;
    if (_$data.containsKey('image')) {
      final l$image = image;
      result$data['image'] = l$image;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$SignUp<Variables$Mutation$SignUp> get copyWith =>
      CopyWith$Variables$Mutation$SignUp(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$SignUp) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (_$data.containsKey('image') != other._$data.containsKey('image')) {
      return false;
    }
    if (l$image != lOther$image) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$email = email;
    final l$image = image;
    return Object.hashAll([
      l$name,
      l$email,
      _$data.containsKey('image') ? l$image : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$SignUp<TRes> {
  factory CopyWith$Variables$Mutation$SignUp(
    Variables$Mutation$SignUp instance,
    TRes Function(Variables$Mutation$SignUp) then,
  ) = _CopyWithImpl$Variables$Mutation$SignUp;

  factory CopyWith$Variables$Mutation$SignUp.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$SignUp;

  TRes call({
    String? name,
    String? email,
    String? image,
  });
}

class _CopyWithImpl$Variables$Mutation$SignUp<TRes>
    implements CopyWith$Variables$Mutation$SignUp<TRes> {
  _CopyWithImpl$Variables$Mutation$SignUp(
    this._instance,
    this._then,
  );

  final Variables$Mutation$SignUp _instance;

  final TRes Function(Variables$Mutation$SignUp) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? email = _undefined,
    Object? image = _undefined,
  }) =>
      _then(Variables$Mutation$SignUp._({
        ..._instance._$data,
        if (name != _undefined && name != null) 'name': (name as String),
        if (email != _undefined && email != null) 'email': (email as String),
        if (image != _undefined) 'image': (image as String?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$SignUp<TRes>
    implements CopyWith$Variables$Mutation$SignUp<TRes> {
  _CopyWithStubImpl$Variables$Mutation$SignUp(this._res);

  TRes _res;

  call({
    String? name,
    String? email,
    String? image,
  }) =>
      _res;
}

class Mutation$SignUp {
  Mutation$SignUp({
    required this.SignUp,
    this.$__typename = 'Mutation',
  });

  factory Mutation$SignUp.fromJson(Map<String, dynamic> json) {
    final l$SignUp = json['SignUp'];
    final l$$__typename = json['__typename'];
    return Mutation$SignUp(
      SignUp:
          Mutation$SignUp$SignUp.fromJson((l$SignUp as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$SignUp$SignUp SignUp;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$SignUp = SignUp;
    _resultData['SignUp'] = l$SignUp.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$SignUp = SignUp;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$SignUp,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$SignUp) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$SignUp = SignUp;
    final lOther$SignUp = other.SignUp;
    if (l$SignUp != lOther$SignUp) {
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

extension UtilityExtension$Mutation$SignUp on Mutation$SignUp {
  CopyWith$Mutation$SignUp<Mutation$SignUp> get copyWith =>
      CopyWith$Mutation$SignUp(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$SignUp<TRes> {
  factory CopyWith$Mutation$SignUp(
    Mutation$SignUp instance,
    TRes Function(Mutation$SignUp) then,
  ) = _CopyWithImpl$Mutation$SignUp;

  factory CopyWith$Mutation$SignUp.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SignUp;

  TRes call({
    Mutation$SignUp$SignUp? SignUp,
    String? $__typename,
  });
  CopyWith$Mutation$SignUp$SignUp<TRes> get SignUp;
}

class _CopyWithImpl$Mutation$SignUp<TRes>
    implements CopyWith$Mutation$SignUp<TRes> {
  _CopyWithImpl$Mutation$SignUp(
    this._instance,
    this._then,
  );

  final Mutation$SignUp _instance;

  final TRes Function(Mutation$SignUp) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? SignUp = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SignUp(
        SignUp: SignUp == _undefined || SignUp == null
            ? _instance.SignUp
            : (SignUp as Mutation$SignUp$SignUp),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$SignUp$SignUp<TRes> get SignUp {
    final local$SignUp = _instance.SignUp;
    return CopyWith$Mutation$SignUp$SignUp(
        local$SignUp, (e) => call(SignUp: e));
  }
}

class _CopyWithStubImpl$Mutation$SignUp<TRes>
    implements CopyWith$Mutation$SignUp<TRes> {
  _CopyWithStubImpl$Mutation$SignUp(this._res);

  TRes _res;

  call({
    Mutation$SignUp$SignUp? SignUp,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$SignUp$SignUp<TRes> get SignUp =>
      CopyWith$Mutation$SignUp$SignUp.stub(_res);
}

const documentNodeMutationSignUp = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SignUp'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'name')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'email')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'image')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'SignUp'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'name'),
            value: VariableNode(name: NameNode(value: 'name')),
          ),
          ArgumentNode(
            name: NameNode(value: 'email'),
            value: VariableNode(name: NameNode(value: 'email')),
          ),
          ArgumentNode(
            name: NameNode(value: 'image'),
            value: VariableNode(name: NameNode(value: 'image')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
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
Mutation$SignUp _parserFn$Mutation$SignUp(Map<String, dynamic> data) =>
    Mutation$SignUp.fromJson(data);
typedef OnMutationCompleted$Mutation$SignUp = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$SignUp?,
);

class Options$Mutation$SignUp extends graphql.MutationOptions<Mutation$SignUp> {
  Options$Mutation$SignUp({
    String? operationName,
    required Variables$Mutation$SignUp variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SignUp? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SignUp? onCompleted,
    graphql.OnMutationUpdate<Mutation$SignUp>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$SignUp(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSignUp,
          parserFn: _parserFn$Mutation$SignUp,
        );

  final OnMutationCompleted$Mutation$SignUp? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$SignUp
    extends graphql.WatchQueryOptions<Mutation$SignUp> {
  WatchOptions$Mutation$SignUp({
    String? operationName,
    required Variables$Mutation$SignUp variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SignUp? typedOptimisticResult,
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
          document: documentNodeMutationSignUp,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$SignUp,
        );
}

extension ClientExtension$Mutation$SignUp on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$SignUp>> mutate$SignUp(
          Options$Mutation$SignUp options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$SignUp> watchMutation$SignUp(
          WatchOptions$Mutation$SignUp options) =>
      this.watchMutation(options);
}

class Mutation$SignUp$SignUp {
  Mutation$SignUp$SignUp({
    required this.id,
    this.$__typename = 'User',
  });

  factory Mutation$SignUp$SignUp.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$SignUp$SignUp(
      id: (l$id as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$SignUp$SignUp) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Mutation$SignUp$SignUp on Mutation$SignUp$SignUp {
  CopyWith$Mutation$SignUp$SignUp<Mutation$SignUp$SignUp> get copyWith =>
      CopyWith$Mutation$SignUp$SignUp(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$SignUp$SignUp<TRes> {
  factory CopyWith$Mutation$SignUp$SignUp(
    Mutation$SignUp$SignUp instance,
    TRes Function(Mutation$SignUp$SignUp) then,
  ) = _CopyWithImpl$Mutation$SignUp$SignUp;

  factory CopyWith$Mutation$SignUp$SignUp.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SignUp$SignUp;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$SignUp$SignUp<TRes>
    implements CopyWith$Mutation$SignUp$SignUp<TRes> {
  _CopyWithImpl$Mutation$SignUp$SignUp(
    this._instance,
    this._then,
  );

  final Mutation$SignUp$SignUp _instance;

  final TRes Function(Mutation$SignUp$SignUp) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SignUp$SignUp(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$SignUp$SignUp<TRes>
    implements CopyWith$Mutation$SignUp$SignUp<TRes> {
  _CopyWithStubImpl$Mutation$SignUp$SignUp(this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$EditUser {
  factory Variables$Mutation$EditUser({
    String? name,
    String? email,
    String? image,
  }) =>
      Variables$Mutation$EditUser._({
        if (name != null) r'name': name,
        if (email != null) r'email': email,
        if (image != null) r'image': image,
      });

  Variables$Mutation$EditUser._(this._$data);

  factory Variables$Mutation$EditUser.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('email')) {
      final l$email = data['email'];
      result$data['email'] = (l$email as String?);
    }
    if (data.containsKey('image')) {
      final l$image = data['image'];
      result$data['image'] = (l$image as String?);
    }
    return Variables$Mutation$EditUser._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get name => (_$data['name'] as String?);
  String? get email => (_$data['email'] as String?);
  String? get image => (_$data['image'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('email')) {
      final l$email = email;
      result$data['email'] = l$email;
    }
    if (_$data.containsKey('image')) {
      final l$image = image;
      result$data['image'] = l$image;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$EditUser<Variables$Mutation$EditUser>
      get copyWith => CopyWith$Variables$Mutation$EditUser(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$EditUser) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (_$data.containsKey('email') != other._$data.containsKey('email')) {
      return false;
    }
    if (l$email != lOther$email) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (_$data.containsKey('image') != other._$data.containsKey('image')) {
      return false;
    }
    if (l$image != lOther$image) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$email = email;
    final l$image = image;
    return Object.hashAll([
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('email') ? l$email : const {},
      _$data.containsKey('image') ? l$image : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$EditUser<TRes> {
  factory CopyWith$Variables$Mutation$EditUser(
    Variables$Mutation$EditUser instance,
    TRes Function(Variables$Mutation$EditUser) then,
  ) = _CopyWithImpl$Variables$Mutation$EditUser;

  factory CopyWith$Variables$Mutation$EditUser.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$EditUser;

  TRes call({
    String? name,
    String? email,
    String? image,
  });
}

class _CopyWithImpl$Variables$Mutation$EditUser<TRes>
    implements CopyWith$Variables$Mutation$EditUser<TRes> {
  _CopyWithImpl$Variables$Mutation$EditUser(
    this._instance,
    this._then,
  );

  final Variables$Mutation$EditUser _instance;

  final TRes Function(Variables$Mutation$EditUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? email = _undefined,
    Object? image = _undefined,
  }) =>
      _then(Variables$Mutation$EditUser._({
        ..._instance._$data,
        if (name != _undefined) 'name': (name as String?),
        if (email != _undefined) 'email': (email as String?),
        if (image != _undefined) 'image': (image as String?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$EditUser<TRes>
    implements CopyWith$Variables$Mutation$EditUser<TRes> {
  _CopyWithStubImpl$Variables$Mutation$EditUser(this._res);

  TRes _res;

  call({
    String? name,
    String? email,
    String? image,
  }) =>
      _res;
}

class Mutation$EditUser {
  Mutation$EditUser({
    required this.EditUser,
    this.$__typename = 'Mutation',
  });

  factory Mutation$EditUser.fromJson(Map<String, dynamic> json) {
    final l$EditUser = json['EditUser'];
    final l$$__typename = json['__typename'];
    return Mutation$EditUser(
      EditUser: Mutation$EditUser$EditUser.fromJson(
          (l$EditUser as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$EditUser$EditUser EditUser;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$EditUser = EditUser;
    _resultData['EditUser'] = l$EditUser.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$EditUser = EditUser;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$EditUser,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$EditUser) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$EditUser = EditUser;
    final lOther$EditUser = other.EditUser;
    if (l$EditUser != lOther$EditUser) {
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

extension UtilityExtension$Mutation$EditUser on Mutation$EditUser {
  CopyWith$Mutation$EditUser<Mutation$EditUser> get copyWith =>
      CopyWith$Mutation$EditUser(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$EditUser<TRes> {
  factory CopyWith$Mutation$EditUser(
    Mutation$EditUser instance,
    TRes Function(Mutation$EditUser) then,
  ) = _CopyWithImpl$Mutation$EditUser;

  factory CopyWith$Mutation$EditUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$EditUser;

  TRes call({
    Mutation$EditUser$EditUser? EditUser,
    String? $__typename,
  });
  CopyWith$Mutation$EditUser$EditUser<TRes> get EditUser;
}

class _CopyWithImpl$Mutation$EditUser<TRes>
    implements CopyWith$Mutation$EditUser<TRes> {
  _CopyWithImpl$Mutation$EditUser(
    this._instance,
    this._then,
  );

  final Mutation$EditUser _instance;

  final TRes Function(Mutation$EditUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? EditUser = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$EditUser(
        EditUser: EditUser == _undefined || EditUser == null
            ? _instance.EditUser
            : (EditUser as Mutation$EditUser$EditUser),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$EditUser$EditUser<TRes> get EditUser {
    final local$EditUser = _instance.EditUser;
    return CopyWith$Mutation$EditUser$EditUser(
        local$EditUser, (e) => call(EditUser: e));
  }
}

class _CopyWithStubImpl$Mutation$EditUser<TRes>
    implements CopyWith$Mutation$EditUser<TRes> {
  _CopyWithStubImpl$Mutation$EditUser(this._res);

  TRes _res;

  call({
    Mutation$EditUser$EditUser? EditUser,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$EditUser$EditUser<TRes> get EditUser =>
      CopyWith$Mutation$EditUser$EditUser.stub(_res);
}

const documentNodeMutationEditUser = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'EditUser'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'name')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'email')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'image')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'EditUser'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'name'),
            value: VariableNode(name: NameNode(value: 'name')),
          ),
          ArgumentNode(
            name: NameNode(value: 'email'),
            value: VariableNode(name: NameNode(value: 'email')),
          ),
          ArgumentNode(
            name: NameNode(value: 'image'),
            value: VariableNode(name: NameNode(value: 'image')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
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
Mutation$EditUser _parserFn$Mutation$EditUser(Map<String, dynamic> data) =>
    Mutation$EditUser.fromJson(data);
typedef OnMutationCompleted$Mutation$EditUser = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$EditUser?,
);

class Options$Mutation$EditUser
    extends graphql.MutationOptions<Mutation$EditUser> {
  Options$Mutation$EditUser({
    String? operationName,
    Variables$Mutation$EditUser? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$EditUser? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$EditUser? onCompleted,
    graphql.OnMutationUpdate<Mutation$EditUser>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$EditUser(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationEditUser,
          parserFn: _parserFn$Mutation$EditUser,
        );

  final OnMutationCompleted$Mutation$EditUser? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$EditUser
    extends graphql.WatchQueryOptions<Mutation$EditUser> {
  WatchOptions$Mutation$EditUser({
    String? operationName,
    Variables$Mutation$EditUser? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$EditUser? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeMutationEditUser,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$EditUser,
        );
}

extension ClientExtension$Mutation$EditUser on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$EditUser>> mutate$EditUser(
          [Options$Mutation$EditUser? options]) async =>
      await this.mutate(options ?? Options$Mutation$EditUser());
  graphql.ObservableQuery<Mutation$EditUser> watchMutation$EditUser(
          [WatchOptions$Mutation$EditUser? options]) =>
      this.watchMutation(options ?? WatchOptions$Mutation$EditUser());
}

class Mutation$EditUser$EditUser {
  Mutation$EditUser$EditUser({
    required this.id,
    this.$__typename = 'User',
  });

  factory Mutation$EditUser$EditUser.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$EditUser$EditUser(
      id: (l$id as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$EditUser$EditUser) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Mutation$EditUser$EditUser
    on Mutation$EditUser$EditUser {
  CopyWith$Mutation$EditUser$EditUser<Mutation$EditUser$EditUser>
      get copyWith => CopyWith$Mutation$EditUser$EditUser(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$EditUser$EditUser<TRes> {
  factory CopyWith$Mutation$EditUser$EditUser(
    Mutation$EditUser$EditUser instance,
    TRes Function(Mutation$EditUser$EditUser) then,
  ) = _CopyWithImpl$Mutation$EditUser$EditUser;

  factory CopyWith$Mutation$EditUser$EditUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$EditUser$EditUser;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$EditUser$EditUser<TRes>
    implements CopyWith$Mutation$EditUser$EditUser<TRes> {
  _CopyWithImpl$Mutation$EditUser$EditUser(
    this._instance,
    this._then,
  );

  final Mutation$EditUser$EditUser _instance;

  final TRes Function(Mutation$EditUser$EditUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$EditUser$EditUser(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$EditUser$EditUser<TRes>
    implements CopyWith$Mutation$EditUser$EditUser<TRes> {
  _CopyWithStubImpl$Mutation$EditUser$EditUser(this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$RemoveUser {
  factory Variables$Mutation$RemoveUser({String? reason}) =>
      Variables$Mutation$RemoveUser._({
        if (reason != null) r'reason': reason,
      });

  Variables$Mutation$RemoveUser._(this._$data);

  factory Variables$Mutation$RemoveUser.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('reason')) {
      final l$reason = data['reason'];
      result$data['reason'] = (l$reason as String?);
    }
    return Variables$Mutation$RemoveUser._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get reason => (_$data['reason'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('reason')) {
      final l$reason = reason;
      result$data['reason'] = l$reason;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$RemoveUser<Variables$Mutation$RemoveUser>
      get copyWith => CopyWith$Variables$Mutation$RemoveUser(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$RemoveUser) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$reason = reason;
    final lOther$reason = other.reason;
    if (_$data.containsKey('reason') != other._$data.containsKey('reason')) {
      return false;
    }
    if (l$reason != lOther$reason) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$reason = reason;
    return Object.hashAll([_$data.containsKey('reason') ? l$reason : const {}]);
  }
}

abstract class CopyWith$Variables$Mutation$RemoveUser<TRes> {
  factory CopyWith$Variables$Mutation$RemoveUser(
    Variables$Mutation$RemoveUser instance,
    TRes Function(Variables$Mutation$RemoveUser) then,
  ) = _CopyWithImpl$Variables$Mutation$RemoveUser;

  factory CopyWith$Variables$Mutation$RemoveUser.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$RemoveUser;

  TRes call({String? reason});
}

class _CopyWithImpl$Variables$Mutation$RemoveUser<TRes>
    implements CopyWith$Variables$Mutation$RemoveUser<TRes> {
  _CopyWithImpl$Variables$Mutation$RemoveUser(
    this._instance,
    this._then,
  );

  final Variables$Mutation$RemoveUser _instance;

  final TRes Function(Variables$Mutation$RemoveUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? reason = _undefined}) =>
      _then(Variables$Mutation$RemoveUser._({
        ..._instance._$data,
        if (reason != _undefined) 'reason': (reason as String?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$RemoveUser<TRes>
    implements CopyWith$Variables$Mutation$RemoveUser<TRes> {
  _CopyWithStubImpl$Variables$Mutation$RemoveUser(this._res);

  TRes _res;

  call({String? reason}) => _res;
}

class Mutation$RemoveUser {
  Mutation$RemoveUser({
    required this.RemoveUser,
    this.$__typename = 'Mutation',
  });

  factory Mutation$RemoveUser.fromJson(Map<String, dynamic> json) {
    final l$RemoveUser = json['RemoveUser'];
    final l$$__typename = json['__typename'];
    return Mutation$RemoveUser(
      RemoveUser: (l$RemoveUser as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool RemoveUser;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$RemoveUser = RemoveUser;
    _resultData['RemoveUser'] = l$RemoveUser;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$RemoveUser = RemoveUser;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$RemoveUser,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$RemoveUser) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$RemoveUser = RemoveUser;
    final lOther$RemoveUser = other.RemoveUser;
    if (l$RemoveUser != lOther$RemoveUser) {
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

extension UtilityExtension$Mutation$RemoveUser on Mutation$RemoveUser {
  CopyWith$Mutation$RemoveUser<Mutation$RemoveUser> get copyWith =>
      CopyWith$Mutation$RemoveUser(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$RemoveUser<TRes> {
  factory CopyWith$Mutation$RemoveUser(
    Mutation$RemoveUser instance,
    TRes Function(Mutation$RemoveUser) then,
  ) = _CopyWithImpl$Mutation$RemoveUser;

  factory CopyWith$Mutation$RemoveUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$RemoveUser;

  TRes call({
    bool? RemoveUser,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$RemoveUser<TRes>
    implements CopyWith$Mutation$RemoveUser<TRes> {
  _CopyWithImpl$Mutation$RemoveUser(
    this._instance,
    this._then,
  );

  final Mutation$RemoveUser _instance;

  final TRes Function(Mutation$RemoveUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? RemoveUser = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$RemoveUser(
        RemoveUser: RemoveUser == _undefined || RemoveUser == null
            ? _instance.RemoveUser
            : (RemoveUser as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$RemoveUser<TRes>
    implements CopyWith$Mutation$RemoveUser<TRes> {
  _CopyWithStubImpl$Mutation$RemoveUser(this._res);

  TRes _res;

  call({
    bool? RemoveUser,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationRemoveUser = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'RemoveUser'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'reason')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'RemoveUser'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'reason'),
            value: VariableNode(name: NameNode(value: 'reason')),
          )
        ],
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
]);
Mutation$RemoveUser _parserFn$Mutation$RemoveUser(Map<String, dynamic> data) =>
    Mutation$RemoveUser.fromJson(data);
typedef OnMutationCompleted$Mutation$RemoveUser = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$RemoveUser?,
);

class Options$Mutation$RemoveUser
    extends graphql.MutationOptions<Mutation$RemoveUser> {
  Options$Mutation$RemoveUser({
    String? operationName,
    Variables$Mutation$RemoveUser? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$RemoveUser? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$RemoveUser? onCompleted,
    graphql.OnMutationUpdate<Mutation$RemoveUser>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$RemoveUser(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationRemoveUser,
          parserFn: _parserFn$Mutation$RemoveUser,
        );

  final OnMutationCompleted$Mutation$RemoveUser? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$RemoveUser
    extends graphql.WatchQueryOptions<Mutation$RemoveUser> {
  WatchOptions$Mutation$RemoveUser({
    String? operationName,
    Variables$Mutation$RemoveUser? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$RemoveUser? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeMutationRemoveUser,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$RemoveUser,
        );
}

extension ClientExtension$Mutation$RemoveUser on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$RemoveUser>> mutate$RemoveUser(
          [Options$Mutation$RemoveUser? options]) async =>
      await this.mutate(options ?? Options$Mutation$RemoveUser());
  graphql.ObservableQuery<Mutation$RemoveUser> watchMutation$RemoveUser(
          [WatchOptions$Mutation$RemoveUser? options]) =>
      this.watchMutation(options ?? WatchOptions$Mutation$RemoveUser());
}
