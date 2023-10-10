// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_theme_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$editThemeControllerHash() =>
    r'ac286638206d3a845617cf30fc814c4a8c94a36c';

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
    Theme theme,
  ) : this._internal(
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
          theme: theme,
        );

  EditThemeControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.theme,
  }) : super.internal();

  final Theme theme;

  @override
  EditThemeState runNotifierBuild(
    covariant EditThemeController notifier,
  ) {
    return notifier.build(
      theme,
    );
  }

  @override
  Override overrideWith(EditThemeController Function() create) {
    return ProviderOverride(
      origin: this,
      override: EditThemeControllerProvider._internal(
        () => create()..theme = theme,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        theme: theme,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<EditThemeController, EditThemeState>
      createElement() {
    return _EditThemeControllerProviderElement(this);
  }

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
}

mixin EditThemeControllerRef on AutoDisposeNotifierProviderRef<EditThemeState> {
  /// The parameter `theme` of this provider.
  Theme get theme;
}

class _EditThemeControllerProviderElement
    extends AutoDisposeNotifierProviderElement<EditThemeController,
        EditThemeState> with EditThemeControllerRef {
  _EditThemeControllerProviderElement(super.provider);

  @override
  Theme get theme => (origin as EditThemeControllerProvider).theme;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
