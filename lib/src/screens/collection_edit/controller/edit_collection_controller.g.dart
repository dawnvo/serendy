// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_collection_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$editCollectionControllerHash() =>
    r'be493688a14b97e2c7a401c44b371163ec861d6d';

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

abstract class _$EditCollectionController
    extends BuildlessAutoDisposeNotifier<EditCollectionState> {
  late final Collection collection;

  EditCollectionState build(
    Collection collection,
  );
}

/// See also [EditCollectionController].
@ProviderFor(EditCollectionController)
const editCollectionControllerProvider = EditCollectionControllerFamily();

/// See also [EditCollectionController].
class EditCollectionControllerFamily extends Family<EditCollectionState> {
  /// See also [EditCollectionController].
  const EditCollectionControllerFamily();

  /// See also [EditCollectionController].
  EditCollectionControllerProvider call(
    Collection collection,
  ) {
    return EditCollectionControllerProvider(
      collection,
    );
  }

  @override
  EditCollectionControllerProvider getProviderOverride(
    covariant EditCollectionControllerProvider provider,
  ) {
    return call(
      provider.collection,
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
  String? get name => r'editCollectionControllerProvider';
}

/// See also [EditCollectionController].
class EditCollectionControllerProvider extends AutoDisposeNotifierProviderImpl<
    EditCollectionController, EditCollectionState> {
  /// See also [EditCollectionController].
  EditCollectionControllerProvider(
    this.collection,
  ) : super.internal(
          () => EditCollectionController()..collection = collection,
          from: editCollectionControllerProvider,
          name: r'editCollectionControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$editCollectionControllerHash,
          dependencies: EditCollectionControllerFamily._dependencies,
          allTransitiveDependencies:
              EditCollectionControllerFamily._allTransitiveDependencies,
        );

  final Collection collection;

  @override
  bool operator ==(Object other) {
    return other is EditCollectionControllerProvider &&
        other.collection == collection;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, collection.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  EditCollectionState runNotifierBuild(
    covariant EditCollectionController notifier,
  ) {
    return notifier.build(
      collection,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
