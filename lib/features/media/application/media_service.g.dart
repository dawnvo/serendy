// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchMediaHash() => r'26b01c149ec1482c7d49231c4f42a7cdd75f2b6a';

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

typedef SearchMediaRef = AutoDisposeFutureProviderRef<List<Media?>>;

/// 미디어를 검색해요.
///
/// Copied from [searchMedia].
@ProviderFor(searchMedia)
const searchMediaProvider = SearchMediaFamily();

/// 미디어를 검색해요.
///
/// Copied from [searchMedia].
class SearchMediaFamily extends Family<AsyncValue<List<Media?>>> {
  /// 미디어를 검색해요.
  ///
  /// Copied from [searchMedia].
  const SearchMediaFamily();

  /// 미디어를 검색해요.
  ///
  /// Copied from [searchMedia].
  SearchMediaProvider call({
    String? title,
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

/// 미디어를 검색해요.
///
/// Copied from [searchMedia].
class SearchMediaProvider extends AutoDisposeFutureProvider<List<Media?>> {
  /// 미디어를 검색해요.
  ///
  /// Copied from [searchMedia].
  SearchMediaProvider({
    this.title,
  }) : super.internal(
          (ref) => searchMedia(
            ref,
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
        );

  final String? title;

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

String _$fetchMediaHash() => r'95a6c24a73137136ac0d1037fad04f8aa489eab6';
typedef FetchMediaRef = AutoDisposeFutureProviderRef<Media>;

/// 미디어 정보를 불러와요.
///
/// Copied from [fetchMedia].
@ProviderFor(fetchMedia)
const fetchMediaProvider = FetchMediaFamily();

/// 미디어 정보를 불러와요.
///
/// Copied from [fetchMedia].
class FetchMediaFamily extends Family<AsyncValue<Media>> {
  /// 미디어 정보를 불러와요.
  ///
  /// Copied from [fetchMedia].
  const FetchMediaFamily();

  /// 미디어 정보를 불러와요.
  ///
  /// Copied from [fetchMedia].
  FetchMediaProvider call({
    required String mediaId,
  }) {
    return FetchMediaProvider(
      mediaId: mediaId,
    );
  }

  @override
  FetchMediaProvider getProviderOverride(
    covariant FetchMediaProvider provider,
  ) {
    return call(
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
  String? get name => r'fetchMediaProvider';
}

/// 미디어 정보를 불러와요.
///
/// Copied from [fetchMedia].
class FetchMediaProvider extends AutoDisposeFutureProvider<Media> {
  /// 미디어 정보를 불러와요.
  ///
  /// Copied from [fetchMedia].
  FetchMediaProvider({
    required this.mediaId,
  }) : super.internal(
          (ref) => fetchMedia(
            ref,
            mediaId: mediaId,
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
        );

  final String mediaId;

  @override
  bool operator ==(Object other) {
    return other is FetchMediaProvider && other.mediaId == mediaId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mediaId.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$addMediaHash() => r'a7eb2729bc7053244de8942ce8cb7edace5e977d';
typedef AddMediaRef = AutoDisposeFutureProviderRef<void>;

/// 미디어를 추가해요.
///
/// Copied from [addMedia].
@ProviderFor(addMedia)
const addMediaProvider = AddMediaFamily();

/// 미디어를 추가해요.
///
/// Copied from [addMedia].
class AddMediaFamily extends Family<AsyncValue<void>> {
  /// 미디어를 추가해요.
  ///
  /// Copied from [addMedia].
  const AddMediaFamily();

  /// 미디어를 추가해요.
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

/// 미디어를 추가해요.
///
/// Copied from [addMedia].
class AddMediaProvider extends AutoDisposeFutureProvider<void> {
  /// 미디어를 추가해요.
  ///
  /// Copied from [addMedia].
  AddMediaProvider({
    required this.status,
    required this.type,
    required this.title,
    required this.image,
    required this.keywords,
    this.synopsis,
    this.endDate,
    this.isAdult,
    this.startDate,
  }) : super.internal(
          (ref) => addMedia(
            ref,
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
        );

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
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
