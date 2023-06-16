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
      addedAt: (l$addedAt as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String image;

  final String addedAt;

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
    _resultData['addedAt'] = l$addedAt;
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
    String? addedAt,
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
            : (addedAt as String),
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
    String? addedAt,
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
