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

String _$addMediaHash() => r'7e9a717e195da422662751e79f9cc3192bef14f9';

/// 작품을 추가해요.
///
/// Copied from [addMedia].
@ProviderFor(addMedia)
const addMediaProvider = AddMediaFamily();

/// 작품을 추가해요.
///
/// Copied from [addMedia].
class AddMediaFamily extends Family<AsyncValue<void>> {
  /// 작품을 추가해요.
  ///
  /// Copied from [addMedia].
  const AddMediaFamily();

  /// 작품을 추가해요.
  ///
  /// Copied from [addMedia].
  AddMediaProvider call({
    required MediaStatus status,
    required MediaType type,
    required String title,
    required String image,
    required List<String> keywords,
    String? synopsis,
    DateTime? endDate,
    bool? isAdult,
    DateTime? startDate,
  }) {
    return AddMediaProvider(
      status: status,
      type: type,
      title: title,
      image: image,
      keywords: keywords,
      synopsis: synopsis,
      endDate: endDate,
      isAdult: isAdult,
      startDate: startDate,
    );
  }

  @override
  AddMediaProvider getProviderOverride(
    covariant AddMediaProvider provider,
  ) {
    return call(
      status: provider.status,
      type: provider.type,
      title: provider.title,
      image: provider.image,
      keywords: provider.keywords,
      synopsis: provider.synopsis,
      endDate: provider.endDate,
      isAdult: provider.isAdult,
      startDate: provider.startDate,
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
  String? get name => r'addMediaProvider';
}

/// 작품을 추가해요.
///
/// Copied from [addMedia].
class AddMediaProvider extends AutoDisposeFutureProvider<void> {
  /// 작품을 추가해요.
  ///
  /// Copied from [addMedia].
  AddMediaProvider({
    required MediaStatus status,
    required MediaType type,
    required String title,
    required String image,
    required List<String> keywords,
    String? synopsis,
    DateTime? endDate,
    bool? isAdult,
    DateTime? startDate,
  }) : this._internal(
          (ref) => addMedia(
            ref as AddMediaRef,
            status: status,
            type: type,
            title: title,
            image: image,
            keywords: keywords,
            synopsis: synopsis,
            endDate: endDate,
            isAdult: isAdult,
            startDate: startDate,
          ),
          from: addMediaProvider,
          name: r'addMediaProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addMediaHash,
          dependencies: AddMediaFamily._dependencies,
          allTransitiveDependencies: AddMediaFamily._allTransitiveDependencies,
          status: status,
          type: type,
          title: title,
          image: image,
          keywords: keywords,
          synopsis: synopsis,
          endDate: endDate,
          isAdult: isAdult,
          startDate: startDate,
        );

  AddMediaProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.status,
    required this.type,
    required this.title,
    required this.image,
    required this.keywords,
    required this.synopsis,
    required this.endDate,
    required this.isAdult,
    required this.startDate,
  }) : super.internal();

  final MediaStatus status;
  final MediaType type;
  final String title;
  final String image;
  final List<String> keywords;
  final String? synopsis;
  final DateTime? endDate;
  final bool? isAdult;
  final DateTime? startDate;

  @override
  Override overrideWith(
    FutureOr<void> Function(AddMediaRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddMediaProvider._internal(
        (ref) => create(ref as AddMediaRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        status: status,
        type: type,
        title: title,
        image: image,
        keywords: keywords,
        synopsis: synopsis,
        endDate: endDate,
        isAdult: isAdult,
        startDate: startDate,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _AddMediaProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddMediaProvider &&
        other.status == status &&
        other.type == type &&
        other.title == title &&
        other.image == image &&
        other.keywords == keywords &&
        other.synopsis == synopsis &&
        other.endDate == endDate &&
        other.isAdult == isAdult &&
        other.startDate == startDate;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);
    hash = _SystemHash.combine(hash, title.hashCode);
    hash = _SystemHash.combine(hash, image.hashCode);
    hash = _SystemHash.combine(hash, keywords.hashCode);
    hash = _SystemHash.combine(hash, synopsis.hashCode);
    hash = _SystemHash.combine(hash, endDate.hashCode);
    hash = _SystemHash.combine(hash, isAdult.hashCode);
    hash = _SystemHash.combine(hash, startDate.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddMediaRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `status` of this provider.
  MediaStatus get status;

  /// The parameter `type` of this provider.
  MediaType get type;

  /// The parameter `title` of this provider.
  String get title;

  /// The parameter `image` of this provider.
  String get image;

  /// The parameter `keywords` of this provider.
  List<String> get keywords;

  /// The parameter `synopsis` of this provider.
  String? get synopsis;

  /// The parameter `endDate` of this provider.
  DateTime? get endDate;

  /// The parameter `isAdult` of this provider.
  bool? get isAdult;

  /// The parameter `startDate` of this provider.
  DateTime? get startDate;
}

class _AddMediaProviderElement extends AutoDisposeFutureProviderElement<void>
    with AddMediaRef {
  _AddMediaProviderElement(super.provider);

  @override
  MediaStatus get status => (origin as AddMediaProvider).status;
  @override
  MediaType get type => (origin as AddMediaProvider).type;
  @override
  String get title => (origin as AddMediaProvider).title;
  @override
  String get image => (origin as AddMediaProvider).image;
  @override
  List<String> get keywords => (origin as AddMediaProvider).keywords;
  @override
  String? get synopsis => (origin as AddMediaProvider).synopsis;
  @override
  DateTime? get endDate => (origin as AddMediaProvider).endDate;
  @override
  bool? get isAdult => (origin as AddMediaProvider).isAdult;
  @override
  DateTime? get startDate => (origin as AddMediaProvider).startDate;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
