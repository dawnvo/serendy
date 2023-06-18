import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'schema.gql.dart';

class Fragment$EvaluationFields {
  Fragment$EvaluationFields({
    required this.media,
    required this.id,
    required this.userId,
    required this.emotion,
    required this.private,
    this.$__typename = 'Evaluation',
  });

  factory Fragment$EvaluationFields.fromJson(Map<String, dynamic> json) {
    final l$media = json['media'];
    final l$id = json['id'];
    final l$userId = json['userId'];
    final l$emotion = json['emotion'];
    final l$private = json['private'];
    final l$$__typename = json['__typename'];
    return Fragment$EvaluationFields(
      media: Fragment$EvaluationFields$media.fromJson(
          (l$media as Map<String, dynamic>)),
      id: (l$id as String),
      userId: (l$userId as String),
      emotion: fromJson$Enum$Emotion((l$emotion as String)),
      private: (l$private as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$EvaluationFields$media media;

  final String id;

  final String userId;

  final Enum$Emotion emotion;

  final bool private;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$media = media;
    _resultData['media'] = l$media.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$userId = userId;
    _resultData['userId'] = l$userId;
    final l$emotion = emotion;
    _resultData['emotion'] = toJson$Enum$Emotion(l$emotion);
    final l$private = private;
    _resultData['private'] = l$private;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$media = media;
    final l$id = id;
    final l$userId = userId;
    final l$emotion = emotion;
    final l$private = private;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$media,
      l$id,
      l$userId,
      l$emotion,
      l$private,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$EvaluationFields) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$media = media;
    final lOther$media = other.media;
    if (l$media != lOther$media) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    final l$emotion = emotion;
    final lOther$emotion = other.emotion;
    if (l$emotion != lOther$emotion) {
      return false;
    }
    final l$private = private;
    final lOther$private = other.private;
    if (l$private != lOther$private) {
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

extension UtilityExtension$Fragment$EvaluationFields
    on Fragment$EvaluationFields {
  CopyWith$Fragment$EvaluationFields<Fragment$EvaluationFields> get copyWith =>
      CopyWith$Fragment$EvaluationFields(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$EvaluationFields<TRes> {
  factory CopyWith$Fragment$EvaluationFields(
    Fragment$EvaluationFields instance,
    TRes Function(Fragment$EvaluationFields) then,
  ) = _CopyWithImpl$Fragment$EvaluationFields;

  factory CopyWith$Fragment$EvaluationFields.stub(TRes res) =
      _CopyWithStubImpl$Fragment$EvaluationFields;

  TRes call({
    Fragment$EvaluationFields$media? media,
    String? id,
    String? userId,
    Enum$Emotion? emotion,
    bool? private,
    String? $__typename,
  });
  CopyWith$Fragment$EvaluationFields$media<TRes> get media;
}

class _CopyWithImpl$Fragment$EvaluationFields<TRes>
    implements CopyWith$Fragment$EvaluationFields<TRes> {
  _CopyWithImpl$Fragment$EvaluationFields(
    this._instance,
    this._then,
  );

  final Fragment$EvaluationFields _instance;

  final TRes Function(Fragment$EvaluationFields) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? media = _undefined,
    Object? id = _undefined,
    Object? userId = _undefined,
    Object? emotion = _undefined,
    Object? private = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$EvaluationFields(
        media: media == _undefined || media == null
            ? _instance.media
            : (media as Fragment$EvaluationFields$media),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        userId: userId == _undefined || userId == null
            ? _instance.userId
            : (userId as String),
        emotion: emotion == _undefined || emotion == null
            ? _instance.emotion
            : (emotion as Enum$Emotion),
        private: private == _undefined || private == null
            ? _instance.private
            : (private as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$EvaluationFields$media<TRes> get media {
    final local$media = _instance.media;
    return CopyWith$Fragment$EvaluationFields$media(
        local$media, (e) => call(media: e));
  }
}

class _CopyWithStubImpl$Fragment$EvaluationFields<TRes>
    implements CopyWith$Fragment$EvaluationFields<TRes> {
  _CopyWithStubImpl$Fragment$EvaluationFields(this._res);

  TRes _res;

  call({
    Fragment$EvaluationFields$media? media,
    String? id,
    String? userId,
    Enum$Emotion? emotion,
    bool? private,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$EvaluationFields$media<TRes> get media =>
      CopyWith$Fragment$EvaluationFields$media.stub(_res);
}

const fragmentDefinitionEvaluationFields = FragmentDefinitionNode(
  name: NameNode(value: 'EvaluationFields'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Evaluation'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'media'),
      alias: null,
      arguments: [],
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
          name: NameNode(value: 'title'),
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
    ),
    FieldNode(
      name: NameNode(value: 'id'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'userId'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'emotion'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'private'),
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
const documentNodeFragmentEvaluationFields = DocumentNode(definitions: [
  fragmentDefinitionEvaluationFields,
]);

extension ClientExtension$Fragment$EvaluationFields on graphql.GraphQLClient {
  void writeFragment$EvaluationFields({
    required Fragment$EvaluationFields data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'EvaluationFields',
            document: documentNodeFragmentEvaluationFields,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$EvaluationFields? readFragment$EvaluationFields({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'EvaluationFields',
          document: documentNodeFragmentEvaluationFields,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$EvaluationFields.fromJson(result);
  }
}

class Fragment$EvaluationFields$media {
  Fragment$EvaluationFields$media({
    required this.id,
    required this.title,
    required this.image,
    this.$__typename = 'EvaluationMedia',
  });

  factory Fragment$EvaluationFields$media.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Fragment$EvaluationFields$media(
      id: (l$id as String),
      title: (l$title as String),
      image: (l$image as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$image,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$EvaluationFields$media) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
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

extension UtilityExtension$Fragment$EvaluationFields$media
    on Fragment$EvaluationFields$media {
  CopyWith$Fragment$EvaluationFields$media<Fragment$EvaluationFields$media>
      get copyWith => CopyWith$Fragment$EvaluationFields$media(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$EvaluationFields$media<TRes> {
  factory CopyWith$Fragment$EvaluationFields$media(
    Fragment$EvaluationFields$media instance,
    TRes Function(Fragment$EvaluationFields$media) then,
  ) = _CopyWithImpl$Fragment$EvaluationFields$media;

  factory CopyWith$Fragment$EvaluationFields$media.stub(TRes res) =
      _CopyWithStubImpl$Fragment$EvaluationFields$media;

  TRes call({
    String? id,
    String? title,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$EvaluationFields$media<TRes>
    implements CopyWith$Fragment$EvaluationFields$media<TRes> {
  _CopyWithImpl$Fragment$EvaluationFields$media(
    this._instance,
    this._then,
  );

  final Fragment$EvaluationFields$media _instance;

  final TRes Function(Fragment$EvaluationFields$media) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$EvaluationFields$media(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$EvaluationFields$media<TRes>
    implements CopyWith$Fragment$EvaluationFields$media<TRes> {
  _CopyWithStubImpl$Fragment$EvaluationFields$media(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$GetEvaluation {
  factory Variables$Query$GetEvaluation({required String mediaId}) =>
      Variables$Query$GetEvaluation._({
        r'mediaId': mediaId,
      });

  Variables$Query$GetEvaluation._(this._$data);

  factory Variables$Query$GetEvaluation.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$mediaId = data['mediaId'];
    result$data['mediaId'] = (l$mediaId as String);
    return Variables$Query$GetEvaluation._(result$data);
  }

  Map<String, dynamic> _$data;

  String get mediaId => (_$data['mediaId'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$mediaId = mediaId;
    result$data['mediaId'] = l$mediaId;
    return result$data;
  }

  CopyWith$Variables$Query$GetEvaluation<Variables$Query$GetEvaluation>
      get copyWith => CopyWith$Variables$Query$GetEvaluation(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetEvaluation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$mediaId = mediaId;
    final lOther$mediaId = other.mediaId;
    if (l$mediaId != lOther$mediaId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$mediaId = mediaId;
    return Object.hashAll([l$mediaId]);
  }
}

abstract class CopyWith$Variables$Query$GetEvaluation<TRes> {
  factory CopyWith$Variables$Query$GetEvaluation(
    Variables$Query$GetEvaluation instance,
    TRes Function(Variables$Query$GetEvaluation) then,
  ) = _CopyWithImpl$Variables$Query$GetEvaluation;

  factory CopyWith$Variables$Query$GetEvaluation.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetEvaluation;

  TRes call({String? mediaId});
}

class _CopyWithImpl$Variables$Query$GetEvaluation<TRes>
    implements CopyWith$Variables$Query$GetEvaluation<TRes> {
  _CopyWithImpl$Variables$Query$GetEvaluation(
    this._instance,
    this._then,
  );

  final Variables$Query$GetEvaluation _instance;

  final TRes Function(Variables$Query$GetEvaluation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? mediaId = _undefined}) =>
      _then(Variables$Query$GetEvaluation._({
        ..._instance._$data,
        if (mediaId != _undefined && mediaId != null)
          'mediaId': (mediaId as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetEvaluation<TRes>
    implements CopyWith$Variables$Query$GetEvaluation<TRes> {
  _CopyWithStubImpl$Variables$Query$GetEvaluation(this._res);

  TRes _res;

  call({String? mediaId}) => _res;
}

class Query$GetEvaluation {
  Query$GetEvaluation({
    this.GetEvaluation,
    this.$__typename = 'Query',
  });

  factory Query$GetEvaluation.fromJson(Map<String, dynamic> json) {
    final l$GetEvaluation = json['GetEvaluation'];
    final l$$__typename = json['__typename'];
    return Query$GetEvaluation(
      GetEvaluation: l$GetEvaluation == null
          ? null
          : Fragment$EvaluationFields.fromJson(
              (l$GetEvaluation as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$EvaluationFields? GetEvaluation;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$GetEvaluation = GetEvaluation;
    _resultData['GetEvaluation'] = l$GetEvaluation?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$GetEvaluation = GetEvaluation;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$GetEvaluation,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetEvaluation) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$GetEvaluation = GetEvaluation;
    final lOther$GetEvaluation = other.GetEvaluation;
    if (l$GetEvaluation != lOther$GetEvaluation) {
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

extension UtilityExtension$Query$GetEvaluation on Query$GetEvaluation {
  CopyWith$Query$GetEvaluation<Query$GetEvaluation> get copyWith =>
      CopyWith$Query$GetEvaluation(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetEvaluation<TRes> {
  factory CopyWith$Query$GetEvaluation(
    Query$GetEvaluation instance,
    TRes Function(Query$GetEvaluation) then,
  ) = _CopyWithImpl$Query$GetEvaluation;

  factory CopyWith$Query$GetEvaluation.stub(TRes res) =
      _CopyWithStubImpl$Query$GetEvaluation;

  TRes call({
    Fragment$EvaluationFields? GetEvaluation,
    String? $__typename,
  });
  CopyWith$Fragment$EvaluationFields<TRes> get GetEvaluation;
}

class _CopyWithImpl$Query$GetEvaluation<TRes>
    implements CopyWith$Query$GetEvaluation<TRes> {
  _CopyWithImpl$Query$GetEvaluation(
    this._instance,
    this._then,
  );

  final Query$GetEvaluation _instance;

  final TRes Function(Query$GetEvaluation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? GetEvaluation = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetEvaluation(
        GetEvaluation: GetEvaluation == _undefined
            ? _instance.GetEvaluation
            : (GetEvaluation as Fragment$EvaluationFields?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$EvaluationFields<TRes> get GetEvaluation {
    final local$GetEvaluation = _instance.GetEvaluation;
    return local$GetEvaluation == null
        ? CopyWith$Fragment$EvaluationFields.stub(_then(_instance))
        : CopyWith$Fragment$EvaluationFields(
            local$GetEvaluation, (e) => call(GetEvaluation: e));
  }
}

class _CopyWithStubImpl$Query$GetEvaluation<TRes>
    implements CopyWith$Query$GetEvaluation<TRes> {
  _CopyWithStubImpl$Query$GetEvaluation(this._res);

  TRes _res;

  call({
    Fragment$EvaluationFields? GetEvaluation,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$EvaluationFields<TRes> get GetEvaluation =>
      CopyWith$Fragment$EvaluationFields.stub(_res);
}

const documentNodeQueryGetEvaluation = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetEvaluation'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'mediaId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'GetEvaluation'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'mediaId'),
            value: VariableNode(name: NameNode(value: 'mediaId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'EvaluationFields'),
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
  fragmentDefinitionEvaluationFields,
]);
Query$GetEvaluation _parserFn$Query$GetEvaluation(Map<String, dynamic> data) =>
    Query$GetEvaluation.fromJson(data);
typedef OnQueryComplete$Query$GetEvaluation = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetEvaluation?,
);

class Options$Query$GetEvaluation
    extends graphql.QueryOptions<Query$GetEvaluation> {
  Options$Query$GetEvaluation({
    String? operationName,
    required Variables$Query$GetEvaluation variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetEvaluation? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetEvaluation? onComplete,
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
                    data == null ? null : _parserFn$Query$GetEvaluation(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetEvaluation,
          parserFn: _parserFn$Query$GetEvaluation,
        );

  final OnQueryComplete$Query$GetEvaluation? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetEvaluation
    extends graphql.WatchQueryOptions<Query$GetEvaluation> {
  WatchOptions$Query$GetEvaluation({
    String? operationName,
    required Variables$Query$GetEvaluation variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetEvaluation? typedOptimisticResult,
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
          document: documentNodeQueryGetEvaluation,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetEvaluation,
        );
}

class FetchMoreOptions$Query$GetEvaluation extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetEvaluation({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetEvaluation variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetEvaluation,
        );
}

extension ClientExtension$Query$GetEvaluation on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetEvaluation>> query$GetEvaluation(
          Options$Query$GetEvaluation options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$GetEvaluation> watchQuery$GetEvaluation(
          WatchOptions$Query$GetEvaluation options) =>
      this.watchQuery(options);
  void writeQuery$GetEvaluation({
    required Query$GetEvaluation data,
    required Variables$Query$GetEvaluation variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetEvaluation),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetEvaluation? readQuery$GetEvaluation({
    required Variables$Query$GetEvaluation variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetEvaluation),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetEvaluation.fromJson(result);
  }
}

class Variables$Query$GetEvaluationList {
  factory Variables$Query$GetEvaluationList({required String userId}) =>
      Variables$Query$GetEvaluationList._({
        r'userId': userId,
      });

  Variables$Query$GetEvaluationList._(this._$data);

  factory Variables$Query$GetEvaluationList.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as String);
    return Variables$Query$GetEvaluationList._(result$data);
  }

  Map<String, dynamic> _$data;

  String get userId => (_$data['userId'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userId = userId;
    result$data['userId'] = l$userId;
    return result$data;
  }

  CopyWith$Variables$Query$GetEvaluationList<Variables$Query$GetEvaluationList>
      get copyWith => CopyWith$Variables$Query$GetEvaluationList(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetEvaluationList) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$userId = userId;
    return Object.hashAll([l$userId]);
  }
}

abstract class CopyWith$Variables$Query$GetEvaluationList<TRes> {
  factory CopyWith$Variables$Query$GetEvaluationList(
    Variables$Query$GetEvaluationList instance,
    TRes Function(Variables$Query$GetEvaluationList) then,
  ) = _CopyWithImpl$Variables$Query$GetEvaluationList;

  factory CopyWith$Variables$Query$GetEvaluationList.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetEvaluationList;

  TRes call({String? userId});
}

class _CopyWithImpl$Variables$Query$GetEvaluationList<TRes>
    implements CopyWith$Variables$Query$GetEvaluationList<TRes> {
  _CopyWithImpl$Variables$Query$GetEvaluationList(
    this._instance,
    this._then,
  );

  final Variables$Query$GetEvaluationList _instance;

  final TRes Function(Variables$Query$GetEvaluationList) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? userId = _undefined}) =>
      _then(Variables$Query$GetEvaluationList._({
        ..._instance._$data,
        if (userId != _undefined && userId != null)
          'userId': (userId as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetEvaluationList<TRes>
    implements CopyWith$Variables$Query$GetEvaluationList<TRes> {
  _CopyWithStubImpl$Variables$Query$GetEvaluationList(this._res);

  TRes _res;

  call({String? userId}) => _res;
}

class Query$GetEvaluationList {
  Query$GetEvaluationList({
    required this.GetEvaluationList,
    this.$__typename = 'Query',
  });

  factory Query$GetEvaluationList.fromJson(Map<String, dynamic> json) {
    final l$GetEvaluationList = json['GetEvaluationList'];
    final l$$__typename = json['__typename'];
    return Query$GetEvaluationList(
      GetEvaluationList: (l$GetEvaluationList as List<dynamic>)
          .map((e) =>
              Fragment$EvaluationFields.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$EvaluationFields> GetEvaluationList;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$GetEvaluationList = GetEvaluationList;
    _resultData['GetEvaluationList'] =
        l$GetEvaluationList.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$GetEvaluationList = GetEvaluationList;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$GetEvaluationList.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetEvaluationList) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$GetEvaluationList = GetEvaluationList;
    final lOther$GetEvaluationList = other.GetEvaluationList;
    if (l$GetEvaluationList.length != lOther$GetEvaluationList.length) {
      return false;
    }
    for (int i = 0; i < l$GetEvaluationList.length; i++) {
      final l$GetEvaluationList$entry = l$GetEvaluationList[i];
      final lOther$GetEvaluationList$entry = lOther$GetEvaluationList[i];
      if (l$GetEvaluationList$entry != lOther$GetEvaluationList$entry) {
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

extension UtilityExtension$Query$GetEvaluationList on Query$GetEvaluationList {
  CopyWith$Query$GetEvaluationList<Query$GetEvaluationList> get copyWith =>
      CopyWith$Query$GetEvaluationList(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetEvaluationList<TRes> {
  factory CopyWith$Query$GetEvaluationList(
    Query$GetEvaluationList instance,
    TRes Function(Query$GetEvaluationList) then,
  ) = _CopyWithImpl$Query$GetEvaluationList;

  factory CopyWith$Query$GetEvaluationList.stub(TRes res) =
      _CopyWithStubImpl$Query$GetEvaluationList;

  TRes call({
    List<Fragment$EvaluationFields>? GetEvaluationList,
    String? $__typename,
  });
  TRes GetEvaluationList(
      Iterable<Fragment$EvaluationFields> Function(
              Iterable<
                  CopyWith$Fragment$EvaluationFields<
                      Fragment$EvaluationFields>>)
          _fn);
}

class _CopyWithImpl$Query$GetEvaluationList<TRes>
    implements CopyWith$Query$GetEvaluationList<TRes> {
  _CopyWithImpl$Query$GetEvaluationList(
    this._instance,
    this._then,
  );

  final Query$GetEvaluationList _instance;

  final TRes Function(Query$GetEvaluationList) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? GetEvaluationList = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetEvaluationList(
        GetEvaluationList:
            GetEvaluationList == _undefined || GetEvaluationList == null
                ? _instance.GetEvaluationList
                : (GetEvaluationList as List<Fragment$EvaluationFields>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes GetEvaluationList(
          Iterable<Fragment$EvaluationFields> Function(
                  Iterable<
                      CopyWith$Fragment$EvaluationFields<
                          Fragment$EvaluationFields>>)
              _fn) =>
      call(
          GetEvaluationList: _fn(_instance.GetEvaluationList.map(
              (e) => CopyWith$Fragment$EvaluationFields(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetEvaluationList<TRes>
    implements CopyWith$Query$GetEvaluationList<TRes> {
  _CopyWithStubImpl$Query$GetEvaluationList(this._res);

  TRes _res;

  call({
    List<Fragment$EvaluationFields>? GetEvaluationList,
    String? $__typename,
  }) =>
      _res;
  GetEvaluationList(_fn) => _res;
}

const documentNodeQueryGetEvaluationList = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetEvaluationList'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'GetEvaluationList'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'userId'),
            value: VariableNode(name: NameNode(value: 'userId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'EvaluationFields'),
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
  fragmentDefinitionEvaluationFields,
]);
Query$GetEvaluationList _parserFn$Query$GetEvaluationList(
        Map<String, dynamic> data) =>
    Query$GetEvaluationList.fromJson(data);
typedef OnQueryComplete$Query$GetEvaluationList = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetEvaluationList?,
);

class Options$Query$GetEvaluationList
    extends graphql.QueryOptions<Query$GetEvaluationList> {
  Options$Query$GetEvaluationList({
    String? operationName,
    required Variables$Query$GetEvaluationList variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetEvaluationList? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetEvaluationList? onComplete,
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
                    data == null
                        ? null
                        : _parserFn$Query$GetEvaluationList(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetEvaluationList,
          parserFn: _parserFn$Query$GetEvaluationList,
        );

  final OnQueryComplete$Query$GetEvaluationList? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetEvaluationList
    extends graphql.WatchQueryOptions<Query$GetEvaluationList> {
  WatchOptions$Query$GetEvaluationList({
    String? operationName,
    required Variables$Query$GetEvaluationList variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetEvaluationList? typedOptimisticResult,
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
          document: documentNodeQueryGetEvaluationList,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetEvaluationList,
        );
}

class FetchMoreOptions$Query$GetEvaluationList
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetEvaluationList({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetEvaluationList variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetEvaluationList,
        );
}

extension ClientExtension$Query$GetEvaluationList on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetEvaluationList>> query$GetEvaluationList(
          Options$Query$GetEvaluationList options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$GetEvaluationList> watchQuery$GetEvaluationList(
          WatchOptions$Query$GetEvaluationList options) =>
      this.watchQuery(options);
  void writeQuery$GetEvaluationList({
    required Query$GetEvaluationList data,
    required Variables$Query$GetEvaluationList variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetEvaluationList),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetEvaluationList? readQuery$GetEvaluationList({
    required Variables$Query$GetEvaluationList variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryGetEvaluationList),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetEvaluationList.fromJson(result);
  }
}

class Variables$Mutation$Evaluate {
  factory Variables$Mutation$Evaluate({
    required String mediaId,
    required Enum$Emotion emotion,
  }) =>
      Variables$Mutation$Evaluate._({
        r'mediaId': mediaId,
        r'emotion': emotion,
      });

  Variables$Mutation$Evaluate._(this._$data);

  factory Variables$Mutation$Evaluate.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$mediaId = data['mediaId'];
    result$data['mediaId'] = (l$mediaId as String);
    final l$emotion = data['emotion'];
    result$data['emotion'] = fromJson$Enum$Emotion((l$emotion as String));
    return Variables$Mutation$Evaluate._(result$data);
  }

  Map<String, dynamic> _$data;

  String get mediaId => (_$data['mediaId'] as String);
  Enum$Emotion get emotion => (_$data['emotion'] as Enum$Emotion);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$mediaId = mediaId;
    result$data['mediaId'] = l$mediaId;
    final l$emotion = emotion;
    result$data['emotion'] = toJson$Enum$Emotion(l$emotion);
    return result$data;
  }

  CopyWith$Variables$Mutation$Evaluate<Variables$Mutation$Evaluate>
      get copyWith => CopyWith$Variables$Mutation$Evaluate(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$Evaluate) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$mediaId = mediaId;
    final lOther$mediaId = other.mediaId;
    if (l$mediaId != lOther$mediaId) {
      return false;
    }
    final l$emotion = emotion;
    final lOther$emotion = other.emotion;
    if (l$emotion != lOther$emotion) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$mediaId = mediaId;
    final l$emotion = emotion;
    return Object.hashAll([
      l$mediaId,
      l$emotion,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$Evaluate<TRes> {
  factory CopyWith$Variables$Mutation$Evaluate(
    Variables$Mutation$Evaluate instance,
    TRes Function(Variables$Mutation$Evaluate) then,
  ) = _CopyWithImpl$Variables$Mutation$Evaluate;

  factory CopyWith$Variables$Mutation$Evaluate.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$Evaluate;

  TRes call({
    String? mediaId,
    Enum$Emotion? emotion,
  });
}

class _CopyWithImpl$Variables$Mutation$Evaluate<TRes>
    implements CopyWith$Variables$Mutation$Evaluate<TRes> {
  _CopyWithImpl$Variables$Mutation$Evaluate(
    this._instance,
    this._then,
  );

  final Variables$Mutation$Evaluate _instance;

  final TRes Function(Variables$Mutation$Evaluate) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? mediaId = _undefined,
    Object? emotion = _undefined,
  }) =>
      _then(Variables$Mutation$Evaluate._({
        ..._instance._$data,
        if (mediaId != _undefined && mediaId != null)
          'mediaId': (mediaId as String),
        if (emotion != _undefined && emotion != null)
          'emotion': (emotion as Enum$Emotion),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$Evaluate<TRes>
    implements CopyWith$Variables$Mutation$Evaluate<TRes> {
  _CopyWithStubImpl$Variables$Mutation$Evaluate(this._res);

  TRes _res;

  call({
    String? mediaId,
    Enum$Emotion? emotion,
  }) =>
      _res;
}

class Mutation$Evaluate {
  Mutation$Evaluate({
    required this.Evaluate,
    this.$__typename = 'Mutation',
  });

  factory Mutation$Evaluate.fromJson(Map<String, dynamic> json) {
    final l$Evaluate = json['Evaluate'];
    final l$$__typename = json['__typename'];
    return Mutation$Evaluate(
      Evaluate: Fragment$EvaluationFields.fromJson(
          (l$Evaluate as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$EvaluationFields Evaluate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$Evaluate = Evaluate;
    _resultData['Evaluate'] = l$Evaluate.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$Evaluate = Evaluate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$Evaluate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$Evaluate) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$Evaluate = Evaluate;
    final lOther$Evaluate = other.Evaluate;
    if (l$Evaluate != lOther$Evaluate) {
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

extension UtilityExtension$Mutation$Evaluate on Mutation$Evaluate {
  CopyWith$Mutation$Evaluate<Mutation$Evaluate> get copyWith =>
      CopyWith$Mutation$Evaluate(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$Evaluate<TRes> {
  factory CopyWith$Mutation$Evaluate(
    Mutation$Evaluate instance,
    TRes Function(Mutation$Evaluate) then,
  ) = _CopyWithImpl$Mutation$Evaluate;

  factory CopyWith$Mutation$Evaluate.stub(TRes res) =
      _CopyWithStubImpl$Mutation$Evaluate;

  TRes call({
    Fragment$EvaluationFields? Evaluate,
    String? $__typename,
  });
  CopyWith$Fragment$EvaluationFields<TRes> get Evaluate;
}

class _CopyWithImpl$Mutation$Evaluate<TRes>
    implements CopyWith$Mutation$Evaluate<TRes> {
  _CopyWithImpl$Mutation$Evaluate(
    this._instance,
    this._then,
  );

  final Mutation$Evaluate _instance;

  final TRes Function(Mutation$Evaluate) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? Evaluate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$Evaluate(
        Evaluate: Evaluate == _undefined || Evaluate == null
            ? _instance.Evaluate
            : (Evaluate as Fragment$EvaluationFields),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$EvaluationFields<TRes> get Evaluate {
    final local$Evaluate = _instance.Evaluate;
    return CopyWith$Fragment$EvaluationFields(
        local$Evaluate, (e) => call(Evaluate: e));
  }
}

class _CopyWithStubImpl$Mutation$Evaluate<TRes>
    implements CopyWith$Mutation$Evaluate<TRes> {
  _CopyWithStubImpl$Mutation$Evaluate(this._res);

  TRes _res;

  call({
    Fragment$EvaluationFields? Evaluate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$EvaluationFields<TRes> get Evaluate =>
      CopyWith$Fragment$EvaluationFields.stub(_res);
}

const documentNodeMutationEvaluate = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'Evaluate'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'mediaId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'emotion')),
        type: NamedTypeNode(
          name: NameNode(value: 'Emotion'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'Evaluate'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'mediaId'),
            value: VariableNode(name: NameNode(value: 'mediaId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'emotion'),
            value: VariableNode(name: NameNode(value: 'emotion')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'EvaluationFields'),
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
  fragmentDefinitionEvaluationFields,
]);
Mutation$Evaluate _parserFn$Mutation$Evaluate(Map<String, dynamic> data) =>
    Mutation$Evaluate.fromJson(data);
typedef OnMutationCompleted$Mutation$Evaluate = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$Evaluate?,
);

class Options$Mutation$Evaluate
    extends graphql.MutationOptions<Mutation$Evaluate> {
  Options$Mutation$Evaluate({
    String? operationName,
    required Variables$Mutation$Evaluate variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$Evaluate? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$Evaluate? onCompleted,
    graphql.OnMutationUpdate<Mutation$Evaluate>? update,
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
                    data == null ? null : _parserFn$Mutation$Evaluate(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationEvaluate,
          parserFn: _parserFn$Mutation$Evaluate,
        );

  final OnMutationCompleted$Mutation$Evaluate? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$Evaluate
    extends graphql.WatchQueryOptions<Mutation$Evaluate> {
  WatchOptions$Mutation$Evaluate({
    String? operationName,
    required Variables$Mutation$Evaluate variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$Evaluate? typedOptimisticResult,
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
          document: documentNodeMutationEvaluate,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$Evaluate,
        );
}

extension ClientExtension$Mutation$Evaluate on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$Evaluate>> mutate$Evaluate(
          Options$Mutation$Evaluate options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$Evaluate> watchMutation$Evaluate(
          WatchOptions$Mutation$Evaluate options) =>
      this.watchMutation(options);
}

class Variables$Mutation$RemoveEvaluation {
  factory Variables$Mutation$RemoveEvaluation({required String mediaId}) =>
      Variables$Mutation$RemoveEvaluation._({
        r'mediaId': mediaId,
      });

  Variables$Mutation$RemoveEvaluation._(this._$data);

  factory Variables$Mutation$RemoveEvaluation.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$mediaId = data['mediaId'];
    result$data['mediaId'] = (l$mediaId as String);
    return Variables$Mutation$RemoveEvaluation._(result$data);
  }

  Map<String, dynamic> _$data;

  String get mediaId => (_$data['mediaId'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$mediaId = mediaId;
    result$data['mediaId'] = l$mediaId;
    return result$data;
  }

  CopyWith$Variables$Mutation$RemoveEvaluation<
          Variables$Mutation$RemoveEvaluation>
      get copyWith => CopyWith$Variables$Mutation$RemoveEvaluation(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$RemoveEvaluation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$mediaId = mediaId;
    final lOther$mediaId = other.mediaId;
    if (l$mediaId != lOther$mediaId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$mediaId = mediaId;
    return Object.hashAll([l$mediaId]);
  }
}

abstract class CopyWith$Variables$Mutation$RemoveEvaluation<TRes> {
  factory CopyWith$Variables$Mutation$RemoveEvaluation(
    Variables$Mutation$RemoveEvaluation instance,
    TRes Function(Variables$Mutation$RemoveEvaluation) then,
  ) = _CopyWithImpl$Variables$Mutation$RemoveEvaluation;

  factory CopyWith$Variables$Mutation$RemoveEvaluation.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$RemoveEvaluation;

  TRes call({String? mediaId});
}

class _CopyWithImpl$Variables$Mutation$RemoveEvaluation<TRes>
    implements CopyWith$Variables$Mutation$RemoveEvaluation<TRes> {
  _CopyWithImpl$Variables$Mutation$RemoveEvaluation(
    this._instance,
    this._then,
  );

  final Variables$Mutation$RemoveEvaluation _instance;

  final TRes Function(Variables$Mutation$RemoveEvaluation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? mediaId = _undefined}) =>
      _then(Variables$Mutation$RemoveEvaluation._({
        ..._instance._$data,
        if (mediaId != _undefined && mediaId != null)
          'mediaId': (mediaId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$RemoveEvaluation<TRes>
    implements CopyWith$Variables$Mutation$RemoveEvaluation<TRes> {
  _CopyWithStubImpl$Variables$Mutation$RemoveEvaluation(this._res);

  TRes _res;

  call({String? mediaId}) => _res;
}

class Mutation$RemoveEvaluation {
  Mutation$RemoveEvaluation({
    required this.RemoveEvaluation,
    this.$__typename = 'Mutation',
  });

  factory Mutation$RemoveEvaluation.fromJson(Map<String, dynamic> json) {
    final l$RemoveEvaluation = json['RemoveEvaluation'];
    final l$$__typename = json['__typename'];
    return Mutation$RemoveEvaluation(
      RemoveEvaluation: (l$RemoveEvaluation as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool RemoveEvaluation;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$RemoveEvaluation = RemoveEvaluation;
    _resultData['RemoveEvaluation'] = l$RemoveEvaluation;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$RemoveEvaluation = RemoveEvaluation;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$RemoveEvaluation,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$RemoveEvaluation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$RemoveEvaluation = RemoveEvaluation;
    final lOther$RemoveEvaluation = other.RemoveEvaluation;
    if (l$RemoveEvaluation != lOther$RemoveEvaluation) {
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

extension UtilityExtension$Mutation$RemoveEvaluation
    on Mutation$RemoveEvaluation {
  CopyWith$Mutation$RemoveEvaluation<Mutation$RemoveEvaluation> get copyWith =>
      CopyWith$Mutation$RemoveEvaluation(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$RemoveEvaluation<TRes> {
  factory CopyWith$Mutation$RemoveEvaluation(
    Mutation$RemoveEvaluation instance,
    TRes Function(Mutation$RemoveEvaluation) then,
  ) = _CopyWithImpl$Mutation$RemoveEvaluation;

  factory CopyWith$Mutation$RemoveEvaluation.stub(TRes res) =
      _CopyWithStubImpl$Mutation$RemoveEvaluation;

  TRes call({
    bool? RemoveEvaluation,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$RemoveEvaluation<TRes>
    implements CopyWith$Mutation$RemoveEvaluation<TRes> {
  _CopyWithImpl$Mutation$RemoveEvaluation(
    this._instance,
    this._then,
  );

  final Mutation$RemoveEvaluation _instance;

  final TRes Function(Mutation$RemoveEvaluation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? RemoveEvaluation = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$RemoveEvaluation(
        RemoveEvaluation:
            RemoveEvaluation == _undefined || RemoveEvaluation == null
                ? _instance.RemoveEvaluation
                : (RemoveEvaluation as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$RemoveEvaluation<TRes>
    implements CopyWith$Mutation$RemoveEvaluation<TRes> {
  _CopyWithStubImpl$Mutation$RemoveEvaluation(this._res);

  TRes _res;

  call({
    bool? RemoveEvaluation,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationRemoveEvaluation = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'RemoveEvaluation'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'mediaId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'RemoveEvaluation'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'mediaId'),
            value: VariableNode(name: NameNode(value: 'mediaId')),
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
Mutation$RemoveEvaluation _parserFn$Mutation$RemoveEvaluation(
        Map<String, dynamic> data) =>
    Mutation$RemoveEvaluation.fromJson(data);
typedef OnMutationCompleted$Mutation$RemoveEvaluation = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$RemoveEvaluation?,
);

class Options$Mutation$RemoveEvaluation
    extends graphql.MutationOptions<Mutation$RemoveEvaluation> {
  Options$Mutation$RemoveEvaluation({
    String? operationName,
    required Variables$Mutation$RemoveEvaluation variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$RemoveEvaluation? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$RemoveEvaluation? onCompleted,
    graphql.OnMutationUpdate<Mutation$RemoveEvaluation>? update,
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
                    data == null
                        ? null
                        : _parserFn$Mutation$RemoveEvaluation(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationRemoveEvaluation,
          parserFn: _parserFn$Mutation$RemoveEvaluation,
        );

  final OnMutationCompleted$Mutation$RemoveEvaluation? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$RemoveEvaluation
    extends graphql.WatchQueryOptions<Mutation$RemoveEvaluation> {
  WatchOptions$Mutation$RemoveEvaluation({
    String? operationName,
    required Variables$Mutation$RemoveEvaluation variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$RemoveEvaluation? typedOptimisticResult,
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
          document: documentNodeMutationRemoveEvaluation,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$RemoveEvaluation,
        );
}

extension ClientExtension$Mutation$RemoveEvaluation on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$RemoveEvaluation>>
      mutate$RemoveEvaluation(
              Options$Mutation$RemoveEvaluation options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$RemoveEvaluation>
      watchMutation$RemoveEvaluation(
              WatchOptions$Mutation$RemoveEvaluation options) =>
          this.watchMutation(options);
}
