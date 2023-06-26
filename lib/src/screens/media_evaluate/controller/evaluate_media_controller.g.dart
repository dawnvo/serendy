// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluate_media_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$evaluateMediaControllerHash() =>
    r'abb42a0541d3d5796b4f3404cdd6d61f1d4c2681';

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
    this.mediaId,
  ) : super.internal(
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
        );

  final String mediaId;

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

  @override
  EvaluateMediaState runNotifierBuild(
    covariant EvaluateMediaController notifier,
  ) {
    return notifier.build(
      mediaId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
