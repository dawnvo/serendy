// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$themeControllerHash() => r'7ef5e703fed054ff3f7a0bdaa2d37fd8f577b563';

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

abstract class _$ThemeController
    extends BuildlessAutoDisposeAsyncNotifier<ThemeState> {
  late final String id;
  late final Theme? theme;

  FutureOr<ThemeState> build(
    String id, [
    Theme? theme,
  ]);
}

/// See also [ThemeController].
@ProviderFor(ThemeController)
const themeControllerProvider = ThemeControllerFamily();

/// See also [ThemeController].
class ThemeControllerFamily extends Family<AsyncValue<ThemeState>> {
  /// See also [ThemeController].
  const ThemeControllerFamily();

  /// See also [ThemeController].
  ThemeControllerProvider call(
    String id, [
    Theme? theme,
  ]) {
    return ThemeControllerProvider(
      id,
      theme,
    );
  }

  @override
  ThemeControllerProvider getProviderOverride(
    covariant ThemeControllerProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'themeControllerProvider';
}

/// See also [ThemeController].
class ThemeControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ThemeController, ThemeState> {
  /// See also [ThemeController].
  ThemeControllerProvider(
    String id, [
    Theme? theme,
  ]) : this._internal(
          () => ThemeController()
            ..id = id
            ..theme = theme,
          from: themeControllerProvider,
          name: r'themeControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$themeControllerHash,
          dependencies: ThemeControllerFamily._dependencies,
          allTransitiveDependencies:
              ThemeControllerFamily._allTransitiveDependencies,
          id: id,
          theme: theme,
        );

  ThemeControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.theme,
  }) : super.internal();

  final String id;
  final Theme? theme;

  @override
  FutureOr<ThemeState> runNotifierBuild(
    covariant ThemeController notifier,
  ) {
    return notifier.build(
      id,
      theme,
    );
  }

  @override
  Override overrideWith(ThemeController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ThemeControllerProvider._internal(
        () => create()
          ..id = id
          ..theme = theme,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        theme: theme,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ThemeController, ThemeState>
      createElement() {
    return _ThemeControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ThemeControllerProvider &&
        other.id == id &&
        other.theme == theme;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, theme.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ThemeControllerRef on AutoDisposeAsyncNotifierProviderRef<ThemeState> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `theme` of this provider.
  Theme? get theme;
}

class _ThemeControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ThemeController, ThemeState>
    with ThemeControllerRef {
  _ThemeControllerProviderElement(super.provider);

  @override
  String get id => (origin as ThemeControllerProvider).id;
  @override
  Theme? get theme => (origin as ThemeControllerProvider).theme;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
