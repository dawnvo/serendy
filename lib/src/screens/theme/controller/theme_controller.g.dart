// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$themeControllerHash() => r'58579edd51661dd3cbecdaa2172a12d52616adaf';

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
    this.id, [
    this.theme,
  ]) : super.internal(
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
        );

  final String id;
  final Theme? theme;

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

  @override
  FutureOr<ThemeState> runNotifierBuild(
    covariant ThemeController notifier,
  ) {
    return notifier.build(
      id,
      theme,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
