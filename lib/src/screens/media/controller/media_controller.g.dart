// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mediaControllerHash() => r'dfe9eec591904a67172f3f2aa673b5b33f080cfb';

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

abstract class _$MediaController
    extends BuildlessAutoDisposeAsyncNotifier<MediaState> {
  late final String id;
  late final Media? media;

  FutureOr<MediaState> build(
    String id, [
    Media? media,
  ]);
}

/// See also [MediaController].
@ProviderFor(MediaController)
const mediaControllerProvider = MediaControllerFamily();

/// See also [MediaController].
class MediaControllerFamily extends Family<AsyncValue<MediaState>> {
  /// See also [MediaController].
  const MediaControllerFamily();

  /// See also [MediaController].
  MediaControllerProvider call(
    String id, [
    Media? media,
  ]) {
    return MediaControllerProvider(
      id,
      media,
    );
  }

  @override
  MediaControllerProvider getProviderOverride(
    covariant MediaControllerProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'mediaControllerProvider';
}

/// See also [MediaController].
class MediaControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<MediaController, MediaState> {
  /// See also [MediaController].
  MediaControllerProvider(
    this.id, [
    this.media,
  ]) : super.internal(
          () => MediaController()
            ..id = id
            ..media = media,
          from: mediaControllerProvider,
          name: r'mediaControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mediaControllerHash,
          dependencies: MediaControllerFamily._dependencies,
          allTransitiveDependencies:
              MediaControllerFamily._allTransitiveDependencies,
        );

  final String id;
  final Media? media;

  @override
  bool operator ==(Object other) {
    return other is MediaControllerProvider &&
        other.id == id &&
        other.media == media;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, media.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<MediaState> runNotifierBuild(
    covariant MediaController notifier,
  ) {
    return notifier.build(
      id,
      media,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
