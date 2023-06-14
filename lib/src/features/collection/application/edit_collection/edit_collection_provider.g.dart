// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_collection_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$editCollectionHash() => r'72fe29371f35ce1ec76779868ad7e5cd29af4570';

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

abstract class _$EditCollection
    extends BuildlessAutoDisposeNotifier<EditCollectionState> {
  late final Collection collection;

  EditCollectionState build(
    Collection collection,
  );
}

/// See also [EditCollection].
@ProviderFor(EditCollection)
const editCollectionProvider = EditCollectionFamily();

/// See also [EditCollection].
class EditCollectionFamily extends Family<EditCollectionState> {
  /// See also [EditCollection].
  const EditCollectionFamily();

  /// See also [EditCollection].
  EditCollectionProvider call(
    Collection collection,
  ) {
    return EditCollectionProvider(
      collection,
    );
  }

  @override
  EditCollectionProvider getProviderOverride(
    covariant EditCollectionProvider provider,
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
  String? get name => r'editCollectionProvider';
}

/// See also [EditCollection].
class EditCollectionProvider extends AutoDisposeNotifierProviderImpl<
    EditCollection, EditCollectionState> {
  /// See also [EditCollection].
  EditCollectionProvider(
    this.collection,
  ) : super.internal(
          () => EditCollection()..collection = collection,
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

  final Collection collection;

  @override
  bool operator ==(Object other) {
    return other is EditCollectionProvider && other.collection == collection;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, collection.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  EditCollectionState runNotifierBuild(
    covariant EditCollection notifier,
  ) {
    return notifier.build(
      collection,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
