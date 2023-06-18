import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'schema.gql.dart';

class Fragment$MediaFields {
  Fragment$MediaFields({
    required this.id,
    required this.type,
    required this.status,
    required this.title,
    required this.image,
    required this.genres,
    required this.isAdult,
    this.startDate,
    this.endDate,
    this.$__typename = 'Media',
  });

  factory Fragment$MediaFields.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$type = json['type'];
    final l$status = json['status'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$genres = json['genres'];
    final l$isAdult = json['isAdult'];
    final l$startDate = json['startDate'];
    final l$endDate = json['endDate'];
    final l$$__typename = json['__typename'];
    return Fragment$MediaFields(
      id: (l$id as String),
      type: fromJson$Enum$MediaType((l$type as String)),
      status: fromJson$Enum$MediaStatus((l$status as String)),
      title: (l$title as String),
      image: (l$image as String),
      genres: (l$genres as List<dynamic>).map((e) => (e as String)).toList(),
      isAdult: (l$isAdult as bool),
      startDate:
          l$startDate == null ? null : DateTime.parse((l$startDate as String)),
      endDate: l$endDate == null ? null : DateTime.parse((l$endDate as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$MediaType type;

  final Enum$MediaStatus status;

  final String title;

  final String image;

  final List<String> genres;

  final bool isAdult;

  final DateTime? startDate;

  final DateTime? endDate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$type = type;
    _resultData['type'] = toJson$Enum$MediaType(l$type);
    final l$status = status;
    _resultData['status'] = toJson$Enum$MediaStatus(l$status);
    final l$title = title;
    _resultData['title'] = l$title;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$genres = genres;
    _resultData['genres'] = l$genres.map((e) => e).toList();
    final l$isAdult = isAdult;
    _resultData['isAdult'] = l$isAdult;
    final l$startDate = startDate;
    _resultData['startDate'] = l$startDate?.toIso8601String();
    final l$endDate = endDate;
    _resultData['endDate'] = l$endDate?.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$type = type;
    final l$status = status;
    final l$title = title;
    final l$image = image;
    final l$genres = genres;
    final l$isAdult = isAdult;
    final l$startDate = startDate;
    final l$endDate = endDate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$type,
      l$status,
      l$title,
      l$image,
      Object.hashAll(l$genres.map((v) => v)),
      l$isAdult,
      l$startDate,
      l$endDate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$MediaFields) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
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
    final l$genres = genres;
    final lOther$genres = other.genres;
    if (l$genres.length != lOther$genres.length) {
      return false;
    }
    for (int i = 0; i < l$genres.length; i++) {
      final l$genres$entry = l$genres[i];
      final lOther$genres$entry = lOther$genres[i];
      if (l$genres$entry != lOther$genres$entry) {
        return false;
      }
    }
    final l$isAdult = isAdult;
    final lOther$isAdult = other.isAdult;
    if (l$isAdult != lOther$isAdult) {
      return false;
    }
    final l$startDate = startDate;
    final lOther$startDate = other.startDate;
    if (l$startDate != lOther$startDate) {
      return false;
    }
    final l$endDate = endDate;
    final lOther$endDate = other.endDate;
    if (l$endDate != lOther$endDate) {
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

extension UtilityExtension$Fragment$MediaFields on Fragment$MediaFields {
  CopyWith$Fragment$MediaFields<Fragment$MediaFields> get copyWith =>
      CopyWith$Fragment$MediaFields(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$MediaFields<TRes> {
  factory CopyWith$Fragment$MediaFields(
    Fragment$MediaFields instance,
    TRes Function(Fragment$MediaFields) then,
  ) = _CopyWithImpl$Fragment$MediaFields;

  factory CopyWith$Fragment$MediaFields.stub(TRes res) =
      _CopyWithStubImpl$Fragment$MediaFields;

  TRes call({
    String? id,
    Enum$MediaType? type,
    Enum$MediaStatus? status,
    String? title,
    String? image,
    List<String>? genres,
    bool? isAdult,
    DateTime? startDate,
    DateTime? endDate,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$MediaFields<TRes>
    implements CopyWith$Fragment$MediaFields<TRes> {
  _CopyWithImpl$Fragment$MediaFields(
    this._instance,
    this._then,
  );

  final Fragment$MediaFields _instance;

  final TRes Function(Fragment$MediaFields) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? type = _undefined,
    Object? status = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? genres = _undefined,
    Object? isAdult = _undefined,
    Object? startDate = _undefined,
    Object? endDate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$MediaFields(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        type: type == _undefined || type == null
            ? _instance.type
            : (type as Enum$MediaType),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as Enum$MediaStatus),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        genres: genres == _undefined || genres == null
            ? _instance.genres
            : (genres as List<String>),
        isAdult: isAdult == _undefined || isAdult == null
            ? _instance.isAdult
            : (isAdult as bool),
        startDate: startDate == _undefined
            ? _instance.startDate
            : (startDate as DateTime?),
        endDate:
            endDate == _undefined ? _instance.endDate : (endDate as DateTime?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$MediaFields<TRes>
    implements CopyWith$Fragment$MediaFields<TRes> {
  _CopyWithStubImpl$Fragment$MediaFields(this._res);

  TRes _res;

  call({
    String? id,
    Enum$MediaType? type,
    Enum$MediaStatus? status,
    String? title,
    String? image,
    List<String>? genres,
    bool? isAdult,
    DateTime? startDate,
    DateTime? endDate,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionMediaFields = FragmentDefinitionNode(
  name: NameNode(value: 'MediaFields'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Media'),
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
      name: NameNode(value: 'type'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'status'),
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
      name: NameNode(value: 'genres'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'isAdult'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'startDate'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'endDate'),
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
const documentNodeFragmentMediaFields = DocumentNode(definitions: [
  fragmentDefinitionMediaFields,
]);

extension ClientExtension$Fragment$MediaFields on graphql.GraphQLClient {
  void writeFragment$MediaFields({
    required Fragment$MediaFields data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'MediaFields',
            document: documentNodeFragmentMediaFields,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$MediaFields? readFragment$MediaFields({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'MediaFields',
          document: documentNodeFragmentMediaFields,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$MediaFields.fromJson(result);
  }
}

class Variables$Query$GetMedia {
  factory Variables$Query$GetMedia({required String mediaId}) =>
      Variables$Query$GetMedia._({
        r'mediaId': mediaId,
      });

  Variables$Query$GetMedia._(this._$data);

  factory Variables$Query$GetMedia.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$mediaId = data['mediaId'];
    result$data['mediaId'] = (l$mediaId as String);
    return Variables$Query$GetMedia._(result$data);
  }

  Map<String, dynamic> _$data;

  String get mediaId => (_$data['mediaId'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$mediaId = mediaId;
    result$data['mediaId'] = l$mediaId;
    return result$data;
  }

  CopyWith$Variables$Query$GetMedia<Variables$Query$GetMedia> get copyWith =>
      CopyWith$Variables$Query$GetMedia(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetMedia) ||
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

abstract class CopyWith$Variables$Query$GetMedia<TRes> {
  factory CopyWith$Variables$Query$GetMedia(
    Variables$Query$GetMedia instance,
    TRes Function(Variables$Query$GetMedia) then,
  ) = _CopyWithImpl$Variables$Query$GetMedia;

  factory CopyWith$Variables$Query$GetMedia.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetMedia;

  TRes call({String? mediaId});
}

class _CopyWithImpl$Variables$Query$GetMedia<TRes>
    implements CopyWith$Variables$Query$GetMedia<TRes> {
  _CopyWithImpl$Variables$Query$GetMedia(
    this._instance,
    this._then,
  );

  final Variables$Query$GetMedia _instance;

  final TRes Function(Variables$Query$GetMedia) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? mediaId = _undefined}) =>
      _then(Variables$Query$GetMedia._({
        ..._instance._$data,
        if (mediaId != _undefined && mediaId != null)
          'mediaId': (mediaId as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetMedia<TRes>
    implements CopyWith$Variables$Query$GetMedia<TRes> {
  _CopyWithStubImpl$Variables$Query$GetMedia(this._res);

  TRes _res;

  call({String? mediaId}) => _res;
}

class Query$GetMedia {
  Query$GetMedia({
    required this.GetMedia,
    this.$__typename = 'Query',
  });

  factory Query$GetMedia.fromJson(Map<String, dynamic> json) {
    final l$GetMedia = json['GetMedia'];
    final l$$__typename = json['__typename'];
    return Query$GetMedia(
      GetMedia:
          Fragment$MediaFields.fromJson((l$GetMedia as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$MediaFields GetMedia;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$GetMedia = GetMedia;
    _resultData['GetMedia'] = l$GetMedia.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$GetMedia = GetMedia;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$GetMedia,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetMedia) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$GetMedia = GetMedia;
    final lOther$GetMedia = other.GetMedia;
    if (l$GetMedia != lOther$GetMedia) {
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

extension UtilityExtension$Query$GetMedia on Query$GetMedia {
  CopyWith$Query$GetMedia<Query$GetMedia> get copyWith =>
      CopyWith$Query$GetMedia(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetMedia<TRes> {
  factory CopyWith$Query$GetMedia(
    Query$GetMedia instance,
    TRes Function(Query$GetMedia) then,
  ) = _CopyWithImpl$Query$GetMedia;

  factory CopyWith$Query$GetMedia.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMedia;

  TRes call({
    Fragment$MediaFields? GetMedia,
    String? $__typename,
  });
  CopyWith$Fragment$MediaFields<TRes> get GetMedia;
}

class _CopyWithImpl$Query$GetMedia<TRes>
    implements CopyWith$Query$GetMedia<TRes> {
  _CopyWithImpl$Query$GetMedia(
    this._instance,
    this._then,
  );

  final Query$GetMedia _instance;

  final TRes Function(Query$GetMedia) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? GetMedia = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMedia(
        GetMedia: GetMedia == _undefined || GetMedia == null
            ? _instance.GetMedia
            : (GetMedia as Fragment$MediaFields),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$MediaFields<TRes> get GetMedia {
    final local$GetMedia = _instance.GetMedia;
    return CopyWith$Fragment$MediaFields(
        local$GetMedia, (e) => call(GetMedia: e));
  }
}

class _CopyWithStubImpl$Query$GetMedia<TRes>
    implements CopyWith$Query$GetMedia<TRes> {
  _CopyWithStubImpl$Query$GetMedia(this._res);

  TRes _res;

  call({
    Fragment$MediaFields? GetMedia,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$MediaFields<TRes> get GetMedia =>
      CopyWith$Fragment$MediaFields.stub(_res);
}

const documentNodeQueryGetMedia = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetMedia'),
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
        name: NameNode(value: 'GetMedia'),
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
            name: NameNode(value: 'MediaFields'),
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
  fragmentDefinitionMediaFields,
]);
Query$GetMedia _parserFn$Query$GetMedia(Map<String, dynamic> data) =>
    Query$GetMedia.fromJson(data);
typedef OnQueryComplete$Query$GetMedia = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetMedia?,
);

class Options$Query$GetMedia extends graphql.QueryOptions<Query$GetMedia> {
  Options$Query$GetMedia({
    String? operationName,
    required Variables$Query$GetMedia variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMedia? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetMedia? onComplete,
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
                    data == null ? null : _parserFn$Query$GetMedia(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetMedia,
          parserFn: _parserFn$Query$GetMedia,
        );

  final OnQueryComplete$Query$GetMedia? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetMedia
    extends graphql.WatchQueryOptions<Query$GetMedia> {
  WatchOptions$Query$GetMedia({
    String? operationName,
    required Variables$Query$GetMedia variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMedia? typedOptimisticResult,
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
          document: documentNodeQueryGetMedia,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetMedia,
        );
}

class FetchMoreOptions$Query$GetMedia extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetMedia({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetMedia variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetMedia,
        );
}

extension ClientExtension$Query$GetMedia on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetMedia>> query$GetMedia(
          Options$Query$GetMedia options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$GetMedia> watchQuery$GetMedia(
          WatchOptions$Query$GetMedia options) =>
      this.watchQuery(options);
  void writeQuery$GetMedia({
    required Query$GetMedia data,
    required Variables$Query$GetMedia variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryGetMedia),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetMedia? readQuery$GetMedia({
    required Variables$Query$GetMedia variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetMedia),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetMedia.fromJson(result);
  }
}

class Variables$Query$GetMediaList {
  factory Variables$Query$GetMediaList({String? title}) =>
      Variables$Query$GetMediaList._({
        if (title != null) r'title': title,
      });

  Variables$Query$GetMediaList._(this._$data);

  factory Variables$Query$GetMediaList.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('title')) {
      final l$title = data['title'];
      result$data['title'] = (l$title as String?);
    }
    return Variables$Query$GetMediaList._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get title => (_$data['title'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('title')) {
      final l$title = title;
      result$data['title'] = l$title;
    }
    return result$data;
  }

  CopyWith$Variables$Query$GetMediaList<Variables$Query$GetMediaList>
      get copyWith => CopyWith$Variables$Query$GetMediaList(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetMediaList) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (_$data.containsKey('title') != other._$data.containsKey('title')) {
      return false;
    }
    if (l$title != lOther$title) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$title = title;
    return Object.hashAll([_$data.containsKey('title') ? l$title : const {}]);
  }
}

abstract class CopyWith$Variables$Query$GetMediaList<TRes> {
  factory CopyWith$Variables$Query$GetMediaList(
    Variables$Query$GetMediaList instance,
    TRes Function(Variables$Query$GetMediaList) then,
  ) = _CopyWithImpl$Variables$Query$GetMediaList;

  factory CopyWith$Variables$Query$GetMediaList.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetMediaList;

  TRes call({String? title});
}

class _CopyWithImpl$Variables$Query$GetMediaList<TRes>
    implements CopyWith$Variables$Query$GetMediaList<TRes> {
  _CopyWithImpl$Variables$Query$GetMediaList(
    this._instance,
    this._then,
  );

  final Variables$Query$GetMediaList _instance;

  final TRes Function(Variables$Query$GetMediaList) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? title = _undefined}) =>
      _then(Variables$Query$GetMediaList._({
        ..._instance._$data,
        if (title != _undefined) 'title': (title as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetMediaList<TRes>
    implements CopyWith$Variables$Query$GetMediaList<TRes> {
  _CopyWithStubImpl$Variables$Query$GetMediaList(this._res);

  TRes _res;

  call({String? title}) => _res;
}

class Query$GetMediaList {
  Query$GetMediaList({
    required this.GetMediaList,
    this.$__typename = 'Query',
  });

  factory Query$GetMediaList.fromJson(Map<String, dynamic> json) {
    final l$GetMediaList = json['GetMediaList'];
    final l$$__typename = json['__typename'];
    return Query$GetMediaList(
      GetMediaList: (l$GetMediaList as List<dynamic>)
          .map(
              (e) => Fragment$MediaFields.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$MediaFields> GetMediaList;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$GetMediaList = GetMediaList;
    _resultData['GetMediaList'] =
        l$GetMediaList.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$GetMediaList = GetMediaList;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$GetMediaList.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetMediaList) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$GetMediaList = GetMediaList;
    final lOther$GetMediaList = other.GetMediaList;
    if (l$GetMediaList.length != lOther$GetMediaList.length) {
      return false;
    }
    for (int i = 0; i < l$GetMediaList.length; i++) {
      final l$GetMediaList$entry = l$GetMediaList[i];
      final lOther$GetMediaList$entry = lOther$GetMediaList[i];
      if (l$GetMediaList$entry != lOther$GetMediaList$entry) {
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

extension UtilityExtension$Query$GetMediaList on Query$GetMediaList {
  CopyWith$Query$GetMediaList<Query$GetMediaList> get copyWith =>
      CopyWith$Query$GetMediaList(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetMediaList<TRes> {
  factory CopyWith$Query$GetMediaList(
    Query$GetMediaList instance,
    TRes Function(Query$GetMediaList) then,
  ) = _CopyWithImpl$Query$GetMediaList;

  factory CopyWith$Query$GetMediaList.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMediaList;

  TRes call({
    List<Fragment$MediaFields>? GetMediaList,
    String? $__typename,
  });
  TRes GetMediaList(
      Iterable<Fragment$MediaFields> Function(
              Iterable<CopyWith$Fragment$MediaFields<Fragment$MediaFields>>)
          _fn);
}

class _CopyWithImpl$Query$GetMediaList<TRes>
    implements CopyWith$Query$GetMediaList<TRes> {
  _CopyWithImpl$Query$GetMediaList(
    this._instance,
    this._then,
  );

  final Query$GetMediaList _instance;

  final TRes Function(Query$GetMediaList) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? GetMediaList = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMediaList(
        GetMediaList: GetMediaList == _undefined || GetMediaList == null
            ? _instance.GetMediaList
            : (GetMediaList as List<Fragment$MediaFields>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes GetMediaList(
          Iterable<Fragment$MediaFields> Function(
                  Iterable<CopyWith$Fragment$MediaFields<Fragment$MediaFields>>)
              _fn) =>
      call(
          GetMediaList: _fn(
              _instance.GetMediaList.map((e) => CopyWith$Fragment$MediaFields(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetMediaList<TRes>
    implements CopyWith$Query$GetMediaList<TRes> {
  _CopyWithStubImpl$Query$GetMediaList(this._res);

  TRes _res;

  call({
    List<Fragment$MediaFields>? GetMediaList,
    String? $__typename,
  }) =>
      _res;
  GetMediaList(_fn) => _res;
}

const documentNodeQueryGetMediaList = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetMediaList'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'title')),
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
        name: NameNode(value: 'GetMediaList'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'title'),
            value: VariableNode(name: NameNode(value: 'title')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'MediaFields'),
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
  fragmentDefinitionMediaFields,
]);
Query$GetMediaList _parserFn$Query$GetMediaList(Map<String, dynamic> data) =>
    Query$GetMediaList.fromJson(data);
typedef OnQueryComplete$Query$GetMediaList = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetMediaList?,
);

class Options$Query$GetMediaList
    extends graphql.QueryOptions<Query$GetMediaList> {
  Options$Query$GetMediaList({
    String? operationName,
    Variables$Query$GetMediaList? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMediaList? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetMediaList? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables?.toJson() ?? {},
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
                    data == null ? null : _parserFn$Query$GetMediaList(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetMediaList,
          parserFn: _parserFn$Query$GetMediaList,
        );

  final OnQueryComplete$Query$GetMediaList? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetMediaList
    extends graphql.WatchQueryOptions<Query$GetMediaList> {
  WatchOptions$Query$GetMediaList({
    String? operationName,
    Variables$Query$GetMediaList? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMediaList? typedOptimisticResult,
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
          document: documentNodeQueryGetMediaList,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetMediaList,
        );
}

class FetchMoreOptions$Query$GetMediaList extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetMediaList({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$GetMediaList? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryGetMediaList,
        );
}

extension ClientExtension$Query$GetMediaList on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetMediaList>> query$GetMediaList(
          [Options$Query$GetMediaList? options]) async =>
      await this.query(options ?? Options$Query$GetMediaList());
  graphql.ObservableQuery<Query$GetMediaList> watchQuery$GetMediaList(
          [WatchOptions$Query$GetMediaList? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$GetMediaList());
  void writeQuery$GetMediaList({
    required Query$GetMediaList data,
    Variables$Query$GetMediaList? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryGetMediaList),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetMediaList? readQuery$GetMediaList({
    Variables$Query$GetMediaList? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetMediaList),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetMediaList.fromJson(result);
  }
}

class Variables$Mutation$AddMedia {
  factory Variables$Mutation$AddMedia({
    required Enum$MediaType type,
    required Enum$MediaStatus status,
    required String title,
    required String image,
    required List<String> genres,
    bool? isAdult,
    DateTime? startDate,
    DateTime? endDate,
  }) =>
      Variables$Mutation$AddMedia._({
        r'type': type,
        r'status': status,
        r'title': title,
        r'image': image,
        r'genres': genres,
        if (isAdult != null) r'isAdult': isAdult,
        if (startDate != null) r'startDate': startDate,
        if (endDate != null) r'endDate': endDate,
      });

  Variables$Mutation$AddMedia._(this._$data);

  factory Variables$Mutation$AddMedia.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$type = data['type'];
    result$data['type'] = fromJson$Enum$MediaType((l$type as String));
    final l$status = data['status'];
    result$data['status'] = fromJson$Enum$MediaStatus((l$status as String));
    final l$title = data['title'];
    result$data['title'] = (l$title as String);
    final l$image = data['image'];
    result$data['image'] = (l$image as String);
    final l$genres = data['genres'];
    result$data['genres'] =
        (l$genres as List<dynamic>).map((e) => (e as String)).toList();
    if (data.containsKey('isAdult')) {
      final l$isAdult = data['isAdult'];
      result$data['isAdult'] = (l$isAdult as bool?);
    }
    if (data.containsKey('startDate')) {
      final l$startDate = data['startDate'];
      result$data['startDate'] =
          l$startDate == null ? null : DateTime.parse((l$startDate as String));
    }
    if (data.containsKey('endDate')) {
      final l$endDate = data['endDate'];
      result$data['endDate'] =
          l$endDate == null ? null : DateTime.parse((l$endDate as String));
    }
    return Variables$Mutation$AddMedia._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$MediaType get type => (_$data['type'] as Enum$MediaType);
  Enum$MediaStatus get status => (_$data['status'] as Enum$MediaStatus);
  String get title => (_$data['title'] as String);
  String get image => (_$data['image'] as String);
  List<String> get genres => (_$data['genres'] as List<String>);
  bool? get isAdult => (_$data['isAdult'] as bool?);
  DateTime? get startDate => (_$data['startDate'] as DateTime?);
  DateTime? get endDate => (_$data['endDate'] as DateTime?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$type = type;
    result$data['type'] = toJson$Enum$MediaType(l$type);
    final l$status = status;
    result$data['status'] = toJson$Enum$MediaStatus(l$status);
    final l$title = title;
    result$data['title'] = l$title;
    final l$image = image;
    result$data['image'] = l$image;
    final l$genres = genres;
    result$data['genres'] = l$genres.map((e) => e).toList();
    if (_$data.containsKey('isAdult')) {
      final l$isAdult = isAdult;
      result$data['isAdult'] = l$isAdult;
    }
    if (_$data.containsKey('startDate')) {
      final l$startDate = startDate;
      result$data['startDate'] = l$startDate?.toIso8601String();
    }
    if (_$data.containsKey('endDate')) {
      final l$endDate = endDate;
      result$data['endDate'] = l$endDate?.toIso8601String();
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$AddMedia<Variables$Mutation$AddMedia>
      get copyWith => CopyWith$Variables$Mutation$AddMedia(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$AddMedia) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
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
    final l$genres = genres;
    final lOther$genres = other.genres;
    if (l$genres.length != lOther$genres.length) {
      return false;
    }
    for (int i = 0; i < l$genres.length; i++) {
      final l$genres$entry = l$genres[i];
      final lOther$genres$entry = lOther$genres[i];
      if (l$genres$entry != lOther$genres$entry) {
        return false;
      }
    }
    final l$isAdult = isAdult;
    final lOther$isAdult = other.isAdult;
    if (_$data.containsKey('isAdult') != other._$data.containsKey('isAdult')) {
      return false;
    }
    if (l$isAdult != lOther$isAdult) {
      return false;
    }
    final l$startDate = startDate;
    final lOther$startDate = other.startDate;
    if (_$data.containsKey('startDate') !=
        other._$data.containsKey('startDate')) {
      return false;
    }
    if (l$startDate != lOther$startDate) {
      return false;
    }
    final l$endDate = endDate;
    final lOther$endDate = other.endDate;
    if (_$data.containsKey('endDate') != other._$data.containsKey('endDate')) {
      return false;
    }
    if (l$endDate != lOther$endDate) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$type = type;
    final l$status = status;
    final l$title = title;
    final l$image = image;
    final l$genres = genres;
    final l$isAdult = isAdult;
    final l$startDate = startDate;
    final l$endDate = endDate;
    return Object.hashAll([
      l$type,
      l$status,
      l$title,
      l$image,
      Object.hashAll(l$genres.map((v) => v)),
      _$data.containsKey('isAdult') ? l$isAdult : const {},
      _$data.containsKey('startDate') ? l$startDate : const {},
      _$data.containsKey('endDate') ? l$endDate : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$AddMedia<TRes> {
  factory CopyWith$Variables$Mutation$AddMedia(
    Variables$Mutation$AddMedia instance,
    TRes Function(Variables$Mutation$AddMedia) then,
  ) = _CopyWithImpl$Variables$Mutation$AddMedia;

  factory CopyWith$Variables$Mutation$AddMedia.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$AddMedia;

  TRes call({
    Enum$MediaType? type,
    Enum$MediaStatus? status,
    String? title,
    String? image,
    List<String>? genres,
    bool? isAdult,
    DateTime? startDate,
    DateTime? endDate,
  });
}

class _CopyWithImpl$Variables$Mutation$AddMedia<TRes>
    implements CopyWith$Variables$Mutation$AddMedia<TRes> {
  _CopyWithImpl$Variables$Mutation$AddMedia(
    this._instance,
    this._then,
  );

  final Variables$Mutation$AddMedia _instance;

  final TRes Function(Variables$Mutation$AddMedia) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? type = _undefined,
    Object? status = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? genres = _undefined,
    Object? isAdult = _undefined,
    Object? startDate = _undefined,
    Object? endDate = _undefined,
  }) =>
      _then(Variables$Mutation$AddMedia._({
        ..._instance._$data,
        if (type != _undefined && type != null)
          'type': (type as Enum$MediaType),
        if (status != _undefined && status != null)
          'status': (status as Enum$MediaStatus),
        if (title != _undefined && title != null) 'title': (title as String),
        if (image != _undefined && image != null) 'image': (image as String),
        if (genres != _undefined && genres != null)
          'genres': (genres as List<String>),
        if (isAdult != _undefined) 'isAdult': (isAdult as bool?),
        if (startDate != _undefined) 'startDate': (startDate as DateTime?),
        if (endDate != _undefined) 'endDate': (endDate as DateTime?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$AddMedia<TRes>
    implements CopyWith$Variables$Mutation$AddMedia<TRes> {
  _CopyWithStubImpl$Variables$Mutation$AddMedia(this._res);

  TRes _res;

  call({
    Enum$MediaType? type,
    Enum$MediaStatus? status,
    String? title,
    String? image,
    List<String>? genres,
    bool? isAdult,
    DateTime? startDate,
    DateTime? endDate,
  }) =>
      _res;
}

class Mutation$AddMedia {
  Mutation$AddMedia({
    required this.AddMedia,
    this.$__typename = 'Mutation',
  });

  factory Mutation$AddMedia.fromJson(Map<String, dynamic> json) {
    final l$AddMedia = json['AddMedia'];
    final l$$__typename = json['__typename'];
    return Mutation$AddMedia(
      AddMedia:
          Fragment$MediaFields.fromJson((l$AddMedia as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$MediaFields AddMedia;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$AddMedia = AddMedia;
    _resultData['AddMedia'] = l$AddMedia.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$AddMedia = AddMedia;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$AddMedia,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$AddMedia) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$AddMedia = AddMedia;
    final lOther$AddMedia = other.AddMedia;
    if (l$AddMedia != lOther$AddMedia) {
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

extension UtilityExtension$Mutation$AddMedia on Mutation$AddMedia {
  CopyWith$Mutation$AddMedia<Mutation$AddMedia> get copyWith =>
      CopyWith$Mutation$AddMedia(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$AddMedia<TRes> {
  factory CopyWith$Mutation$AddMedia(
    Mutation$AddMedia instance,
    TRes Function(Mutation$AddMedia) then,
  ) = _CopyWithImpl$Mutation$AddMedia;

  factory CopyWith$Mutation$AddMedia.stub(TRes res) =
      _CopyWithStubImpl$Mutation$AddMedia;

  TRes call({
    Fragment$MediaFields? AddMedia,
    String? $__typename,
  });
  CopyWith$Fragment$MediaFields<TRes> get AddMedia;
}

class _CopyWithImpl$Mutation$AddMedia<TRes>
    implements CopyWith$Mutation$AddMedia<TRes> {
  _CopyWithImpl$Mutation$AddMedia(
    this._instance,
    this._then,
  );

  final Mutation$AddMedia _instance;

  final TRes Function(Mutation$AddMedia) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? AddMedia = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$AddMedia(
        AddMedia: AddMedia == _undefined || AddMedia == null
            ? _instance.AddMedia
            : (AddMedia as Fragment$MediaFields),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$MediaFields<TRes> get AddMedia {
    final local$AddMedia = _instance.AddMedia;
    return CopyWith$Fragment$MediaFields(
        local$AddMedia, (e) => call(AddMedia: e));
  }
}

class _CopyWithStubImpl$Mutation$AddMedia<TRes>
    implements CopyWith$Mutation$AddMedia<TRes> {
  _CopyWithStubImpl$Mutation$AddMedia(this._res);

  TRes _res;

  call({
    Fragment$MediaFields? AddMedia,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$MediaFields<TRes> get AddMedia =>
      CopyWith$Fragment$MediaFields.stub(_res);
}

const documentNodeMutationAddMedia = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'AddMedia'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'type')),
        type: NamedTypeNode(
          name: NameNode(value: 'MediaType'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'status')),
        type: NamedTypeNode(
          name: NameNode(value: 'MediaStatus'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'title')),
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
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'genres')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: true,
          ),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'isAdult')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'startDate')),
        type: NamedTypeNode(
          name: NameNode(value: 'DateTime'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'endDate')),
        type: NamedTypeNode(
          name: NameNode(value: 'DateTime'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'AddMedia'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'type'),
            value: VariableNode(name: NameNode(value: 'type')),
          ),
          ArgumentNode(
            name: NameNode(value: 'status'),
            value: VariableNode(name: NameNode(value: 'status')),
          ),
          ArgumentNode(
            name: NameNode(value: 'title'),
            value: VariableNode(name: NameNode(value: 'title')),
          ),
          ArgumentNode(
            name: NameNode(value: 'image'),
            value: VariableNode(name: NameNode(value: 'image')),
          ),
          ArgumentNode(
            name: NameNode(value: 'genres'),
            value: VariableNode(name: NameNode(value: 'genres')),
          ),
          ArgumentNode(
            name: NameNode(value: 'isAdult'),
            value: VariableNode(name: NameNode(value: 'isAdult')),
          ),
          ArgumentNode(
            name: NameNode(value: 'startDate'),
            value: VariableNode(name: NameNode(value: 'startDate')),
          ),
          ArgumentNode(
            name: NameNode(value: 'endDate'),
            value: VariableNode(name: NameNode(value: 'endDate')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'MediaFields'),
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
  fragmentDefinitionMediaFields,
]);
Mutation$AddMedia _parserFn$Mutation$AddMedia(Map<String, dynamic> data) =>
    Mutation$AddMedia.fromJson(data);
typedef OnMutationCompleted$Mutation$AddMedia = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$AddMedia?,
);

class Options$Mutation$AddMedia
    extends graphql.MutationOptions<Mutation$AddMedia> {
  Options$Mutation$AddMedia({
    String? operationName,
    required Variables$Mutation$AddMedia variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AddMedia? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$AddMedia? onCompleted,
    graphql.OnMutationUpdate<Mutation$AddMedia>? update,
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
                    data == null ? null : _parserFn$Mutation$AddMedia(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationAddMedia,
          parserFn: _parserFn$Mutation$AddMedia,
        );

  final OnMutationCompleted$Mutation$AddMedia? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$AddMedia
    extends graphql.WatchQueryOptions<Mutation$AddMedia> {
  WatchOptions$Mutation$AddMedia({
    String? operationName,
    required Variables$Mutation$AddMedia variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AddMedia? typedOptimisticResult,
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
          document: documentNodeMutationAddMedia,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$AddMedia,
        );
}

extension ClientExtension$Mutation$AddMedia on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$AddMedia>> mutate$AddMedia(
          Options$Mutation$AddMedia options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$AddMedia> watchMutation$AddMedia(
          WatchOptions$Mutation$AddMedia options) =>
      this.watchMutation(options);
}
