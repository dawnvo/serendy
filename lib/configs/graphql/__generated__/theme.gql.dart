import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Fragment$ThemeFields {
  Fragment$ThemeFields({
    required this.owner,
    required this.items,
    required this.id,
    required this.title,
    this.image,
    required this.private,
    required this.total,
    this.$__typename = 'Theme',
  });

  factory Fragment$ThemeFields.fromJson(Map<String, dynamic> json) {
    final l$owner = json['owner'];
    final l$items = json['items'];
    final l$id = json['id'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$private = json['private'];
    final l$total = json['total'];
    final l$$__typename = json['__typename'];
    return Fragment$ThemeFields(
      owner: Fragment$ThemeFields$owner.fromJson(
          (l$owner as Map<String, dynamic>)),
      items: (l$items as List<dynamic>)
          .map((e) =>
              Fragment$ThemeFields$items.fromJson((e as Map<String, dynamic>)))
          .toList(),
      id: (l$id as String),
      title: (l$title as String),
      image: (l$image as String?),
      private: (l$private as bool),
      total: (l$total as num).toDouble(),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$ThemeFields$owner owner;

  final List<Fragment$ThemeFields$items> items;

  final String id;

  final String title;

  final String? image;

  final bool private;

  final double total;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$owner = owner;
    _resultData['owner'] = l$owner.toJson();
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$private = private;
    _resultData['private'] = l$private;
    final l$total = total;
    _resultData['total'] = l$total;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$owner = owner;
    final l$items = items;
    final l$id = id;
    final l$title = title;
    final l$image = image;
    final l$private = private;
    final l$total = total;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$owner,
      Object.hashAll(l$items.map((v) => v)),
      l$id,
      l$title,
      l$image,
      l$private,
      l$total,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$ThemeFields) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$owner = owner;
    final lOther$owner = other.owner;
    if (l$owner != lOther$owner) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items.length != lOther$items.length) {
      return false;
    }
    for (int i = 0; i < l$items.length; i++) {
      final l$items$entry = l$items[i];
      final lOther$items$entry = lOther$items[i];
      if (l$items$entry != lOther$items$entry) {
        return false;
      }
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
    final l$private = private;
    final lOther$private = other.private;
    if (l$private != lOther$private) {
      return false;
    }
    final l$total = total;
    final lOther$total = other.total;
    if (l$total != lOther$total) {
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

extension UtilityExtension$Fragment$ThemeFields on Fragment$ThemeFields {
  CopyWith$Fragment$ThemeFields<Fragment$ThemeFields> get copyWith =>
      CopyWith$Fragment$ThemeFields(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$ThemeFields<TRes> {
  factory CopyWith$Fragment$ThemeFields(
    Fragment$ThemeFields instance,
    TRes Function(Fragment$ThemeFields) then,
  ) = _CopyWithImpl$Fragment$ThemeFields;

  factory CopyWith$Fragment$ThemeFields.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ThemeFields;

  TRes call({
    Fragment$ThemeFields$owner? owner,
    List<Fragment$ThemeFields$items>? items,
    String? id,
    String? title,
    String? image,
    bool? private,
    double? total,
    String? $__typename,
  });
  CopyWith$Fragment$ThemeFields$owner<TRes> get owner;
  TRes items(
      Iterable<Fragment$ThemeFields$items> Function(
              Iterable<
                  CopyWith$Fragment$ThemeFields$items<
                      Fragment$ThemeFields$items>>)
          _fn);
}

class _CopyWithImpl$Fragment$ThemeFields<TRes>
    implements CopyWith$Fragment$ThemeFields<TRes> {
  _CopyWithImpl$Fragment$ThemeFields(
    this._instance,
    this._then,
  );

  final Fragment$ThemeFields _instance;

  final TRes Function(Fragment$ThemeFields) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? owner = _undefined,
    Object? items = _undefined,
    Object? id = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? private = _undefined,
    Object? total = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$ThemeFields(
        owner: owner == _undefined || owner == null
            ? _instance.owner
            : (owner as Fragment$ThemeFields$owner),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<Fragment$ThemeFields$items>),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined ? _instance.image : (image as String?),
        private: private == _undefined || private == null
            ? _instance.private
            : (private as bool),
        total: total == _undefined || total == null
            ? _instance.total
            : (total as double),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$ThemeFields$owner<TRes> get owner {
    final local$owner = _instance.owner;
    return CopyWith$Fragment$ThemeFields$owner(
        local$owner, (e) => call(owner: e));
  }

  TRes items(
          Iterable<Fragment$ThemeFields$items> Function(
                  Iterable<
                      CopyWith$Fragment$ThemeFields$items<
                          Fragment$ThemeFields$items>>)
              _fn) =>
      call(
          items: _fn(
              _instance.items.map((e) => CopyWith$Fragment$ThemeFields$items(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Fragment$ThemeFields<TRes>
    implements CopyWith$Fragment$ThemeFields<TRes> {
  _CopyWithStubImpl$Fragment$ThemeFields(this._res);

  TRes _res;

  call({
    Fragment$ThemeFields$owner? owner,
    List<Fragment$ThemeFields$items>? items,
    String? id,
    String? title,
    String? image,
    bool? private,
    double? total,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$ThemeFields$owner<TRes> get owner =>
      CopyWith$Fragment$ThemeFields$owner.stub(_res);
  items(_fn) => _res;
}

const fragmentDefinitionThemeFields = FragmentDefinitionNode(
  name: NameNode(value: 'ThemeFields'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'Theme'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'owner'),
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
          name: NameNode(value: 'name'),
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
      name: NameNode(value: 'items'),
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
          name: NameNode(value: 'addedAt'),
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
      name: NameNode(value: 'private'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'total'),
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
const documentNodeFragmentThemeFields = DocumentNode(definitions: [
  fragmentDefinitionThemeFields,
]);

extension ClientExtension$Fragment$ThemeFields on graphql.GraphQLClient {
  void writeFragment$ThemeFields({
    required Fragment$ThemeFields data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'ThemeFields',
            document: documentNodeFragmentThemeFields,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$ThemeFields? readFragment$ThemeFields({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'ThemeFields',
          document: documentNodeFragmentThemeFields,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$ThemeFields.fromJson(result);
  }
}

class Fragment$ThemeFields$owner {
  Fragment$ThemeFields$owner({
    required this.id,
    required this.name,
    this.$__typename = 'ThemeOwner',
  });

  factory Fragment$ThemeFields$owner.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Fragment$ThemeFields$owner(
      id: (l$id as String),
      name: (l$name as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$ThemeFields$owner) ||
        runtimeType != other.runtimeType) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$ThemeFields$owner
    on Fragment$ThemeFields$owner {
  CopyWith$Fragment$ThemeFields$owner<Fragment$ThemeFields$owner>
      get copyWith => CopyWith$Fragment$ThemeFields$owner(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$ThemeFields$owner<TRes> {
  factory CopyWith$Fragment$ThemeFields$owner(
    Fragment$ThemeFields$owner instance,
    TRes Function(Fragment$ThemeFields$owner) then,
  ) = _CopyWithImpl$Fragment$ThemeFields$owner;

  factory CopyWith$Fragment$ThemeFields$owner.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ThemeFields$owner;

  TRes call({
    String? id,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$ThemeFields$owner<TRes>
    implements CopyWith$Fragment$ThemeFields$owner<TRes> {
  _CopyWithImpl$Fragment$ThemeFields$owner(
    this._instance,
    this._then,
  );

  final Fragment$ThemeFields$owner _instance;

  final TRes Function(Fragment$ThemeFields$owner) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$ThemeFields$owner(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$ThemeFields$owner<TRes>
    implements CopyWith$Fragment$ThemeFields$owner<TRes> {
  _CopyWithStubImpl$Fragment$ThemeFields$owner(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? $__typename,
  }) =>
      _res;
}

class Fragment$ThemeFields$items {
  Fragment$ThemeFields$items({
    required this.id,
    required this.title,
    required this.image,
    required this.addedAt,
    this.$__typename = 'ThemeItem',
  });

  factory Fragment$ThemeFields$items.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$image = json['image'];
    final l$addedAt = json['addedAt'];
    final l$$__typename = json['__typename'];
    return Fragment$ThemeFields$items(
      id: (l$id as String),
      title: (l$title as String),
      image: (l$image as String),
      addedAt: DateTime.parse((l$addedAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String image;

  final DateTime addedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$addedAt = addedAt;
    _resultData['addedAt'] = l$addedAt.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$image = image;
    final l$addedAt = addedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$image,
      l$addedAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$ThemeFields$items) ||
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
    final l$addedAt = addedAt;
    final lOther$addedAt = other.addedAt;
    if (l$addedAt != lOther$addedAt) {
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

extension UtilityExtension$Fragment$ThemeFields$items
    on Fragment$ThemeFields$items {
  CopyWith$Fragment$ThemeFields$items<Fragment$ThemeFields$items>
      get copyWith => CopyWith$Fragment$ThemeFields$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Fragment$ThemeFields$items<TRes> {
  factory CopyWith$Fragment$ThemeFields$items(
    Fragment$ThemeFields$items instance,
    TRes Function(Fragment$ThemeFields$items) then,
  ) = _CopyWithImpl$Fragment$ThemeFields$items;

  factory CopyWith$Fragment$ThemeFields$items.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ThemeFields$items;

  TRes call({
    String? id,
    String? title,
    String? image,
    DateTime? addedAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$ThemeFields$items<TRes>
    implements CopyWith$Fragment$ThemeFields$items<TRes> {
  _CopyWithImpl$Fragment$ThemeFields$items(
    this._instance,
    this._then,
  );

  final Fragment$ThemeFields$items _instance;

  final TRes Function(Fragment$ThemeFields$items) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? addedAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$ThemeFields$items(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        addedAt: addedAt == _undefined || addedAt == null
            ? _instance.addedAt
            : (addedAt as DateTime),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$ThemeFields$items<TRes>
    implements CopyWith$Fragment$ThemeFields$items<TRes> {
  _CopyWithStubImpl$Fragment$ThemeFields$items(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? image,
    DateTime? addedAt,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$GetTheme {
  factory Variables$Query$GetTheme({required String themeId}) =>
      Variables$Query$GetTheme._({
        r'themeId': themeId,
      });

  Variables$Query$GetTheme._(this._$data);

  factory Variables$Query$GetTheme.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$themeId = data['themeId'];
    result$data['themeId'] = (l$themeId as String);
    return Variables$Query$GetTheme._(result$data);
  }

  Map<String, dynamic> _$data;

  String get themeId => (_$data['themeId'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$themeId = themeId;
    result$data['themeId'] = l$themeId;
    return result$data;
  }

  CopyWith$Variables$Query$GetTheme<Variables$Query$GetTheme> get copyWith =>
      CopyWith$Variables$Query$GetTheme(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetTheme) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$themeId = themeId;
    final lOther$themeId = other.themeId;
    if (l$themeId != lOther$themeId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$themeId = themeId;
    return Object.hashAll([l$themeId]);
  }
}

abstract class CopyWith$Variables$Query$GetTheme<TRes> {
  factory CopyWith$Variables$Query$GetTheme(
    Variables$Query$GetTheme instance,
    TRes Function(Variables$Query$GetTheme) then,
  ) = _CopyWithImpl$Variables$Query$GetTheme;

  factory CopyWith$Variables$Query$GetTheme.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetTheme;

  TRes call({String? themeId});
}

class _CopyWithImpl$Variables$Query$GetTheme<TRes>
    implements CopyWith$Variables$Query$GetTheme<TRes> {
  _CopyWithImpl$Variables$Query$GetTheme(
    this._instance,
    this._then,
  );

  final Variables$Query$GetTheme _instance;

  final TRes Function(Variables$Query$GetTheme) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? themeId = _undefined}) =>
      _then(Variables$Query$GetTheme._({
        ..._instance._$data,
        if (themeId != _undefined && themeId != null)
          'themeId': (themeId as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetTheme<TRes>
    implements CopyWith$Variables$Query$GetTheme<TRes> {
  _CopyWithStubImpl$Variables$Query$GetTheme(this._res);

  TRes _res;

  call({String? themeId}) => _res;
}

class Query$GetTheme {
  Query$GetTheme({
    required this.GetTheme,
    this.$__typename = 'Query',
  });

  factory Query$GetTheme.fromJson(Map<String, dynamic> json) {
    final l$GetTheme = json['GetTheme'];
    final l$$__typename = json['__typename'];
    return Query$GetTheme(
      GetTheme:
          Fragment$ThemeFields.fromJson((l$GetTheme as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$ThemeFields GetTheme;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$GetTheme = GetTheme;
    _resultData['GetTheme'] = l$GetTheme.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$GetTheme = GetTheme;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$GetTheme,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetTheme) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$GetTheme = GetTheme;
    final lOther$GetTheme = other.GetTheme;
    if (l$GetTheme != lOther$GetTheme) {
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

extension UtilityExtension$Query$GetTheme on Query$GetTheme {
  CopyWith$Query$GetTheme<Query$GetTheme> get copyWith =>
      CopyWith$Query$GetTheme(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetTheme<TRes> {
  factory CopyWith$Query$GetTheme(
    Query$GetTheme instance,
    TRes Function(Query$GetTheme) then,
  ) = _CopyWithImpl$Query$GetTheme;

  factory CopyWith$Query$GetTheme.stub(TRes res) =
      _CopyWithStubImpl$Query$GetTheme;

  TRes call({
    Fragment$ThemeFields? GetTheme,
    String? $__typename,
  });
  CopyWith$Fragment$ThemeFields<TRes> get GetTheme;
}

class _CopyWithImpl$Query$GetTheme<TRes>
    implements CopyWith$Query$GetTheme<TRes> {
  _CopyWithImpl$Query$GetTheme(
    this._instance,
    this._then,
  );

  final Query$GetTheme _instance;

  final TRes Function(Query$GetTheme) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? GetTheme = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetTheme(
        GetTheme: GetTheme == _undefined || GetTheme == null
            ? _instance.GetTheme
            : (GetTheme as Fragment$ThemeFields),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Fragment$ThemeFields<TRes> get GetTheme {
    final local$GetTheme = _instance.GetTheme;
    return CopyWith$Fragment$ThemeFields(
        local$GetTheme, (e) => call(GetTheme: e));
  }
}

class _CopyWithStubImpl$Query$GetTheme<TRes>
    implements CopyWith$Query$GetTheme<TRes> {
  _CopyWithStubImpl$Query$GetTheme(this._res);

  TRes _res;

  call({
    Fragment$ThemeFields? GetTheme,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Fragment$ThemeFields<TRes> get GetTheme =>
      CopyWith$Fragment$ThemeFields.stub(_res);
}

const documentNodeQueryGetTheme = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetTheme'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'themeId')),
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
        name: NameNode(value: 'GetTheme'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'themeId'),
            value: VariableNode(name: NameNode(value: 'themeId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'ThemeFields'),
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
  fragmentDefinitionThemeFields,
]);
Query$GetTheme _parserFn$Query$GetTheme(Map<String, dynamic> data) =>
    Query$GetTheme.fromJson(data);
typedef OnQueryComplete$Query$GetTheme = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetTheme?,
);

class Options$Query$GetTheme extends graphql.QueryOptions<Query$GetTheme> {
  Options$Query$GetTheme({
    String? operationName,
    required Variables$Query$GetTheme variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetTheme? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetTheme? onComplete,
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
                    data == null ? null : _parserFn$Query$GetTheme(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetTheme,
          parserFn: _parserFn$Query$GetTheme,
        );

  final OnQueryComplete$Query$GetTheme? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetTheme
    extends graphql.WatchQueryOptions<Query$GetTheme> {
  WatchOptions$Query$GetTheme({
    String? operationName,
    required Variables$Query$GetTheme variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetTheme? typedOptimisticResult,
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
          document: documentNodeQueryGetTheme,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetTheme,
        );
}

class FetchMoreOptions$Query$GetTheme extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetTheme({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetTheme variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetTheme,
        );
}

extension ClientExtension$Query$GetTheme on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetTheme>> query$GetTheme(
          Options$Query$GetTheme options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$GetTheme> watchQuery$GetTheme(
          WatchOptions$Query$GetTheme options) =>
      this.watchQuery(options);
  void writeQuery$GetTheme({
    required Query$GetTheme data,
    required Variables$Query$GetTheme variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryGetTheme),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetTheme? readQuery$GetTheme({
    required Variables$Query$GetTheme variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetTheme),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetTheme.fromJson(result);
  }
}

class Variables$Query$GetThemeList {
  factory Variables$Query$GetThemeList({String? ownerId}) =>
      Variables$Query$GetThemeList._({
        if (ownerId != null) r'ownerId': ownerId,
      });

  Variables$Query$GetThemeList._(this._$data);

  factory Variables$Query$GetThemeList.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('ownerId')) {
      final l$ownerId = data['ownerId'];
      result$data['ownerId'] = (l$ownerId as String?);
    }
    return Variables$Query$GetThemeList._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get ownerId => (_$data['ownerId'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('ownerId')) {
      final l$ownerId = ownerId;
      result$data['ownerId'] = l$ownerId;
    }
    return result$data;
  }

  CopyWith$Variables$Query$GetThemeList<Variables$Query$GetThemeList>
      get copyWith => CopyWith$Variables$Query$GetThemeList(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetThemeList) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$ownerId = ownerId;
    final lOther$ownerId = other.ownerId;
    if (_$data.containsKey('ownerId') != other._$data.containsKey('ownerId')) {
      return false;
    }
    if (l$ownerId != lOther$ownerId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$ownerId = ownerId;
    return Object.hashAll(
        [_$data.containsKey('ownerId') ? l$ownerId : const {}]);
  }
}

abstract class CopyWith$Variables$Query$GetThemeList<TRes> {
  factory CopyWith$Variables$Query$GetThemeList(
    Variables$Query$GetThemeList instance,
    TRes Function(Variables$Query$GetThemeList) then,
  ) = _CopyWithImpl$Variables$Query$GetThemeList;

  factory CopyWith$Variables$Query$GetThemeList.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetThemeList;

  TRes call({String? ownerId});
}

class _CopyWithImpl$Variables$Query$GetThemeList<TRes>
    implements CopyWith$Variables$Query$GetThemeList<TRes> {
  _CopyWithImpl$Variables$Query$GetThemeList(
    this._instance,
    this._then,
  );

  final Variables$Query$GetThemeList _instance;

  final TRes Function(Variables$Query$GetThemeList) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? ownerId = _undefined}) =>
      _then(Variables$Query$GetThemeList._({
        ..._instance._$data,
        if (ownerId != _undefined) 'ownerId': (ownerId as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetThemeList<TRes>
    implements CopyWith$Variables$Query$GetThemeList<TRes> {
  _CopyWithStubImpl$Variables$Query$GetThemeList(this._res);

  TRes _res;

  call({String? ownerId}) => _res;
}

class Query$GetThemeList {
  Query$GetThemeList({
    required this.GetThemeList,
    this.$__typename = 'Query',
  });

  factory Query$GetThemeList.fromJson(Map<String, dynamic> json) {
    final l$GetThemeList = json['GetThemeList'];
    final l$$__typename = json['__typename'];
    return Query$GetThemeList(
      GetThemeList: (l$GetThemeList as List<dynamic>)
          .map(
              (e) => Fragment$ThemeFields.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$ThemeFields> GetThemeList;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$GetThemeList = GetThemeList;
    _resultData['GetThemeList'] =
        l$GetThemeList.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$GetThemeList = GetThemeList;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$GetThemeList.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetThemeList) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$GetThemeList = GetThemeList;
    final lOther$GetThemeList = other.GetThemeList;
    if (l$GetThemeList.length != lOther$GetThemeList.length) {
      return false;
    }
    for (int i = 0; i < l$GetThemeList.length; i++) {
      final l$GetThemeList$entry = l$GetThemeList[i];
      final lOther$GetThemeList$entry = lOther$GetThemeList[i];
      if (l$GetThemeList$entry != lOther$GetThemeList$entry) {
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

extension UtilityExtension$Query$GetThemeList on Query$GetThemeList {
  CopyWith$Query$GetThemeList<Query$GetThemeList> get copyWith =>
      CopyWith$Query$GetThemeList(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetThemeList<TRes> {
  factory CopyWith$Query$GetThemeList(
    Query$GetThemeList instance,
    TRes Function(Query$GetThemeList) then,
  ) = _CopyWithImpl$Query$GetThemeList;

  factory CopyWith$Query$GetThemeList.stub(TRes res) =
      _CopyWithStubImpl$Query$GetThemeList;

  TRes call({
    List<Fragment$ThemeFields>? GetThemeList,
    String? $__typename,
  });
  TRes GetThemeList(
      Iterable<Fragment$ThemeFields> Function(
              Iterable<CopyWith$Fragment$ThemeFields<Fragment$ThemeFields>>)
          _fn);
}

class _CopyWithImpl$Query$GetThemeList<TRes>
    implements CopyWith$Query$GetThemeList<TRes> {
  _CopyWithImpl$Query$GetThemeList(
    this._instance,
    this._then,
  );

  final Query$GetThemeList _instance;

  final TRes Function(Query$GetThemeList) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? GetThemeList = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetThemeList(
        GetThemeList: GetThemeList == _undefined || GetThemeList == null
            ? _instance.GetThemeList
            : (GetThemeList as List<Fragment$ThemeFields>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes GetThemeList(
          Iterable<Fragment$ThemeFields> Function(
                  Iterable<CopyWith$Fragment$ThemeFields<Fragment$ThemeFields>>)
              _fn) =>
      call(
          GetThemeList: _fn(
              _instance.GetThemeList.map((e) => CopyWith$Fragment$ThemeFields(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetThemeList<TRes>
    implements CopyWith$Query$GetThemeList<TRes> {
  _CopyWithStubImpl$Query$GetThemeList(this._res);

  TRes _res;

  call({
    List<Fragment$ThemeFields>? GetThemeList,
    String? $__typename,
  }) =>
      _res;
  GetThemeList(_fn) => _res;
}

const documentNodeQueryGetThemeList = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetThemeList'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'ownerId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'GetThemeList'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'ownerId'),
            value: VariableNode(name: NameNode(value: 'ownerId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'ThemeFields'),
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
  fragmentDefinitionThemeFields,
]);
Query$GetThemeList _parserFn$Query$GetThemeList(Map<String, dynamic> data) =>
    Query$GetThemeList.fromJson(data);
typedef OnQueryComplete$Query$GetThemeList = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetThemeList?,
);

class Options$Query$GetThemeList
    extends graphql.QueryOptions<Query$GetThemeList> {
  Options$Query$GetThemeList({
    String? operationName,
    Variables$Query$GetThemeList? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetThemeList? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetThemeList? onComplete,
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
                    data == null ? null : _parserFn$Query$GetThemeList(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetThemeList,
          parserFn: _parserFn$Query$GetThemeList,
        );

  final OnQueryComplete$Query$GetThemeList? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetThemeList
    extends graphql.WatchQueryOptions<Query$GetThemeList> {
  WatchOptions$Query$GetThemeList({
    String? operationName,
    Variables$Query$GetThemeList? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetThemeList? typedOptimisticResult,
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
          document: documentNodeQueryGetThemeList,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetThemeList,
        );
}

class FetchMoreOptions$Query$GetThemeList extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetThemeList({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$GetThemeList? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryGetThemeList,
        );
}

extension ClientExtension$Query$GetThemeList on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetThemeList>> query$GetThemeList(
          [Options$Query$GetThemeList? options]) async =>
      await this.query(options ?? Options$Query$GetThemeList());
  graphql.ObservableQuery<Query$GetThemeList> watchQuery$GetThemeList(
          [WatchOptions$Query$GetThemeList? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$GetThemeList());
  void writeQuery$GetThemeList({
    required Query$GetThemeList data,
    Variables$Query$GetThemeList? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryGetThemeList),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetThemeList? readQuery$GetThemeList({
    Variables$Query$GetThemeList? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetThemeList),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetThemeList.fromJson(result);
  }
}

class Variables$Mutation$CreateTheme {
  factory Variables$Mutation$CreateTheme({required String title}) =>
      Variables$Mutation$CreateTheme._({
        r'title': title,
      });

  Variables$Mutation$CreateTheme._(this._$data);

  factory Variables$Mutation$CreateTheme.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$title = data['title'];
    result$data['title'] = (l$title as String);
    return Variables$Mutation$CreateTheme._(result$data);
  }

  Map<String, dynamic> _$data;

  String get title => (_$data['title'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$title = title;
    result$data['title'] = l$title;
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateTheme<Variables$Mutation$CreateTheme>
      get copyWith => CopyWith$Variables$Mutation$CreateTheme(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$CreateTheme) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$title = title;
    return Object.hashAll([l$title]);
  }
}

abstract class CopyWith$Variables$Mutation$CreateTheme<TRes> {
  factory CopyWith$Variables$Mutation$CreateTheme(
    Variables$Mutation$CreateTheme instance,
    TRes Function(Variables$Mutation$CreateTheme) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateTheme;

  factory CopyWith$Variables$Mutation$CreateTheme.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateTheme;

  TRes call({String? title});
}

class _CopyWithImpl$Variables$Mutation$CreateTheme<TRes>
    implements CopyWith$Variables$Mutation$CreateTheme<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateTheme(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CreateTheme _instance;

  final TRes Function(Variables$Mutation$CreateTheme) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? title = _undefined}) =>
      _then(Variables$Mutation$CreateTheme._({
        ..._instance._$data,
        if (title != _undefined && title != null) 'title': (title as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$CreateTheme<TRes>
    implements CopyWith$Variables$Mutation$CreateTheme<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateTheme(this._res);

  TRes _res;

  call({String? title}) => _res;
}

class Mutation$CreateTheme {
  Mutation$CreateTheme({
    required this.CreateTheme,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateTheme.fromJson(Map<String, dynamic> json) {
    final l$CreateTheme = json['CreateTheme'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateTheme(
      CreateTheme: Mutation$CreateTheme$CreateTheme.fromJson(
          (l$CreateTheme as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateTheme$CreateTheme CreateTheme;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$CreateTheme = CreateTheme;
    _resultData['CreateTheme'] = l$CreateTheme.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$CreateTheme = CreateTheme;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$CreateTheme,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$CreateTheme) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$CreateTheme = CreateTheme;
    final lOther$CreateTheme = other.CreateTheme;
    if (l$CreateTheme != lOther$CreateTheme) {
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

extension UtilityExtension$Mutation$CreateTheme on Mutation$CreateTheme {
  CopyWith$Mutation$CreateTheme<Mutation$CreateTheme> get copyWith =>
      CopyWith$Mutation$CreateTheme(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CreateTheme<TRes> {
  factory CopyWith$Mutation$CreateTheme(
    Mutation$CreateTheme instance,
    TRes Function(Mutation$CreateTheme) then,
  ) = _CopyWithImpl$Mutation$CreateTheme;

  factory CopyWith$Mutation$CreateTheme.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateTheme;

  TRes call({
    Mutation$CreateTheme$CreateTheme? CreateTheme,
    String? $__typename,
  });
  CopyWith$Mutation$CreateTheme$CreateTheme<TRes> get CreateTheme;
}

class _CopyWithImpl$Mutation$CreateTheme<TRes>
    implements CopyWith$Mutation$CreateTheme<TRes> {
  _CopyWithImpl$Mutation$CreateTheme(
    this._instance,
    this._then,
  );

  final Mutation$CreateTheme _instance;

  final TRes Function(Mutation$CreateTheme) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? CreateTheme = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateTheme(
        CreateTheme: CreateTheme == _undefined || CreateTheme == null
            ? _instance.CreateTheme
            : (CreateTheme as Mutation$CreateTheme$CreateTheme),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$CreateTheme$CreateTheme<TRes> get CreateTheme {
    final local$CreateTheme = _instance.CreateTheme;
    return CopyWith$Mutation$CreateTheme$CreateTheme(
        local$CreateTheme, (e) => call(CreateTheme: e));
  }
}

class _CopyWithStubImpl$Mutation$CreateTheme<TRes>
    implements CopyWith$Mutation$CreateTheme<TRes> {
  _CopyWithStubImpl$Mutation$CreateTheme(this._res);

  TRes _res;

  call({
    Mutation$CreateTheme$CreateTheme? CreateTheme,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$CreateTheme$CreateTheme<TRes> get CreateTheme =>
      CopyWith$Mutation$CreateTheme$CreateTheme.stub(_res);
}

const documentNodeMutationCreateTheme = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CreateTheme'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'title')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'CreateTheme'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'title'),
            value: VariableNode(name: NameNode(value: 'title')),
          )
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
Mutation$CreateTheme _parserFn$Mutation$CreateTheme(
        Map<String, dynamic> data) =>
    Mutation$CreateTheme.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateTheme = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$CreateTheme?,
);

class Options$Mutation$CreateTheme
    extends graphql.MutationOptions<Mutation$CreateTheme> {
  Options$Mutation$CreateTheme({
    String? operationName,
    required Variables$Mutation$CreateTheme variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateTheme? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateTheme? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateTheme>? update,
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
                    data == null ? null : _parserFn$Mutation$CreateTheme(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateTheme,
          parserFn: _parserFn$Mutation$CreateTheme,
        );

  final OnMutationCompleted$Mutation$CreateTheme? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$CreateTheme
    extends graphql.WatchQueryOptions<Mutation$CreateTheme> {
  WatchOptions$Mutation$CreateTheme({
    String? operationName,
    required Variables$Mutation$CreateTheme variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateTheme? typedOptimisticResult,
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
          document: documentNodeMutationCreateTheme,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$CreateTheme,
        );
}

extension ClientExtension$Mutation$CreateTheme on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateTheme>> mutate$CreateTheme(
          Options$Mutation$CreateTheme options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$CreateTheme> watchMutation$CreateTheme(
          WatchOptions$Mutation$CreateTheme options) =>
      this.watchMutation(options);
}

class Mutation$CreateTheme$CreateTheme {
  Mutation$CreateTheme$CreateTheme({
    required this.id,
    this.$__typename = 'Theme',
  });

  factory Mutation$CreateTheme$CreateTheme.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateTheme$CreateTheme(
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
    if (!(other is Mutation$CreateTheme$CreateTheme) ||
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

extension UtilityExtension$Mutation$CreateTheme$CreateTheme
    on Mutation$CreateTheme$CreateTheme {
  CopyWith$Mutation$CreateTheme$CreateTheme<Mutation$CreateTheme$CreateTheme>
      get copyWith => CopyWith$Mutation$CreateTheme$CreateTheme(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateTheme$CreateTheme<TRes> {
  factory CopyWith$Mutation$CreateTheme$CreateTheme(
    Mutation$CreateTheme$CreateTheme instance,
    TRes Function(Mutation$CreateTheme$CreateTheme) then,
  ) = _CopyWithImpl$Mutation$CreateTheme$CreateTheme;

  factory CopyWith$Mutation$CreateTheme$CreateTheme.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateTheme$CreateTheme;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CreateTheme$CreateTheme<TRes>
    implements CopyWith$Mutation$CreateTheme$CreateTheme<TRes> {
  _CopyWithImpl$Mutation$CreateTheme$CreateTheme(
    this._instance,
    this._then,
  );

  final Mutation$CreateTheme$CreateTheme _instance;

  final TRes Function(Mutation$CreateTheme$CreateTheme) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateTheme$CreateTheme(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$CreateTheme$CreateTheme<TRes>
    implements CopyWith$Mutation$CreateTheme$CreateTheme<TRes> {
  _CopyWithStubImpl$Mutation$CreateTheme$CreateTheme(this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$EditTheme {
  factory Variables$Mutation$EditTheme({
    required String themeId,
    String? title,
    String? image,
    bool? private,
  }) =>
      Variables$Mutation$EditTheme._({
        r'themeId': themeId,
        if (title != null) r'title': title,
        if (image != null) r'image': image,
        if (private != null) r'private': private,
      });

  Variables$Mutation$EditTheme._(this._$data);

  factory Variables$Mutation$EditTheme.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$themeId = data['themeId'];
    result$data['themeId'] = (l$themeId as String);
    if (data.containsKey('title')) {
      final l$title = data['title'];
      result$data['title'] = (l$title as String?);
    }
    if (data.containsKey('image')) {
      final l$image = data['image'];
      result$data['image'] = (l$image as String?);
    }
    if (data.containsKey('private')) {
      final l$private = data['private'];
      result$data['private'] = (l$private as bool?);
    }
    return Variables$Mutation$EditTheme._(result$data);
  }

  Map<String, dynamic> _$data;

  String get themeId => (_$data['themeId'] as String);
  String? get title => (_$data['title'] as String?);
  String? get image => (_$data['image'] as String?);
  bool? get private => (_$data['private'] as bool?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$themeId = themeId;
    result$data['themeId'] = l$themeId;
    if (_$data.containsKey('title')) {
      final l$title = title;
      result$data['title'] = l$title;
    }
    if (_$data.containsKey('image')) {
      final l$image = image;
      result$data['image'] = l$image;
    }
    if (_$data.containsKey('private')) {
      final l$private = private;
      result$data['private'] = l$private;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$EditTheme<Variables$Mutation$EditTheme>
      get copyWith => CopyWith$Variables$Mutation$EditTheme(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$EditTheme) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$themeId = themeId;
    final lOther$themeId = other.themeId;
    if (l$themeId != lOther$themeId) {
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
    final l$image = image;
    final lOther$image = other.image;
    if (_$data.containsKey('image') != other._$data.containsKey('image')) {
      return false;
    }
    if (l$image != lOther$image) {
      return false;
    }
    final l$private = private;
    final lOther$private = other.private;
    if (_$data.containsKey('private') != other._$data.containsKey('private')) {
      return false;
    }
    if (l$private != lOther$private) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$themeId = themeId;
    final l$title = title;
    final l$image = image;
    final l$private = private;
    return Object.hashAll([
      l$themeId,
      _$data.containsKey('title') ? l$title : const {},
      _$data.containsKey('image') ? l$image : const {},
      _$data.containsKey('private') ? l$private : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$EditTheme<TRes> {
  factory CopyWith$Variables$Mutation$EditTheme(
    Variables$Mutation$EditTheme instance,
    TRes Function(Variables$Mutation$EditTheme) then,
  ) = _CopyWithImpl$Variables$Mutation$EditTheme;

  factory CopyWith$Variables$Mutation$EditTheme.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$EditTheme;

  TRes call({
    String? themeId,
    String? title,
    String? image,
    bool? private,
  });
}

class _CopyWithImpl$Variables$Mutation$EditTheme<TRes>
    implements CopyWith$Variables$Mutation$EditTheme<TRes> {
  _CopyWithImpl$Variables$Mutation$EditTheme(
    this._instance,
    this._then,
  );

  final Variables$Mutation$EditTheme _instance;

  final TRes Function(Variables$Mutation$EditTheme) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? themeId = _undefined,
    Object? title = _undefined,
    Object? image = _undefined,
    Object? private = _undefined,
  }) =>
      _then(Variables$Mutation$EditTheme._({
        ..._instance._$data,
        if (themeId != _undefined && themeId != null)
          'themeId': (themeId as String),
        if (title != _undefined) 'title': (title as String?),
        if (image != _undefined) 'image': (image as String?),
        if (private != _undefined) 'private': (private as bool?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$EditTheme<TRes>
    implements CopyWith$Variables$Mutation$EditTheme<TRes> {
  _CopyWithStubImpl$Variables$Mutation$EditTheme(this._res);

  TRes _res;

  call({
    String? themeId,
    String? title,
    String? image,
    bool? private,
  }) =>
      _res;
}

class Mutation$EditTheme {
  Mutation$EditTheme({
    required this.EditTheme,
    this.$__typename = 'Mutation',
  });

  factory Mutation$EditTheme.fromJson(Map<String, dynamic> json) {
    final l$EditTheme = json['EditTheme'];
    final l$$__typename = json['__typename'];
    return Mutation$EditTheme(
      EditTheme: Mutation$EditTheme$EditTheme.fromJson(
          (l$EditTheme as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$EditTheme$EditTheme EditTheme;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$EditTheme = EditTheme;
    _resultData['EditTheme'] = l$EditTheme.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$EditTheme = EditTheme;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$EditTheme,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$EditTheme) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$EditTheme = EditTheme;
    final lOther$EditTheme = other.EditTheme;
    if (l$EditTheme != lOther$EditTheme) {
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

extension UtilityExtension$Mutation$EditTheme on Mutation$EditTheme {
  CopyWith$Mutation$EditTheme<Mutation$EditTheme> get copyWith =>
      CopyWith$Mutation$EditTheme(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$EditTheme<TRes> {
  factory CopyWith$Mutation$EditTheme(
    Mutation$EditTheme instance,
    TRes Function(Mutation$EditTheme) then,
  ) = _CopyWithImpl$Mutation$EditTheme;

  factory CopyWith$Mutation$EditTheme.stub(TRes res) =
      _CopyWithStubImpl$Mutation$EditTheme;

  TRes call({
    Mutation$EditTheme$EditTheme? EditTheme,
    String? $__typename,
  });
  CopyWith$Mutation$EditTheme$EditTheme<TRes> get EditTheme;
}

class _CopyWithImpl$Mutation$EditTheme<TRes>
    implements CopyWith$Mutation$EditTheme<TRes> {
  _CopyWithImpl$Mutation$EditTheme(
    this._instance,
    this._then,
  );

  final Mutation$EditTheme _instance;

  final TRes Function(Mutation$EditTheme) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? EditTheme = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$EditTheme(
        EditTheme: EditTheme == _undefined || EditTheme == null
            ? _instance.EditTheme
            : (EditTheme as Mutation$EditTheme$EditTheme),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$EditTheme$EditTheme<TRes> get EditTheme {
    final local$EditTheme = _instance.EditTheme;
    return CopyWith$Mutation$EditTheme$EditTheme(
        local$EditTheme, (e) => call(EditTheme: e));
  }
}

class _CopyWithStubImpl$Mutation$EditTheme<TRes>
    implements CopyWith$Mutation$EditTheme<TRes> {
  _CopyWithStubImpl$Mutation$EditTheme(this._res);

  TRes _res;

  call({
    Mutation$EditTheme$EditTheme? EditTheme,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$EditTheme$EditTheme<TRes> get EditTheme =>
      CopyWith$Mutation$EditTheme$EditTheme.stub(_res);
}

const documentNodeMutationEditTheme = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'EditTheme'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'themeId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'title')),
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
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'private')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'EditTheme'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'themeId'),
            value: VariableNode(name: NameNode(value: 'themeId')),
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
            name: NameNode(value: 'private'),
            value: VariableNode(name: NameNode(value: 'private')),
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
Mutation$EditTheme _parserFn$Mutation$EditTheme(Map<String, dynamic> data) =>
    Mutation$EditTheme.fromJson(data);
typedef OnMutationCompleted$Mutation$EditTheme = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$EditTheme?,
);

class Options$Mutation$EditTheme
    extends graphql.MutationOptions<Mutation$EditTheme> {
  Options$Mutation$EditTheme({
    String? operationName,
    required Variables$Mutation$EditTheme variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$EditTheme? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$EditTheme? onCompleted,
    graphql.OnMutationUpdate<Mutation$EditTheme>? update,
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
                    data == null ? null : _parserFn$Mutation$EditTheme(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationEditTheme,
          parserFn: _parserFn$Mutation$EditTheme,
        );

  final OnMutationCompleted$Mutation$EditTheme? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$EditTheme
    extends graphql.WatchQueryOptions<Mutation$EditTheme> {
  WatchOptions$Mutation$EditTheme({
    String? operationName,
    required Variables$Mutation$EditTheme variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$EditTheme? typedOptimisticResult,
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
          document: documentNodeMutationEditTheme,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$EditTheme,
        );
}

extension ClientExtension$Mutation$EditTheme on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$EditTheme>> mutate$EditTheme(
          Options$Mutation$EditTheme options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$EditTheme> watchMutation$EditTheme(
          WatchOptions$Mutation$EditTheme options) =>
      this.watchMutation(options);
}

class Mutation$EditTheme$EditTheme {
  Mutation$EditTheme$EditTheme({
    required this.id,
    this.$__typename = 'Theme',
  });

  factory Mutation$EditTheme$EditTheme.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$EditTheme$EditTheme(
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
    if (!(other is Mutation$EditTheme$EditTheme) ||
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

extension UtilityExtension$Mutation$EditTheme$EditTheme
    on Mutation$EditTheme$EditTheme {
  CopyWith$Mutation$EditTheme$EditTheme<Mutation$EditTheme$EditTheme>
      get copyWith => CopyWith$Mutation$EditTheme$EditTheme(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$EditTheme$EditTheme<TRes> {
  factory CopyWith$Mutation$EditTheme$EditTheme(
    Mutation$EditTheme$EditTheme instance,
    TRes Function(Mutation$EditTheme$EditTheme) then,
  ) = _CopyWithImpl$Mutation$EditTheme$EditTheme;

  factory CopyWith$Mutation$EditTheme$EditTheme.stub(TRes res) =
      _CopyWithStubImpl$Mutation$EditTheme$EditTheme;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$EditTheme$EditTheme<TRes>
    implements CopyWith$Mutation$EditTheme$EditTheme<TRes> {
  _CopyWithImpl$Mutation$EditTheme$EditTheme(
    this._instance,
    this._then,
  );

  final Mutation$EditTheme$EditTheme _instance;

  final TRes Function(Mutation$EditTheme$EditTheme) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$EditTheme$EditTheme(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$EditTheme$EditTheme<TRes>
    implements CopyWith$Mutation$EditTheme$EditTheme<TRes> {
  _CopyWithStubImpl$Mutation$EditTheme$EditTheme(this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$RemoveTheme {
  factory Variables$Mutation$RemoveTheme({required String themeId}) =>
      Variables$Mutation$RemoveTheme._({
        r'themeId': themeId,
      });

  Variables$Mutation$RemoveTheme._(this._$data);

  factory Variables$Mutation$RemoveTheme.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$themeId = data['themeId'];
    result$data['themeId'] = (l$themeId as String);
    return Variables$Mutation$RemoveTheme._(result$data);
  }

  Map<String, dynamic> _$data;

  String get themeId => (_$data['themeId'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$themeId = themeId;
    result$data['themeId'] = l$themeId;
    return result$data;
  }

  CopyWith$Variables$Mutation$RemoveTheme<Variables$Mutation$RemoveTheme>
      get copyWith => CopyWith$Variables$Mutation$RemoveTheme(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$RemoveTheme) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$themeId = themeId;
    final lOther$themeId = other.themeId;
    if (l$themeId != lOther$themeId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$themeId = themeId;
    return Object.hashAll([l$themeId]);
  }
}

abstract class CopyWith$Variables$Mutation$RemoveTheme<TRes> {
  factory CopyWith$Variables$Mutation$RemoveTheme(
    Variables$Mutation$RemoveTheme instance,
    TRes Function(Variables$Mutation$RemoveTheme) then,
  ) = _CopyWithImpl$Variables$Mutation$RemoveTheme;

  factory CopyWith$Variables$Mutation$RemoveTheme.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$RemoveTheme;

  TRes call({String? themeId});
}

class _CopyWithImpl$Variables$Mutation$RemoveTheme<TRes>
    implements CopyWith$Variables$Mutation$RemoveTheme<TRes> {
  _CopyWithImpl$Variables$Mutation$RemoveTheme(
    this._instance,
    this._then,
  );

  final Variables$Mutation$RemoveTheme _instance;

  final TRes Function(Variables$Mutation$RemoveTheme) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? themeId = _undefined}) =>
      _then(Variables$Mutation$RemoveTheme._({
        ..._instance._$data,
        if (themeId != _undefined && themeId != null)
          'themeId': (themeId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$RemoveTheme<TRes>
    implements CopyWith$Variables$Mutation$RemoveTheme<TRes> {
  _CopyWithStubImpl$Variables$Mutation$RemoveTheme(this._res);

  TRes _res;

  call({String? themeId}) => _res;
}

class Mutation$RemoveTheme {
  Mutation$RemoveTheme({
    required this.RemoveTheme,
    this.$__typename = 'Mutation',
  });

  factory Mutation$RemoveTheme.fromJson(Map<String, dynamic> json) {
    final l$RemoveTheme = json['RemoveTheme'];
    final l$$__typename = json['__typename'];
    return Mutation$RemoveTheme(
      RemoveTheme: (l$RemoveTheme as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool RemoveTheme;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$RemoveTheme = RemoveTheme;
    _resultData['RemoveTheme'] = l$RemoveTheme;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$RemoveTheme = RemoveTheme;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$RemoveTheme,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$RemoveTheme) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$RemoveTheme = RemoveTheme;
    final lOther$RemoveTheme = other.RemoveTheme;
    if (l$RemoveTheme != lOther$RemoveTheme) {
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

extension UtilityExtension$Mutation$RemoveTheme on Mutation$RemoveTheme {
  CopyWith$Mutation$RemoveTheme<Mutation$RemoveTheme> get copyWith =>
      CopyWith$Mutation$RemoveTheme(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$RemoveTheme<TRes> {
  factory CopyWith$Mutation$RemoveTheme(
    Mutation$RemoveTheme instance,
    TRes Function(Mutation$RemoveTheme) then,
  ) = _CopyWithImpl$Mutation$RemoveTheme;

  factory CopyWith$Mutation$RemoveTheme.stub(TRes res) =
      _CopyWithStubImpl$Mutation$RemoveTheme;

  TRes call({
    bool? RemoveTheme,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$RemoveTheme<TRes>
    implements CopyWith$Mutation$RemoveTheme<TRes> {
  _CopyWithImpl$Mutation$RemoveTheme(
    this._instance,
    this._then,
  );

  final Mutation$RemoveTheme _instance;

  final TRes Function(Mutation$RemoveTheme) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? RemoveTheme = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$RemoveTheme(
        RemoveTheme: RemoveTheme == _undefined || RemoveTheme == null
            ? _instance.RemoveTheme
            : (RemoveTheme as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$RemoveTheme<TRes>
    implements CopyWith$Mutation$RemoveTheme<TRes> {
  _CopyWithStubImpl$Mutation$RemoveTheme(this._res);

  TRes _res;

  call({
    bool? RemoveTheme,
    String? $__typename,
  }) =>
      _res;
}

const documentNodeMutationRemoveTheme = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'RemoveTheme'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'themeId')),
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
        name: NameNode(value: 'RemoveTheme'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'themeId'),
            value: VariableNode(name: NameNode(value: 'themeId')),
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
Mutation$RemoveTheme _parserFn$Mutation$RemoveTheme(
        Map<String, dynamic> data) =>
    Mutation$RemoveTheme.fromJson(data);
typedef OnMutationCompleted$Mutation$RemoveTheme = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$RemoveTheme?,
);

class Options$Mutation$RemoveTheme
    extends graphql.MutationOptions<Mutation$RemoveTheme> {
  Options$Mutation$RemoveTheme({
    String? operationName,
    required Variables$Mutation$RemoveTheme variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$RemoveTheme? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$RemoveTheme? onCompleted,
    graphql.OnMutationUpdate<Mutation$RemoveTheme>? update,
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
                    data == null ? null : _parserFn$Mutation$RemoveTheme(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationRemoveTheme,
          parserFn: _parserFn$Mutation$RemoveTheme,
        );

  final OnMutationCompleted$Mutation$RemoveTheme? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$RemoveTheme
    extends graphql.WatchQueryOptions<Mutation$RemoveTheme> {
  WatchOptions$Mutation$RemoveTheme({
    String? operationName,
    required Variables$Mutation$RemoveTheme variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$RemoveTheme? typedOptimisticResult,
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
          document: documentNodeMutationRemoveTheme,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$RemoveTheme,
        );
}

extension ClientExtension$Mutation$RemoveTheme on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$RemoveTheme>> mutate$RemoveTheme(
          Options$Mutation$RemoveTheme options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$RemoveTheme> watchMutation$RemoveTheme(
          WatchOptions$Mutation$RemoveTheme options) =>
      this.watchMutation(options);
}

class Variables$Mutation$AddThemeItem {
  factory Variables$Mutation$AddThemeItem({
    required String themeId,
    required String mediaId,
  }) =>
      Variables$Mutation$AddThemeItem._({
        r'themeId': themeId,
        r'mediaId': mediaId,
      });

  Variables$Mutation$AddThemeItem._(this._$data);

  factory Variables$Mutation$AddThemeItem.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$themeId = data['themeId'];
    result$data['themeId'] = (l$themeId as String);
    final l$mediaId = data['mediaId'];
    result$data['mediaId'] = (l$mediaId as String);
    return Variables$Mutation$AddThemeItem._(result$data);
  }

  Map<String, dynamic> _$data;

  String get themeId => (_$data['themeId'] as String);
  String get mediaId => (_$data['mediaId'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$themeId = themeId;
    result$data['themeId'] = l$themeId;
    final l$mediaId = mediaId;
    result$data['mediaId'] = l$mediaId;
    return result$data;
  }

  CopyWith$Variables$Mutation$AddThemeItem<Variables$Mutation$AddThemeItem>
      get copyWith => CopyWith$Variables$Mutation$AddThemeItem(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$AddThemeItem) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$themeId = themeId;
    final lOther$themeId = other.themeId;
    if (l$themeId != lOther$themeId) {
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
    final l$themeId = themeId;
    final l$mediaId = mediaId;
    return Object.hashAll([
      l$themeId,
      l$mediaId,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$AddThemeItem<TRes> {
  factory CopyWith$Variables$Mutation$AddThemeItem(
    Variables$Mutation$AddThemeItem instance,
    TRes Function(Variables$Mutation$AddThemeItem) then,
  ) = _CopyWithImpl$Variables$Mutation$AddThemeItem;

  factory CopyWith$Variables$Mutation$AddThemeItem.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$AddThemeItem;

  TRes call({
    String? themeId,
    String? mediaId,
  });
}

class _CopyWithImpl$Variables$Mutation$AddThemeItem<TRes>
    implements CopyWith$Variables$Mutation$AddThemeItem<TRes> {
  _CopyWithImpl$Variables$Mutation$AddThemeItem(
    this._instance,
    this._then,
  );

  final Variables$Mutation$AddThemeItem _instance;

  final TRes Function(Variables$Mutation$AddThemeItem) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? themeId = _undefined,
    Object? mediaId = _undefined,
  }) =>
      _then(Variables$Mutation$AddThemeItem._({
        ..._instance._$data,
        if (themeId != _undefined && themeId != null)
          'themeId': (themeId as String),
        if (mediaId != _undefined && mediaId != null)
          'mediaId': (mediaId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$AddThemeItem<TRes>
    implements CopyWith$Variables$Mutation$AddThemeItem<TRes> {
  _CopyWithStubImpl$Variables$Mutation$AddThemeItem(this._res);

  TRes _res;

  call({
    String? themeId,
    String? mediaId,
  }) =>
      _res;
}

class Mutation$AddThemeItem {
  Mutation$AddThemeItem({
    required this.AddThemeItem,
    this.$__typename = 'Mutation',
  });

  factory Mutation$AddThemeItem.fromJson(Map<String, dynamic> json) {
    final l$AddThemeItem = json['AddThemeItem'];
    final l$$__typename = json['__typename'];
    return Mutation$AddThemeItem(
      AddThemeItem: Mutation$AddThemeItem$AddThemeItem.fromJson(
          (l$AddThemeItem as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$AddThemeItem$AddThemeItem AddThemeItem;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$AddThemeItem = AddThemeItem;
    _resultData['AddThemeItem'] = l$AddThemeItem.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$AddThemeItem = AddThemeItem;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$AddThemeItem,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$AddThemeItem) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$AddThemeItem = AddThemeItem;
    final lOther$AddThemeItem = other.AddThemeItem;
    if (l$AddThemeItem != lOther$AddThemeItem) {
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

extension UtilityExtension$Mutation$AddThemeItem on Mutation$AddThemeItem {
  CopyWith$Mutation$AddThemeItem<Mutation$AddThemeItem> get copyWith =>
      CopyWith$Mutation$AddThemeItem(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$AddThemeItem<TRes> {
  factory CopyWith$Mutation$AddThemeItem(
    Mutation$AddThemeItem instance,
    TRes Function(Mutation$AddThemeItem) then,
  ) = _CopyWithImpl$Mutation$AddThemeItem;

  factory CopyWith$Mutation$AddThemeItem.stub(TRes res) =
      _CopyWithStubImpl$Mutation$AddThemeItem;

  TRes call({
    Mutation$AddThemeItem$AddThemeItem? AddThemeItem,
    String? $__typename,
  });
  CopyWith$Mutation$AddThemeItem$AddThemeItem<TRes> get AddThemeItem;
}

class _CopyWithImpl$Mutation$AddThemeItem<TRes>
    implements CopyWith$Mutation$AddThemeItem<TRes> {
  _CopyWithImpl$Mutation$AddThemeItem(
    this._instance,
    this._then,
  );

  final Mutation$AddThemeItem _instance;

  final TRes Function(Mutation$AddThemeItem) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? AddThemeItem = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$AddThemeItem(
        AddThemeItem: AddThemeItem == _undefined || AddThemeItem == null
            ? _instance.AddThemeItem
            : (AddThemeItem as Mutation$AddThemeItem$AddThemeItem),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$AddThemeItem$AddThemeItem<TRes> get AddThemeItem {
    final local$AddThemeItem = _instance.AddThemeItem;
    return CopyWith$Mutation$AddThemeItem$AddThemeItem(
        local$AddThemeItem, (e) => call(AddThemeItem: e));
  }
}

class _CopyWithStubImpl$Mutation$AddThemeItem<TRes>
    implements CopyWith$Mutation$AddThemeItem<TRes> {
  _CopyWithStubImpl$Mutation$AddThemeItem(this._res);

  TRes _res;

  call({
    Mutation$AddThemeItem$AddThemeItem? AddThemeItem,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$AddThemeItem$AddThemeItem<TRes> get AddThemeItem =>
      CopyWith$Mutation$AddThemeItem$AddThemeItem.stub(_res);
}

const documentNodeMutationAddThemeItem = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'AddThemeItem'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'themeId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'mediaId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'AddThemeItem'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'themeId'),
            value: VariableNode(name: NameNode(value: 'themeId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'mediaId'),
            value: VariableNode(name: NameNode(value: 'mediaId')),
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
Mutation$AddThemeItem _parserFn$Mutation$AddThemeItem(
        Map<String, dynamic> data) =>
    Mutation$AddThemeItem.fromJson(data);
typedef OnMutationCompleted$Mutation$AddThemeItem = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$AddThemeItem?,
);

class Options$Mutation$AddThemeItem
    extends graphql.MutationOptions<Mutation$AddThemeItem> {
  Options$Mutation$AddThemeItem({
    String? operationName,
    required Variables$Mutation$AddThemeItem variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AddThemeItem? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$AddThemeItem? onCompleted,
    graphql.OnMutationUpdate<Mutation$AddThemeItem>? update,
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
                    data == null ? null : _parserFn$Mutation$AddThemeItem(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationAddThemeItem,
          parserFn: _parserFn$Mutation$AddThemeItem,
        );

  final OnMutationCompleted$Mutation$AddThemeItem? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$AddThemeItem
    extends graphql.WatchQueryOptions<Mutation$AddThemeItem> {
  WatchOptions$Mutation$AddThemeItem({
    String? operationName,
    required Variables$Mutation$AddThemeItem variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AddThemeItem? typedOptimisticResult,
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
          document: documentNodeMutationAddThemeItem,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$AddThemeItem,
        );
}

extension ClientExtension$Mutation$AddThemeItem on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$AddThemeItem>> mutate$AddThemeItem(
          Options$Mutation$AddThemeItem options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$AddThemeItem> watchMutation$AddThemeItem(
          WatchOptions$Mutation$AddThemeItem options) =>
      this.watchMutation(options);
}

class Mutation$AddThemeItem$AddThemeItem {
  Mutation$AddThemeItem$AddThemeItem({
    required this.id,
    this.$__typename = 'Theme',
  });

  factory Mutation$AddThemeItem$AddThemeItem.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$AddThemeItem$AddThemeItem(
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
    if (!(other is Mutation$AddThemeItem$AddThemeItem) ||
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

extension UtilityExtension$Mutation$AddThemeItem$AddThemeItem
    on Mutation$AddThemeItem$AddThemeItem {
  CopyWith$Mutation$AddThemeItem$AddThemeItem<
          Mutation$AddThemeItem$AddThemeItem>
      get copyWith => CopyWith$Mutation$AddThemeItem$AddThemeItem(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$AddThemeItem$AddThemeItem<TRes> {
  factory CopyWith$Mutation$AddThemeItem$AddThemeItem(
    Mutation$AddThemeItem$AddThemeItem instance,
    TRes Function(Mutation$AddThemeItem$AddThemeItem) then,
  ) = _CopyWithImpl$Mutation$AddThemeItem$AddThemeItem;

  factory CopyWith$Mutation$AddThemeItem$AddThemeItem.stub(TRes res) =
      _CopyWithStubImpl$Mutation$AddThemeItem$AddThemeItem;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$AddThemeItem$AddThemeItem<TRes>
    implements CopyWith$Mutation$AddThemeItem$AddThemeItem<TRes> {
  _CopyWithImpl$Mutation$AddThemeItem$AddThemeItem(
    this._instance,
    this._then,
  );

  final Mutation$AddThemeItem$AddThemeItem _instance;

  final TRes Function(Mutation$AddThemeItem$AddThemeItem) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$AddThemeItem$AddThemeItem(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$AddThemeItem$AddThemeItem<TRes>
    implements CopyWith$Mutation$AddThemeItem$AddThemeItem<TRes> {
  _CopyWithStubImpl$Mutation$AddThemeItem$AddThemeItem(this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$DeleteThemeItem {
  factory Variables$Mutation$DeleteThemeItem({
    required String themeId,
    required String mediaId,
  }) =>
      Variables$Mutation$DeleteThemeItem._({
        r'themeId': themeId,
        r'mediaId': mediaId,
      });

  Variables$Mutation$DeleteThemeItem._(this._$data);

  factory Variables$Mutation$DeleteThemeItem.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$themeId = data['themeId'];
    result$data['themeId'] = (l$themeId as String);
    final l$mediaId = data['mediaId'];
    result$data['mediaId'] = (l$mediaId as String);
    return Variables$Mutation$DeleteThemeItem._(result$data);
  }

  Map<String, dynamic> _$data;

  String get themeId => (_$data['themeId'] as String);
  String get mediaId => (_$data['mediaId'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$themeId = themeId;
    result$data['themeId'] = l$themeId;
    final l$mediaId = mediaId;
    result$data['mediaId'] = l$mediaId;
    return result$data;
  }

  CopyWith$Variables$Mutation$DeleteThemeItem<
          Variables$Mutation$DeleteThemeItem>
      get copyWith => CopyWith$Variables$Mutation$DeleteThemeItem(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$DeleteThemeItem) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$themeId = themeId;
    final lOther$themeId = other.themeId;
    if (l$themeId != lOther$themeId) {
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
    final l$themeId = themeId;
    final l$mediaId = mediaId;
    return Object.hashAll([
      l$themeId,
      l$mediaId,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$DeleteThemeItem<TRes> {
  factory CopyWith$Variables$Mutation$DeleteThemeItem(
    Variables$Mutation$DeleteThemeItem instance,
    TRes Function(Variables$Mutation$DeleteThemeItem) then,
  ) = _CopyWithImpl$Variables$Mutation$DeleteThemeItem;

  factory CopyWith$Variables$Mutation$DeleteThemeItem.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeleteThemeItem;

  TRes call({
    String? themeId,
    String? mediaId,
  });
}

class _CopyWithImpl$Variables$Mutation$DeleteThemeItem<TRes>
    implements CopyWith$Variables$Mutation$DeleteThemeItem<TRes> {
  _CopyWithImpl$Variables$Mutation$DeleteThemeItem(
    this._instance,
    this._then,
  );

  final Variables$Mutation$DeleteThemeItem _instance;

  final TRes Function(Variables$Mutation$DeleteThemeItem) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? themeId = _undefined,
    Object? mediaId = _undefined,
  }) =>
      _then(Variables$Mutation$DeleteThemeItem._({
        ..._instance._$data,
        if (themeId != _undefined && themeId != null)
          'themeId': (themeId as String),
        if (mediaId != _undefined && mediaId != null)
          'mediaId': (mediaId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$DeleteThemeItem<TRes>
    implements CopyWith$Variables$Mutation$DeleteThemeItem<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeleteThemeItem(this._res);

  TRes _res;

  call({
    String? themeId,
    String? mediaId,
  }) =>
      _res;
}

class Mutation$DeleteThemeItem {
  Mutation$DeleteThemeItem({
    required this.DeleteThemeItem,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DeleteThemeItem.fromJson(Map<String, dynamic> json) {
    final l$DeleteThemeItem = json['DeleteThemeItem'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteThemeItem(
      DeleteThemeItem: Mutation$DeleteThemeItem$DeleteThemeItem.fromJson(
          (l$DeleteThemeItem as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeleteThemeItem$DeleteThemeItem DeleteThemeItem;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$DeleteThemeItem = DeleteThemeItem;
    _resultData['DeleteThemeItem'] = l$DeleteThemeItem.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$DeleteThemeItem = DeleteThemeItem;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$DeleteThemeItem,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$DeleteThemeItem) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$DeleteThemeItem = DeleteThemeItem;
    final lOther$DeleteThemeItem = other.DeleteThemeItem;
    if (l$DeleteThemeItem != lOther$DeleteThemeItem) {
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

extension UtilityExtension$Mutation$DeleteThemeItem
    on Mutation$DeleteThemeItem {
  CopyWith$Mutation$DeleteThemeItem<Mutation$DeleteThemeItem> get copyWith =>
      CopyWith$Mutation$DeleteThemeItem(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$DeleteThemeItem<TRes> {
  factory CopyWith$Mutation$DeleteThemeItem(
    Mutation$DeleteThemeItem instance,
    TRes Function(Mutation$DeleteThemeItem) then,
  ) = _CopyWithImpl$Mutation$DeleteThemeItem;

  factory CopyWith$Mutation$DeleteThemeItem.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteThemeItem;

  TRes call({
    Mutation$DeleteThemeItem$DeleteThemeItem? DeleteThemeItem,
    String? $__typename,
  });
  CopyWith$Mutation$DeleteThemeItem$DeleteThemeItem<TRes> get DeleteThemeItem;
}

class _CopyWithImpl$Mutation$DeleteThemeItem<TRes>
    implements CopyWith$Mutation$DeleteThemeItem<TRes> {
  _CopyWithImpl$Mutation$DeleteThemeItem(
    this._instance,
    this._then,
  );

  final Mutation$DeleteThemeItem _instance;

  final TRes Function(Mutation$DeleteThemeItem) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? DeleteThemeItem = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeleteThemeItem(
        DeleteThemeItem:
            DeleteThemeItem == _undefined || DeleteThemeItem == null
                ? _instance.DeleteThemeItem
                : (DeleteThemeItem as Mutation$DeleteThemeItem$DeleteThemeItem),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$DeleteThemeItem$DeleteThemeItem<TRes> get DeleteThemeItem {
    final local$DeleteThemeItem = _instance.DeleteThemeItem;
    return CopyWith$Mutation$DeleteThemeItem$DeleteThemeItem(
        local$DeleteThemeItem, (e) => call(DeleteThemeItem: e));
  }
}

class _CopyWithStubImpl$Mutation$DeleteThemeItem<TRes>
    implements CopyWith$Mutation$DeleteThemeItem<TRes> {
  _CopyWithStubImpl$Mutation$DeleteThemeItem(this._res);

  TRes _res;

  call({
    Mutation$DeleteThemeItem$DeleteThemeItem? DeleteThemeItem,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$DeleteThemeItem$DeleteThemeItem<TRes> get DeleteThemeItem =>
      CopyWith$Mutation$DeleteThemeItem$DeleteThemeItem.stub(_res);
}

const documentNodeMutationDeleteThemeItem = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'DeleteThemeItem'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'themeId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'mediaId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'DeleteThemeItem'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'themeId'),
            value: VariableNode(name: NameNode(value: 'themeId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'mediaId'),
            value: VariableNode(name: NameNode(value: 'mediaId')),
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
Mutation$DeleteThemeItem _parserFn$Mutation$DeleteThemeItem(
        Map<String, dynamic> data) =>
    Mutation$DeleteThemeItem.fromJson(data);
typedef OnMutationCompleted$Mutation$DeleteThemeItem = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$DeleteThemeItem?,
);

class Options$Mutation$DeleteThemeItem
    extends graphql.MutationOptions<Mutation$DeleteThemeItem> {
  Options$Mutation$DeleteThemeItem({
    String? operationName,
    required Variables$Mutation$DeleteThemeItem variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteThemeItem? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteThemeItem? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteThemeItem>? update,
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
                        : _parserFn$Mutation$DeleteThemeItem(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteThemeItem,
          parserFn: _parserFn$Mutation$DeleteThemeItem,
        );

  final OnMutationCompleted$Mutation$DeleteThemeItem? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$DeleteThemeItem
    extends graphql.WatchQueryOptions<Mutation$DeleteThemeItem> {
  WatchOptions$Mutation$DeleteThemeItem({
    String? operationName,
    required Variables$Mutation$DeleteThemeItem variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteThemeItem? typedOptimisticResult,
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
          document: documentNodeMutationDeleteThemeItem,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$DeleteThemeItem,
        );
}

extension ClientExtension$Mutation$DeleteThemeItem on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeleteThemeItem>> mutate$DeleteThemeItem(
          Options$Mutation$DeleteThemeItem options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$DeleteThemeItem>
      watchMutation$DeleteThemeItem(
              WatchOptions$Mutation$DeleteThemeItem options) =>
          this.watchMutation(options);
}

class Mutation$DeleteThemeItem$DeleteThemeItem {
  Mutation$DeleteThemeItem$DeleteThemeItem({
    required this.id,
    this.$__typename = 'Theme',
  });

  factory Mutation$DeleteThemeItem$DeleteThemeItem.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteThemeItem$DeleteThemeItem(
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
    if (!(other is Mutation$DeleteThemeItem$DeleteThemeItem) ||
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

extension UtilityExtension$Mutation$DeleteThemeItem$DeleteThemeItem
    on Mutation$DeleteThemeItem$DeleteThemeItem {
  CopyWith$Mutation$DeleteThemeItem$DeleteThemeItem<
          Mutation$DeleteThemeItem$DeleteThemeItem>
      get copyWith => CopyWith$Mutation$DeleteThemeItem$DeleteThemeItem(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$DeleteThemeItem$DeleteThemeItem<TRes> {
  factory CopyWith$Mutation$DeleteThemeItem$DeleteThemeItem(
    Mutation$DeleteThemeItem$DeleteThemeItem instance,
    TRes Function(Mutation$DeleteThemeItem$DeleteThemeItem) then,
  ) = _CopyWithImpl$Mutation$DeleteThemeItem$DeleteThemeItem;

  factory CopyWith$Mutation$DeleteThemeItem$DeleteThemeItem.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteThemeItem$DeleteThemeItem;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$DeleteThemeItem$DeleteThemeItem<TRes>
    implements CopyWith$Mutation$DeleteThemeItem$DeleteThemeItem<TRes> {
  _CopyWithImpl$Mutation$DeleteThemeItem$DeleteThemeItem(
    this._instance,
    this._then,
  );

  final Mutation$DeleteThemeItem$DeleteThemeItem _instance;

  final TRes Function(Mutation$DeleteThemeItem$DeleteThemeItem) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeleteThemeItem$DeleteThemeItem(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$DeleteThemeItem$DeleteThemeItem<TRes>
    implements CopyWith$Mutation$DeleteThemeItem$DeleteThemeItem<TRes> {
  _CopyWithStubImpl$Mutation$DeleteThemeItem$DeleteThemeItem(this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}
