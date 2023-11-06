// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dislike_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addDislikeHash() => r'41c190f76ccc5e34f7edbb5290d97328e4061293';

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

/// 관심없는 목록에 추가해요.
///
/// Copied from [addDislike].
@ProviderFor(addDislike)
const addDislikeProvider = AddDislikeFamily();

/// 관심없는 목록에 추가해요.
///
/// Copied from [addDislike].
class AddDislikeFamily extends Family<AsyncValue<Dislike?>> {
  /// 관심없는 목록에 추가해요.
  ///
  /// Copied from [addDislike].
  const AddDislikeFamily();

  /// 관심없는 목록에 추가해요.
  ///
  /// Copied from [addDislike].
  AddDislikeProvider call({
    required String mediaId,
  }) {
    return AddDislikeProvider(
      mediaId: mediaId,
    );
  }

  @override
  AddDislikeProvider getProviderOverride(
    covariant AddDislikeProvider provider,
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
  String? get name => r'addDislikeProvider';
}

/// 관심없는 목록에 추가해요.
///
/// Copied from [addDislike].
class AddDislikeProvider extends AutoDisposeFutureProvider<Dislike?> {
  /// 관심없는 목록에 추가해요.
  ///
  /// Copied from [addDislike].
  AddDislikeProvider({
    required String mediaId,
  }) : this._internal(
          (ref) => addDislike(
            ref as AddDislikeRef,
            mediaId: mediaId,
          ),
          from: addDislikeProvider,
          name: r'addDislikeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addDislikeHash,
          dependencies: AddDislikeFamily._dependencies,
          allTransitiveDependencies:
              AddDislikeFamily._allTransitiveDependencies,
          mediaId: mediaId,
        );

  AddDislikeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.mediaId,
  }) : super.internal();

  final String mediaId;

  @override
  Override overrideWith(
    FutureOr<Dislike?> Function(AddDislikeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddDislikeProvider._internal(
        (ref) => create(ref as AddDislikeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        mediaId: mediaId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Dislike?> createElement() {
    return _AddDislikeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddDislikeProvider && other.mediaId == mediaId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mediaId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddDislikeRef on AutoDisposeFutureProviderRef<Dislike?> {
  /// The parameter `mediaId` of this provider.
  String get mediaId;
}

class _AddDislikeProviderElement
    extends AutoDisposeFutureProviderElement<Dislike?> with AddDislikeRef {
  _AddDislikeProviderElement(super.provider);

  @override
  String get mediaId => (origin as AddDislikeProvider).mediaId;
}

String _$clearDislikesHash() => r'8ea84708c0d93a8d7479c8dd5e4678d5966eab3b';

/// 관심없는 목록을 초기화해요.
///
/// Copied from [clearDislikes].
@ProviderFor(clearDislikes)
final clearDislikesProvider = AutoDisposeFutureProvider<void>.internal(
  clearDislikes,
  name: r'clearDislikesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$clearDislikesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ClearDislikesRef = AutoDisposeFutureProviderRef<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
