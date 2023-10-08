// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluate_media_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$evaluateMediaControllerHash() =>
    r'd03d57f75741bf83ac4e85b00b2ffcd125f2e28d';

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

abstract class _$EvaluateMediaController
    extends BuildlessAutoDisposeNotifier<EvaluateMediaState> {
  late final String mediaId;

  EvaluateMediaState build(
    String mediaId,
  );
}

/// See also [EvaluateMediaController].
@ProviderFor(EvaluateMediaController)
const evaluateMediaControllerProvider = EvaluateMediaControllerFamily();

/// See also [EvaluateMediaController].
class EvaluateMediaControllerFamily extends Family<EvaluateMediaState> {
  /// See also [EvaluateMediaController].
  const EvaluateMediaControllerFamily();

  /// See also [EvaluateMediaController].
  EvaluateMediaControllerProvider call(
    String mediaId,
  ) {
    return EvaluateMediaControllerProvider(
      mediaId,
    );
  }

  @override
  EvaluateMediaControllerProvider getProviderOverride(
    covariant EvaluateMediaControllerProvider provider,
  ) {
    return call(
      provider.mediaId,
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
  String? get name => r'evaluateMediaControllerProvider';
}

/// See also [EvaluateMediaController].
class EvaluateMediaControllerProvider extends AutoDisposeNotifierProviderImpl<
    EvaluateMediaController, EvaluateMediaState> {
  /// See also [EvaluateMediaController].
  EvaluateMediaControllerProvider(
    String mediaId,
  ) : this._internal(
          () => EvaluateMediaController()..mediaId = mediaId,
          from: evaluateMediaControllerProvider,
          name: r'evaluateMediaControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$evaluateMediaControllerHash,
          dependencies: EvaluateMediaControllerFamily._dependencies,
          allTransitiveDependencies:
              EvaluateMediaControllerFamily._allTransitiveDependencies,
          mediaId: mediaId,
        );

  EvaluateMediaControllerProvider._internal(
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
  EvaluateMediaState runNotifierBuild(
    covariant EvaluateMediaController notifier,
  ) {
    return notifier.build(
      mediaId,
    );
  }

  @override
  Override overrideWith(EvaluateMediaController Function() create) {
    return ProviderOverride(
      origin: this,
      override: EvaluateMediaControllerProvider._internal(
        () => create()..mediaId = mediaId,
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
  AutoDisposeNotifierProviderElement<EvaluateMediaController,
      EvaluateMediaState> createElement() {
    return _EvaluateMediaControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EvaluateMediaControllerProvider && other.mediaId == mediaId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mediaId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EvaluateMediaControllerRef
    on AutoDisposeNotifierProviderRef<EvaluateMediaState> {
  /// The parameter `mediaId` of this provider.
  String get mediaId;
}

class _EvaluateMediaControllerProviderElement
    extends AutoDisposeNotifierProviderElement<EvaluateMediaController,
        EvaluateMediaState> with EvaluateMediaControllerRef {
  _EvaluateMediaControllerProviderElement(super.provider);

  @override
  String get mediaId => (origin as EvaluateMediaControllerProvider).mediaId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
