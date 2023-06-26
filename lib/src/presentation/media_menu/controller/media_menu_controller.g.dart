// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_menu_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mediaMenuControllerHash() =>
    r'69ac7febdc0471b22088f7cda52c1518b9e2d93f';

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

abstract class _$MediaMenuController
    extends BuildlessAutoDisposeNotifier<void> {
  late final Media media;

  void build(
    Media media,
  );
}

/// See also [MediaMenuController].
@ProviderFor(MediaMenuController)
const mediaMenuControllerProvider = MediaMenuControllerFamily();

/// See also [MediaMenuController].
class MediaMenuControllerFamily extends Family<void> {
  /// See also [MediaMenuController].
  const MediaMenuControllerFamily();

  /// See also [MediaMenuController].
  MediaMenuControllerProvider call(
    Media media,
  ) {
    return MediaMenuControllerProvider(
      media,
    );
  }

  @override
  MediaMenuControllerProvider getProviderOverride(
    covariant MediaMenuControllerProvider provider,
  ) {
    return call(
      provider.media,
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
  String? get name => r'mediaMenuControllerProvider';
}

/// See also [MediaMenuController].
class MediaMenuControllerProvider
    extends AutoDisposeNotifierProviderImpl<MediaMenuController, void> {
  /// See also [MediaMenuController].
  MediaMenuControllerProvider(
    this.media,
  ) : super.internal(
          () => MediaMenuController()..media = media,
          from: mediaMenuControllerProvider,
          name: r'mediaMenuControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mediaMenuControllerHash,
          dependencies: MediaMenuControllerFamily._dependencies,
          allTransitiveDependencies:
              MediaMenuControllerFamily._allTransitiveDependencies,
        );

  final Media media;

  @override
  bool operator ==(Object other) {
    return other is MediaMenuControllerProvider && other.media == media;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, media.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  void runNotifierBuild(
    covariant MediaMenuController notifier,
  ) {
    return notifier.build(
      media,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
