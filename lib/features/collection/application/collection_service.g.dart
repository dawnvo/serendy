// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchMyCollectionsListHash() =>
    r'0230b94b22ffd6bc69248c575ee61727fbecd997';

/// 나의 컬렉션을 구독해요.
///
/// Copied from [watchMyCollectionsList].
@ProviderFor(watchMyCollectionsList)
final watchMyCollectionsListProvider =
    StreamProvider<List<Collection?>>.internal(
  watchMyCollectionsList,
  name: r'watchMyCollectionsListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchMyCollectionsListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WatchMyCollectionsListRef = StreamProviderRef<List<Collection?>>;
String _$fetchCollectionsListHash() =>
    r'ad277fe56029ee680ecf20d4705e40d3098c2229';

/// 여러 컬렉션을 불러와요.
///
/// Copied from [fetchCollectionsList].
@ProviderFor(fetchCollectionsList)
final fetchCollectionsListProvider =
    AutoDisposeFutureProvider<List<Collection?>>.internal(
  fetchCollectionsList,
  name: r'fetchCollectionsListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchCollectionsListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchCollectionsListRef
    = AutoDisposeFutureProviderRef<List<Collection?>>;
String _$fetchCollectionHash() => r'2e3eacb22cdb8a0d3bfeb8e58bc05a430d69b0f0';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef FetchCollectionRef = AutoDisposeFutureProviderRef<Collection>;

/// 컬렉션을 불러와요.
///
/// Copied from [fetchCollection].
@ProviderFor(fetchCollection)
const fetchCollectionProvider = FetchCollectionFamily();

/// 컬렉션을 불러와요.
///
/// Copied from [fetchCollection].
class FetchCollectionFamily extends Family<AsyncValue<Collection>> {
  /// 컬렉션을 불러와요.
  ///
  /// Copied from [fetchCollection].
  const FetchCollectionFamily();

  /// 컬렉션을 불러와요.
  ///
  /// Copied from [fetchCollection].
  FetchCollectionProvider call({
    required String id,
  }) {
    return FetchCollectionProvider(
      id: id,
    );
  }

  @override
  FetchCollectionProvider getProviderOverride(
    covariant FetchCollectionProvider provider,
  ) {
    return call(
      id: provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchCollectionProvider';
}

/// 컬렉션을 불러와요.
///
/// Copied from [fetchCollection].
class FetchCollectionProvider extends AutoDisposeFutureProvider<Collection> {
  /// 컬렉션을 불러와요.
  ///
  /// Copied from [fetchCollection].
  FetchCollectionProvider({
    required this.id,
  }) : super.internal(
          (ref) => fetchCollection(
            ref,
            id: id,
          ),
          from: fetchCollectionProvider,
          name: r'fetchCollectionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchCollectionHash,
          dependencies: FetchCollectionFamily._dependencies,
          allTransitiveDependencies:
              FetchCollectionFamily._allTransitiveDependencies,
        );

  final String id;

  @override
  bool operator ==(Object other) {
    return other is FetchCollectionProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$createCollectionHash() => r'c3082231ee5bcaf575e9999159ea3a5948622e41';
typedef CreateCollectionRef = AutoDisposeFutureProviderRef<Collection>;

/// 컬렉션을 만들어요.
///
/// Copied from [createCollection].
@ProviderFor(createCollection)
const createCollectionProvider = CreateCollectionFamily();

/// 컬렉션을 만들어요.
///
/// Copied from [createCollection].
class CreateCollectionFamily extends Family<AsyncValue<Collection>> {
  /// 컬렉션을 만들어요.
  ///
  /// Copied from [createCollection].
  const CreateCollectionFamily();

  /// 컬렉션을 만들어요.
  ///
  /// Copied from [createCollection].
  CreateCollectionProvider call({
    required String title,
  }) {
    return CreateCollectionProvider(
      title: title,
    );
  }

  @override
  CreateCollectionProvider getProviderOverride(
    covariant CreateCollectionProvider provider,
  ) {
    return call(
      title: provider.title,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'createCollectionProvider';
}

/// 컬렉션을 만들어요.
///
/// Copied from [createCollection].
class CreateCollectionProvider extends AutoDisposeFutureProvider<Collection> {
  /// 컬렉션을 만들어요.
  ///
  /// Copied from [createCollection].
  CreateCollectionProvider({
    required this.title,
  }) : super.internal(
          (ref) => createCollection(
            ref,
            title: title,
          ),
          from: createCollectionProvider,
          name: r'createCollectionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createCollectionHash,
          dependencies: CreateCollectionFamily._dependencies,
          allTransitiveDependencies:
              CreateCollectionFamily._allTransitiveDependencies,
        );

  final String title;

  @override
  bool operator ==(Object other) {
    return other is CreateCollectionProvider && other.title == title;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, title.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$editCollectionHash() => r'49ee16629b0521839f355bc715cd244a4520645a';
typedef EditCollectionRef = AutoDisposeFutureProviderRef<Collection>;

/// 컬렉션을 수정해요.
///
/// Copied from [editCollection].
@ProviderFor(editCollection)
const editCollectionProvider = EditCollectionFamily();

/// 컬렉션을 수정해요.
///
/// Copied from [editCollection].
class EditCollectionFamily extends Family<AsyncValue<Collection>> {
  /// 컬렉션을 수정해요.
  ///
  /// Copied from [editCollection].
  const EditCollectionFamily();

  /// 컬렉션을 수정해요.
  ///
  /// Copied from [editCollection].
  EditCollectionProvider call({
    required String id,
    required String title,
    String? description,
    String? image,
    bool? private,
  }) {
    return EditCollectionProvider(
      id: id,
      title: title,
      description: description,
      image: image,
      private: private,
    );
  }

  @override
  EditCollectionProvider getProviderOverride(
    covariant EditCollectionProvider provider,
  ) {
    return call(
      id: provider.id,
      title: provider.title,
      description: provider.description,
      image: provider.image,
      private: provider.private,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'editCollectionProvider';
}

/// 컬렉션을 수정해요.
///
/// Copied from [editCollection].
class EditCollectionProvider extends AutoDisposeFutureProvider<Collection> {
  /// 컬렉션을 수정해요.
  ///
  /// Copied from [editCollection].
  EditCollectionProvider({
    required this.id,
    required this.title,
    this.description,
    this.image,
    this.private,
  }) : super.internal(
          (ref) => editCollection(
            ref,
            id: id,
            title: title,
            description: description,
            image: image,
            private: private,
          ),
          from: editCollectionProvider,
          name: r'editCollectionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$editCollectionHash,
          dependencies: EditCollectionFamily._dependencies,
          allTransitiveDependencies:
              EditCollectionFamily._allTransitiveDependencies,
        );

  final String id;
  final String title;
  final String? description;
  final String? image;
  final bool? private;

  @override
  bool operator ==(Object other) {
    return other is EditCollectionProvider &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.image == image &&
        other.private == private;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, title.hashCode);
    hash = _SystemHash.combine(hash, description.hashCode);
    hash = _SystemHash.combine(hash, image.hashCode);
    hash = _SystemHash.combine(hash, private.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$removeCollectionHash() => r'094cbb9fec60751ed628aa62881ee00c41d949da';
typedef RemoveCollectionRef = AutoDisposeFutureProviderRef<void>;

/// 컬렉션을 제거해요.
///
/// Copied from [removeCollection].
@ProviderFor(removeCollection)
const removeCollectionProvider = RemoveCollectionFamily();

/// 컬렉션을 제거해요.
///
/// Copied from [removeCollection].
class RemoveCollectionFamily extends Family<AsyncValue<void>> {
  /// 컬렉션을 제거해요.
  ///
  /// Copied from [removeCollection].
  const RemoveCollectionFamily();

  /// 컬렉션을 제거해요.
  ///
  /// Copied from [removeCollection].
  RemoveCollectionProvider call({
    required String id,
  }) {
    return RemoveCollectionProvider(
      id: id,
    );
  }

  @override
  RemoveCollectionProvider getProviderOverride(
    covariant RemoveCollectionProvider provider,
  ) {
    return call(
      id: provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'removeCollectionProvider';
}

/// 컬렉션을 제거해요.
///
/// Copied from [removeCollection].
class RemoveCollectionProvider extends AutoDisposeFutureProvider<void> {
  /// 컬렉션을 제거해요.
  ///
  /// Copied from [removeCollection].
  RemoveCollectionProvider({
    required this.id,
  }) : super.internal(
          (ref) => removeCollection(
            ref,
            id: id,
          ),
          from: removeCollectionProvider,
          name: r'removeCollectionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$removeCollectionHash,
          dependencies: RemoveCollectionFamily._dependencies,
          allTransitiveDependencies:
              RemoveCollectionFamily._allTransitiveDependencies,
        );

  final String id;

  @override
  bool operator ==(Object other) {
    return other is RemoveCollectionProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$addCollectionItemHash() => r'77fadf693c684ef0ff07ceab0d5f6325ba703b29';
typedef AddCollectionItemRef = AutoDisposeFutureProviderRef<Collection>;

/// 컬렉션에 항목을 추가해요.
///
/// Copied from [addCollectionItem].
@ProviderFor(addCollectionItem)
const addCollectionItemProvider = AddCollectionItemFamily();

/// 컬렉션에 항목을 추가해요.
///
/// Copied from [addCollectionItem].
class AddCollectionItemFamily extends Family<AsyncValue<Collection>> {
  /// 컬렉션에 항목을 추가해요.
  ///
  /// Copied from [addCollectionItem].
  const AddCollectionItemFamily();

  /// 컬렉션에 항목을 추가해요.
  ///
  /// Copied from [addCollectionItem].
  AddCollectionItemProvider call({
    required String id,
    required String mediaId,
  }) {
    return AddCollectionItemProvider(
      id: id,
      mediaId: mediaId,
    );
  }

  @override
  AddCollectionItemProvider getProviderOverride(
    covariant AddCollectionItemProvider provider,
  ) {
    return call(
      id: provider.id,
      mediaId: provider.mediaId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'addCollectionItemProvider';
}

/// 컬렉션에 항목을 추가해요.
///
/// Copied from [addCollectionItem].
class AddCollectionItemProvider extends AutoDisposeFutureProvider<Collection> {
  /// 컬렉션에 항목을 추가해요.
  ///
  /// Copied from [addCollectionItem].
  AddCollectionItemProvider({
    required this.id,
    required this.mediaId,
  }) : super.internal(
          (ref) => addCollectionItem(
            ref,
            id: id,
            mediaId: mediaId,
          ),
          from: addCollectionItemProvider,
          name: r'addCollectionItemProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addCollectionItemHash,
          dependencies: AddCollectionItemFamily._dependencies,
          allTransitiveDependencies:
              AddCollectionItemFamily._allTransitiveDependencies,
        );

  final String id;
  final String mediaId;

  @override
  bool operator ==(Object other) {
    return other is AddCollectionItemProvider &&
        other.id == id &&
        other.mediaId == mediaId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, mediaId.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$deleteCollectionItemHash() =>
    r'39062d9930e8e225c4f90a1cfa34c9465de8c8c0';
typedef DeleteCollectionItemRef = AutoDisposeFutureProviderRef<Collection>;

/// 컬렉션 항목을 제거해요.
///
/// Copied from [deleteCollectionItem].
@ProviderFor(deleteCollectionItem)
const deleteCollectionItemProvider = DeleteCollectionItemFamily();

/// 컬렉션 항목을 제거해요.
///
/// Copied from [deleteCollectionItem].
class DeleteCollectionItemFamily extends Family<AsyncValue<Collection>> {
  /// 컬렉션 항목을 제거해요.
  ///
  /// Copied from [deleteCollectionItem].
  const DeleteCollectionItemFamily();

  /// 컬렉션 항목을 제거해요.
  ///
  /// Copied from [deleteCollectionItem].
  DeleteCollectionItemProvider call({
    required String id,
    required String mediaId,
  }) {
    return DeleteCollectionItemProvider(
      id: id,
      mediaId: mediaId,
    );
  }

  @override
  DeleteCollectionItemProvider getProviderOverride(
    covariant DeleteCollectionItemProvider provider,
  ) {
    return call(
      id: provider.id,
      mediaId: provider.mediaId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deleteCollectionItemProvider';
}

/// 컬렉션 항목을 제거해요.
///
/// Copied from [deleteCollectionItem].
class DeleteCollectionItemProvider
    extends AutoDisposeFutureProvider<Collection> {
  /// 컬렉션 항목을 제거해요.
  ///
  /// Copied from [deleteCollectionItem].
  DeleteCollectionItemProvider({
    required this.id,
    required this.mediaId,
  }) : super.internal(
          (ref) => deleteCollectionItem(
            ref,
            id: id,
            mediaId: mediaId,
          ),
          from: deleteCollectionItemProvider,
          name: r'deleteCollectionItemProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteCollectionItemHash,
          dependencies: DeleteCollectionItemFamily._dependencies,
          allTransitiveDependencies:
              DeleteCollectionItemFamily._allTransitiveDependencies,
        );

  final String id;
  final String mediaId;

  @override
  bool operator ==(Object other) {
    return other is DeleteCollectionItemProvider &&
        other.id == id &&
        other.mediaId == mediaId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, mediaId.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
