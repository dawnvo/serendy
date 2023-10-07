// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluation_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getMediaReactionsHash() => r'89b4b06ea8c2b458f25f25f67d79a428dbf012a1';

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

/// 반응 목록을 불러와요.
///
/// Copied from [getMediaReactions].
@ProviderFor(getMediaReactions)
const getMediaReactionsProvider = GetMediaReactionsFamily();

/// 반응 목록을 불러와요.
///
/// Copied from [getMediaReactions].
class GetMediaReactionsFamily extends Family<AsyncValue<List<Evaluation?>>> {
  /// 반응 목록을 불러와요.
  ///
  /// Copied from [getMediaReactions].
  const GetMediaReactionsFamily();

  /// 반응 목록을 불러와요.
  ///
  /// Copied from [getMediaReactions].
  GetMediaReactionsProvider call({
    required String mediaId,
  }) {
    return GetMediaReactionsProvider(
      mediaId: mediaId,
    );
  }

  @override
  GetMediaReactionsProvider getProviderOverride(
    covariant GetMediaReactionsProvider provider,
  ) {
    return call(
      mediaId: provider.mediaId,
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
  String? get name => r'getMediaReactionsProvider';
}

/// 반응 목록을 불러와요.
///
/// Copied from [getMediaReactions].
class GetMediaReactionsProvider
    extends AutoDisposeFutureProvider<List<Evaluation?>> {
  /// 반응 목록을 불러와요.
  ///
  /// Copied from [getMediaReactions].
  GetMediaReactionsProvider({
    required String mediaId,
  }) : this._internal(
          (ref) => getMediaReactions(
            ref as GetMediaReactionsRef,
            mediaId: mediaId,
          ),
          from: getMediaReactionsProvider,
          name: r'getMediaReactionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMediaReactionsHash,
          dependencies: GetMediaReactionsFamily._dependencies,
          allTransitiveDependencies:
              GetMediaReactionsFamily._allTransitiveDependencies,
          mediaId: mediaId,
        );

  GetMediaReactionsProvider._internal(
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
  Override overrideWith(
    FutureOr<List<Evaluation?>> Function(GetMediaReactionsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetMediaReactionsProvider._internal(
        (ref) => create(ref as GetMediaReactionsRef),
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
  AutoDisposeFutureProviderElement<List<Evaluation?>> createElement() {
    return _GetMediaReactionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMediaReactionsProvider && other.mediaId == mediaId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mediaId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetMediaReactionsRef on AutoDisposeFutureProviderRef<List<Evaluation?>> {
  /// The parameter `mediaId` of this provider.
  String get mediaId;
}

class _GetMediaReactionsProviderElement
    extends AutoDisposeFutureProviderElement<List<Evaluation?>>
    with GetMediaReactionsRef {
  _GetMediaReactionsProviderElement(super.provider);

  @override
  String get mediaId => (origin as GetMediaReactionsProvider).mediaId;
}

String _$watchEvaluationsHash() => r'435ad1e7244c3fd68b09f1b2eb484cc08561558f';

/// 평가 목록을 구독해요.
///
/// Copied from [watchEvaluations].
@ProviderFor(watchEvaluations)
final watchEvaluationsProvider =
    AutoDisposeStreamProvider<List<Evaluation?>>.internal(
  watchEvaluations,
  name: r'watchEvaluationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchEvaluationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WatchEvaluationsRef = AutoDisposeStreamProviderRef<List<Evaluation?>>;
String _$countEvaluationsHash() => r'f3be6547042028f257d9ad6c15f960df5da57c10';

/// 평가 개수를 조회해요.
///
/// Copied from [countEvaluations].
@ProviderFor(countEvaluations)
final countEvaluationsProvider = AutoDisposeFutureProvider<int>.internal(
  countEvaluations,
  name: r'countEvaluationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$countEvaluationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CountEvaluationsRef = AutoDisposeFutureProviderRef<int>;
String _$getEvaluationHash() => r'3dc7080884aad08ba4c108fb02e39318c9ab5601';

/// 평가 정보를 불러와요.
///
/// Copied from [getEvaluation].
@ProviderFor(getEvaluation)
const getEvaluationProvider = GetEvaluationFamily();

/// 평가 정보를 불러와요.
///
/// Copied from [getEvaluation].
class GetEvaluationFamily extends Family<AsyncValue<Evaluation?>> {
  /// 평가 정보를 불러와요.
  ///
  /// Copied from [getEvaluation].
  const GetEvaluationFamily();

  /// 평가 정보를 불러와요.
  ///
  /// Copied from [getEvaluation].
  GetEvaluationProvider call({
    required String mediaId,
  }) {
    return GetEvaluationProvider(
      mediaId: mediaId,
    );
  }

  @override
  GetEvaluationProvider getProviderOverride(
    covariant GetEvaluationProvider provider,
  ) {
    return call(
      mediaId: provider.mediaId,
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
  String? get name => r'getEvaluationProvider';
}

/// 평가 정보를 불러와요.
///
/// Copied from [getEvaluation].
class GetEvaluationProvider extends AutoDisposeFutureProvider<Evaluation?> {
  /// 평가 정보를 불러와요.
  ///
  /// Copied from [getEvaluation].
  GetEvaluationProvider({
    required String mediaId,
  }) : this._internal(
          (ref) => getEvaluation(
            ref as GetEvaluationRef,
            mediaId: mediaId,
          ),
          from: getEvaluationProvider,
          name: r'getEvaluationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getEvaluationHash,
          dependencies: GetEvaluationFamily._dependencies,
          allTransitiveDependencies:
              GetEvaluationFamily._allTransitiveDependencies,
          mediaId: mediaId,
        );

  GetEvaluationProvider._internal(
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
  Override overrideWith(
    FutureOr<Evaluation?> Function(GetEvaluationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetEvaluationProvider._internal(
        (ref) => create(ref as GetEvaluationRef),
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
  AutoDisposeFutureProviderElement<Evaluation?> createElement() {
    return _GetEvaluationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetEvaluationProvider && other.mediaId == mediaId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mediaId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetEvaluationRef on AutoDisposeFutureProviderRef<Evaluation?> {
  /// The parameter `mediaId` of this provider.
  String get mediaId;
}

class _GetEvaluationProviderElement
    extends AutoDisposeFutureProviderElement<Evaluation?>
    with GetEvaluationRef {
  _GetEvaluationProviderElement(super.provider);

  @override
  String get mediaId => (origin as GetEvaluationProvider).mediaId;
}

String _$submitEvaluationHash() => r'd1354b7f20d14382af4d7bf97c53a185cec71bf1';

/// 평가를 생성 또는 수정해요.
///
/// Copied from [submitEvaluation].
@ProviderFor(submitEvaluation)
const submitEvaluationProvider = SubmitEvaluationFamily();

/// 평가를 생성 또는 수정해요.
///
/// Copied from [submitEvaluation].
class SubmitEvaluationFamily extends Family<AsyncValue<Evaluation>> {
  /// 평가를 생성 또는 수정해요.
  ///
  /// Copied from [submitEvaluation].
  const SubmitEvaluationFamily();

  /// 평가를 생성 또는 수정해요.
  ///
  /// Copied from [submitEvaluation].
  SubmitEvaluationProvider call({
    required String mediaId,
    required Emotion emotion,
  }) {
    return SubmitEvaluationProvider(
      mediaId: mediaId,
      emotion: emotion,
    );
  }

  @override
  SubmitEvaluationProvider getProviderOverride(
    covariant SubmitEvaluationProvider provider,
  ) {
    return call(
      mediaId: provider.mediaId,
      emotion: provider.emotion,
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
  String? get name => r'submitEvaluationProvider';
}

/// 평가를 생성 또는 수정해요.
///
/// Copied from [submitEvaluation].
class SubmitEvaluationProvider extends AutoDisposeFutureProvider<Evaluation> {
  /// 평가를 생성 또는 수정해요.
  ///
  /// Copied from [submitEvaluation].
  SubmitEvaluationProvider({
    required String mediaId,
    required Emotion emotion,
  }) : this._internal(
          (ref) => submitEvaluation(
            ref as SubmitEvaluationRef,
            mediaId: mediaId,
            emotion: emotion,
          ),
          from: submitEvaluationProvider,
          name: r'submitEvaluationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$submitEvaluationHash,
          dependencies: SubmitEvaluationFamily._dependencies,
          allTransitiveDependencies:
              SubmitEvaluationFamily._allTransitiveDependencies,
          mediaId: mediaId,
          emotion: emotion,
        );

  SubmitEvaluationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.mediaId,
    required this.emotion,
  }) : super.internal();

  final String mediaId;
  final Emotion emotion;

  @override
  Override overrideWith(
    FutureOr<Evaluation> Function(SubmitEvaluationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SubmitEvaluationProvider._internal(
        (ref) => create(ref as SubmitEvaluationRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        mediaId: mediaId,
        emotion: emotion,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Evaluation> createElement() {
    return _SubmitEvaluationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubmitEvaluationProvider &&
        other.mediaId == mediaId &&
        other.emotion == emotion;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mediaId.hashCode);
    hash = _SystemHash.combine(hash, emotion.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SubmitEvaluationRef on AutoDisposeFutureProviderRef<Evaluation> {
  /// The parameter `mediaId` of this provider.
  String get mediaId;

  /// The parameter `emotion` of this provider.
  Emotion get emotion;
}

class _SubmitEvaluationProviderElement
    extends AutoDisposeFutureProviderElement<Evaluation>
    with SubmitEvaluationRef {
  _SubmitEvaluationProviderElement(super.provider);

  @override
  String get mediaId => (origin as SubmitEvaluationProvider).mediaId;
  @override
  Emotion get emotion => (origin as SubmitEvaluationProvider).emotion;
}

String _$removeEvaluationHash() => r'da7b7279e2f82acfc67ea9628fe11482171ac068';

/// 평가를 제거해요.
///
/// Copied from [removeEvaluation].
@ProviderFor(removeEvaluation)
const removeEvaluationProvider = RemoveEvaluationFamily();

/// 평가를 제거해요.
///
/// Copied from [removeEvaluation].
class RemoveEvaluationFamily extends Family<AsyncValue<void>> {
  /// 평가를 제거해요.
  ///
  /// Copied from [removeEvaluation].
  const RemoveEvaluationFamily();

  /// 평가를 제거해요.
  ///
  /// Copied from [removeEvaluation].
  RemoveEvaluationProvider call({
    required String mediaId,
  }) {
    return RemoveEvaluationProvider(
      mediaId: mediaId,
    );
  }

  @override
  RemoveEvaluationProvider getProviderOverride(
    covariant RemoveEvaluationProvider provider,
  ) {
    return call(
      mediaId: provider.mediaId,
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
  String? get name => r'removeEvaluationProvider';
}

/// 평가를 제거해요.
///
/// Copied from [removeEvaluation].
class RemoveEvaluationProvider extends AutoDisposeFutureProvider<void> {
  /// 평가를 제거해요.
  ///
  /// Copied from [removeEvaluation].
  RemoveEvaluationProvider({
    required String mediaId,
  }) : this._internal(
          (ref) => removeEvaluation(
            ref as RemoveEvaluationRef,
            mediaId: mediaId,
          ),
          from: removeEvaluationProvider,
          name: r'removeEvaluationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$removeEvaluationHash,
          dependencies: RemoveEvaluationFamily._dependencies,
          allTransitiveDependencies:
              RemoveEvaluationFamily._allTransitiveDependencies,
          mediaId: mediaId,
        );

  RemoveEvaluationProvider._internal(
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
  Override overrideWith(
    FutureOr<void> Function(RemoveEvaluationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RemoveEvaluationProvider._internal(
        (ref) => create(ref as RemoveEvaluationRef),
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _RemoveEvaluationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RemoveEvaluationProvider && other.mediaId == mediaId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mediaId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RemoveEvaluationRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `mediaId` of this provider.
  String get mediaId;
}

class _RemoveEvaluationProviderElement
    extends AutoDisposeFutureProviderElement<void> with RemoveEvaluationRef {
  _RemoveEvaluationProviderElement(super.provider);

  @override
  String get mediaId => (origin as RemoveEvaluationProvider).mediaId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
