// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_theme_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$editThemeControllerHash() =>
    r'd98d0eab541697d39b7fbbdba9e696cd07a854d0';

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

abstract class _$EditThemeController
    extends BuildlessAutoDisposeNotifier<EditThemeState> {
  late final Theme theme;

  EditThemeState build(
    Theme theme,
  );
}

/// See also [EditThemeController].
@ProviderFor(EditThemeController)
const editThemeControllerProvider = EditThemeControllerFamily();

/// See also [EditThemeController].
class EditThemeControllerFamily extends Family<EditThemeState> {
  /// See also [EditThemeController].
  const EditThemeControllerFamily();

  /// See also [EditThemeController].
  EditThemeControllerProvider call(
    Theme theme,
  ) {
    return EditThemeControllerProvider(
      theme,
    );
  }

  @override
  EditThemeControllerProvider getProviderOverride(
    covariant EditThemeControllerProvider provider,
  ) {
    return call(
      provider.theme,
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
  String? get name => r'editThemeControllerProvider';
}

/// See also [EditThemeController].
class EditThemeControllerProvider extends AutoDisposeNotifierProviderImpl<
    EditThemeController, EditThemeState> {
  /// See also [EditThemeController].
  EditThemeControllerProvider(
    this.theme,
  ) : super.internal(
          () => EditThemeController()..theme = theme,
          from: editThemeControllerProvider,
          name: r'editThemeControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$editThemeControllerHash,
          dependencies: EditThemeControllerFamily._dependencies,
          allTransitiveDependencies:
              EditThemeControllerFamily._allTransitiveDependencies,
        );

  final Theme theme;

  @override
  bool operator ==(Object other) {
    return other is EditThemeControllerProvider && other.theme == theme;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, theme.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  EditThemeState runNotifierBuild(
    covariant EditThemeController notifier,
  ) {
    return notifier.build(
      theme,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
