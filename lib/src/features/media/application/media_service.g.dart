// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchMediasHash() => r'd2c50427dff51cb905cf1364c36848be4082677a';

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

/// 작품을 검색해요.
///
/// Copied from [searchMedias].
@ProviderFor(searchMedias)
const searchMediasProvider = SearchMediasFamily();

/// 작품을 검색해요.
///
/// Copied from [searchMedias].
class SearchMediasFamily extends Family<AsyncValue<List<Media?>>> {
  /// 작품을 검색해요.
  ///
  /// Copied from [searchMedias].
  const SearchMediasFamily();

  /// 작품을 검색해요.
  ///
  /// Copied from [searchMedias].
  SearchMediasProvider call({
    required String query,
    int? page,
  }) {
    return SearchMediasProvider(
      query: query,
      page: page,
    );
  }

  @override
  SearchMediasProvider getProviderOverride(
    covariant SearchMediasProvider provider,
  ) {
    return call(
      query: provider.query,
      page: provider.page,
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
  String? get name => r'searchMediasProvider';
}

/// 작품을 검색해요.
///
/// Copied from [searchMedias].
class SearchMediasProvider extends AutoDisposeFutureProvider<List<Media?>> {
  /// 작품을 검색해요.
  ///
  /// Copied from [searchMedias].
  SearchMediasProvider({
    required String query,
    int? page,
  }) : this._internal(
          (ref) => searchMedias(
            ref as SearchMediasRef,
            query: query,
            page: page,
          ),
          from: searchMediasProvider,
          name: r'searchMediasProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchMediasHash,
          dependencies: SearchMediasFamily._dependencies,
          allTransitiveDependencies:
              SearchMediasFamily._allTransitiveDependencies,
          query: query,
          page: page,
        );

  SearchMediasProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
    required this.page,
  }) : super.internal();

  final String query;
  final int? page;

  @override
  Override overrideWith(
    FutureOr<List<Media?>> Function(SearchMediasRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchMediasProvider._internal(
        (ref) => create(ref as SearchMediasRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Media?>> createElement() {
    return _SearchMediasProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchMediasProvider &&
        other.query == query &&
        other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchMediasRef on AutoDisposeFutureProviderRef<List<Media?>> {
  /// The parameter `query` of this provider.
  String get query;

  /// The parameter `page` of this provider.
  int? get page;
}

class _SearchMediasProviderElement
    extends AutoDisposeFutureProviderElement<List<Media?>>
    with SearchMediasRef {
  _SearchMediasProviderElement(super.provider);

  @override
  String get query => (origin as SearchMediasProvider).query;
  @override
  int? get page => (origin as SearchMediasProvider).page;
}

String _$getMediasHash() => r'895d7f89bc42d4959f5f1e6afb67019708b6dcb6';

/// 작품 목록을 불러와요.
///
/// Copied from [getMedias].
@ProviderFor(getMedias)
const getMediasProvider = GetMediasFamily();

/// 작품 목록을 불러와요.
///
/// Copied from [getMedias].
class GetMediasFamily extends Family<AsyncValue<List<Media?>>> {
  /// 작품 목록을 불러와요.
  ///
  /// Copied from [getMedias].
  const GetMediasFamily();

  /// 작품 목록을 불러와요.
  ///
  /// Copied from [getMedias].
  GetMediasProvider call({
    int? page,
  }) {
    return GetMediasProvider(
      page: page,
    );
  }

  @override
  GetMediasProvider getProviderOverride(
    covariant GetMediasProvider provider,
  ) {
    return call(
      page: provider.page,
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
  String? get name => r'getMediasProvider';
}

/// 작품 목록을 불러와요.
///
/// Copied from [getMedias].
class GetMediasProvider extends AutoDisposeFutureProvider<List<Media?>> {
  /// 작품 목록을 불러와요.
  ///
  /// Copied from [getMedias].
  GetMediasProvider({
    int? page,
  }) : this._internal(
          (ref) => getMedias(
            ref as GetMediasRef,
            page: page,
          ),
          from: getMediasProvider,
          name: r'getMediasProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMediasHash,
          dependencies: GetMediasFamily._dependencies,
          allTransitiveDependencies: GetMediasFamily._allTransitiveDependencies,
          page: page,
        );

  GetMediasProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
  }) : super.internal();

  final int? page;

  @override
  Override overrideWith(
    FutureOr<List<Media?>> Function(GetMediasRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetMediasProvider._internal(
        (ref) => create(ref as GetMediasRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Media?>> createElement() {
    return _GetMediasProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMediasProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetMediasRef on AutoDisposeFutureProviderRef<List<Media?>> {
  /// The parameter `page` of this provider.
  int? get page;
}

class _GetMediasProviderElement
    extends AutoDisposeFutureProviderElement<List<Media?>> with GetMediasRef {
  _GetMediasProviderElement(super.provider);

  @override
  int? get page => (origin as GetMediasProvider).page;
}

String _$getMediaHash() => r'b32394427f9475e24132374f59ee1873faf72e70';

/// 작품 정보를 불러와요.
///
/// Copied from [getMedia].
@ProviderFor(getMedia)
const getMediaProvider = GetMediaFamily();

/// 작품 정보를 불러와요.
///
/// Copied from [getMedia].
class GetMediaFamily extends Family<AsyncValue<Media>> {
  /// 작품 정보를 불러와요.
  ///
  /// Copied from [getMedia].
  const GetMediaFamily();

  /// 작품 정보를 불러와요.
  ///
  /// Copied from [getMedia].
  GetMediaProvider call({
    required String id,
  }) {
    return GetMediaProvider(
      id: id,
    );
  }

  @override
  GetMediaProvider getProviderOverride(
    covariant GetMediaProvider provider,
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
  String? get name => r'getMediaProvider';
}

/// 작품 정보를 불러와요.
///
/// Copied from [getMedia].
class GetMediaProvider extends AutoDisposeFutureProvider<Media> {
  /// 작품 정보를 불러와요.
  ///
  /// Copied from [getMedia].
  GetMediaProvider({
    required String id,
  }) : this._internal(
          (ref) => getMedia(
            ref as GetMediaRef,
            id: id,
          ),
          from: getMediaProvider,
          name: r'getMediaProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMediaHash,
          dependencies: GetMediaFamily._dependencies,
          allTransitiveDependencies: GetMediaFamily._allTransitiveDependencies,
          id: id,
        );

  GetMediaProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Media> Function(GetMediaRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetMediaProvider._internal(
        (ref) => create(ref as GetMediaRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Media> createElement() {
    return _GetMediaProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMediaProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetMediaRef on AutoDisposeFutureProviderRef<Media> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetMediaProviderElement extends AutoDisposeFutureProviderElement<Media>
    with GetMediaRef {
  _GetMediaProviderElement(super.provider);

  @override
  String get id => (origin as GetMediaProvider).id;
}

String _$getMediaReactionsHash() => r'f89d4d67723b87f8af445ee87b3ac92ff3e49e82';

/// 작품 반응을 불러와요.
///
/// Copied from [getMediaReactions].
@ProviderFor(getMediaReactions)
const getMediaReactionsProvider = GetMediaReactionsFamily();

/// 작품 반응을 불러와요.
///
/// Copied from [getMediaReactions].
class GetMediaReactionsFamily extends Family<AsyncValue<List<MediaReaction?>>> {
  /// 작품 반응을 불러와요.
  ///
  /// Copied from [getMediaReactions].
  const GetMediaReactionsFamily();

  /// 작품 반응을 불러와요.
  ///
  /// Copied from [getMediaReactions].
  GetMediaReactionsProvider call({
    required String id,
  }) {
    return GetMediaReactionsProvider(
      id: id,
    );
  }

  @override
  GetMediaReactionsProvider getProviderOverride(
    covariant GetMediaReactionsProvider provider,
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
  String? get name => r'getMediaReactionsProvider';
}

/// 작품 반응을 불러와요.
///
/// Copied from [getMediaReactions].
class GetMediaReactionsProvider
    extends AutoDisposeFutureProvider<List<MediaReaction?>> {
  /// 작품 반응을 불러와요.
  ///
  /// Copied from [getMediaReactions].
  GetMediaReactionsProvider({
    required String id,
  }) : this._internal(
          (ref) => getMediaReactions(
            ref as GetMediaReactionsRef,
            id: id,
          ),
          from: getMediaReactionsProvider,
          name: r'getMediaReactionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMediaReactionsHash,
          dependencies: GetMediaReactionsFamily._dependencies,
          allTransitiveDependencies:
              GetMediaReactionsFamily._allTransitiveDependencies,
          id: id,
        );

  GetMediaReactionsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<List<MediaReaction?>> Function(GetMediaReactionsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetMediaReactionsProvider._internal(
        (ref) => create(ref as GetMediaReactionsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<MediaReaction?>> createElement() {
    return _GetMediaReactionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMediaReactionsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetMediaReactionsRef
    on AutoDisposeFutureProviderRef<List<MediaReaction?>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetMediaReactionsProviderElement
    extends AutoDisposeFutureProviderElement<List<MediaReaction?>>
    with GetMediaReactionsRef {
  _GetMediaReactionsProviderElement(super.provider);

  @override
  String get id => (origin as GetMediaReactionsProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
