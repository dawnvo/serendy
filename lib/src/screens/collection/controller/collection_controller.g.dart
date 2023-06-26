// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$collectionControllerHash() =>
    r'3b44a56f531abdd6241f3234460506eade8a140a';

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

abstract class _$CollectionController
    extends BuildlessAutoDisposeAsyncNotifier<CollectionState> {
  late final String id;

  FutureOr<CollectionState> build(
    String id,
  );
}

/// See also [CollectionController].
@ProviderFor(CollectionController)
const collectionControllerProvider = CollectionControllerFamily();

/// See also [CollectionController].
class CollectionControllerFamily extends Family<AsyncValue<CollectionState>> {
  /// See also [CollectionController].
  const CollectionControllerFamily();

  /// See also [CollectionController].
  CollectionControllerProvider call(
    String id,
  ) {
    return CollectionControllerProvider(
      id,
    );
  }

  @override
  CollectionControllerProvider getProviderOverride(
    covariant CollectionControllerProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'collectionControllerProvider';
}

/// See also [CollectionController].
class CollectionControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    CollectionController, CollectionState> {
  /// See also [CollectionController].
  CollectionControllerProvider(
    this.id,
  ) : super.internal(
          () => CollectionController()..id = id,
          from: collectionControllerProvider,
          name: r'collectionControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$collectionControllerHash,
          dependencies: CollectionControllerFamily._dependencies,
          allTransitiveDependencies:
              CollectionControllerFamily._allTransitiveDependencies,
        );

  final String id;

  @override
  bool operator ==(Object other) {
    return other is CollectionControllerProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<CollectionState> runNotifierBuild(
    covariant CollectionController notifier,
  ) {
    return notifier.build(
      id,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
