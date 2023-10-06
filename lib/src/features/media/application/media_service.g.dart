// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchMediaHash() => r'7e8b8f00d45c62950b7a8889d5a628a168aa3040';

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
/// Copied from [searchMedia].
@ProviderFor(searchMedia)
const searchMediaProvider = SearchMediaFamily();

/// 작품을 검색해요.
///
/// Copied from [searchMedia].
class SearchMediaFamily extends Family<AsyncValue<List<Media?>>> {
  /// 작품을 검색해요.
  ///
  /// Copied from [searchMedia].
  const SearchMediaFamily();

  /// 작품을 검색해요.
  ///
  /// Copied from [searchMedia].
  SearchMediaProvider call({
    required String title,
  }) {
    return SearchMediaProvider(
      title: title,
    );
  }

  @override
  SearchMediaProvider getProviderOverride(
    covariant SearchMediaProvider provider,
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
  String? get name => r'searchMediaProvider';
}

/// 작품을 검색해요.
///
/// Copied from [searchMedia].
class SearchMediaProvider extends AutoDisposeFutureProvider<List<Media?>> {
  /// 작품을 검색해요.
  ///
  /// Copied from [searchMedia].
  SearchMediaProvider({
    required String title,
  }) : this._internal(
          (ref) => searchMedia(
            ref as SearchMediaRef,
            title: title,
          ),
          from: searchMediaProvider,
          name: r'searchMediaProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchMediaHash,
          dependencies: SearchMediaFamily._dependencies,
          allTransitiveDependencies:
              SearchMediaFamily._allTransitiveDependencies,
          title: title,
        );

  SearchMediaProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.title,
  }) : super.internal();

  final String title;

  @override
  Override overrideWith(
    FutureOr<List<Media?>> Function(SearchMediaRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchMediaProvider._internal(
        (ref) => create(ref as SearchMediaRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        title: title,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Media?>> createElement() {
    return _SearchMediaProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchMediaProvider && other.title == title;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, title.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchMediaRef on AutoDisposeFutureProviderRef<List<Media?>> {
  /// The parameter `title` of this provider.
  String get title;
}

class _SearchMediaProviderElement
    extends AutoDisposeFutureProviderElement<List<Media?>> with SearchMediaRef {
  _SearchMediaProviderElement(super.provider);

  @override
  String get title => (origin as SearchMediaProvider).title;
}

String _$fetchMediaListHash() => r'f951c09ff9a7c2f70f6f43aed19c4580d238470a';

/// 작품 목록을 불러와요.
///
/// Copied from [fetchMediaList].
@ProviderFor(fetchMediaList)
final fetchMediaListProvider = AutoDisposeFutureProvider<List<Media?>>.internal(
  fetchMediaList,
  name: r'fetchMediaListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchMediaListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchMediaListRef = AutoDisposeFutureProviderRef<List<Media?>>;
String _$fetchMediaHash() => r'e9637e0e7fc278310cdad9b3586184fdc5161362';

/// 작품 정보를 불러와요.
///
/// Copied from [fetchMedia].
@ProviderFor(fetchMedia)
const fetchMediaProvider = FetchMediaFamily();

/// 작품 정보를 불러와요.
///
/// Copied from [fetchMedia].
class FetchMediaFamily extends Family<AsyncValue<Media>> {
  /// 작품 정보를 불러와요.
  ///
  /// Copied from [fetchMedia].
  const FetchMediaFamily();

  /// 작품 정보를 불러와요.
  ///
  /// Copied from [fetchMedia].
  FetchMediaProvider call({
    required String id,
  }) {
    return FetchMediaProvider(
      id: id,
    );
  }

  @override
  FetchMediaProvider getProviderOverride(
    covariant FetchMediaProvider provider,
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
  String? get name => r'fetchMediaProvider';
}

/// 작품 정보를 불러와요.
///
/// Copied from [fetchMedia].
class FetchMediaProvider extends AutoDisposeFutureProvider<Media> {
  /// 작품 정보를 불러와요.
  ///
  /// Copied from [fetchMedia].
  FetchMediaProvider({
    required String id,
  }) : this._internal(
          (ref) => fetchMedia(
            ref as FetchMediaRef,
            id: id,
          ),
          from: fetchMediaProvider,
          name: r'fetchMediaProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchMediaHash,
          dependencies: FetchMediaFamily._dependencies,
          allTransitiveDependencies:
              FetchMediaFamily._allTransitiveDependencies,
          id: id,
        );

  FetchMediaProvider._internal(
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
    FutureOr<Media> Function(FetchMediaRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchMediaProvider._internal(
        (ref) => create(ref as FetchMediaRef),
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
    return _FetchMediaProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchMediaProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchMediaRef on AutoDisposeFutureProviderRef<Media> {
  /// The parameter `id` of this provider.
  String get id;
}

class _FetchMediaProviderElement extends AutoDisposeFutureProviderElement<Media>
    with FetchMediaRef {
  _FetchMediaProviderElement(super.provider);

  @override
  String get id => (origin as FetchMediaProvider).id;
}

String _$addMediaHash() => r'a7eb2729bc7053244de8942ce8cb7edace5e977d';

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
