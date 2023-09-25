// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluation_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchReactionsListHash() =>
    r'ea163ef3623b6a2022665da4007a9824c4bc6579';

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

/// 미디어 평가(반응) 목록을 불러와요.
///
/// Copied from [fetchReactionsList].
@ProviderFor(fetchReactionsList)
const fetchReactionsListProvider = FetchReactionsListFamily();

/// 미디어 평가(반응) 목록을 불러와요.
///
/// Copied from [fetchReactionsList].
class FetchReactionsListFamily extends Family<AsyncValue<List<Evaluation?>>> {
  /// 미디어 평가(반응) 목록을 불러와요.
  ///
  /// Copied from [fetchReactionsList].
  const FetchReactionsListFamily();

  /// 미디어 평가(반응) 목록을 불러와요.
  ///
  /// Copied from [fetchReactionsList].
  FetchReactionsListProvider call({
    required String mediaId,
  }) {
    return FetchReactionsListProvider(
      mediaId: mediaId,
    );
  }

  @override
  FetchReactionsListProvider getProviderOverride(
    covariant FetchReactionsListProvider provider,
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
  String? get name => r'fetchReactionsListProvider';
}

/// 미디어 평가(반응) 목록을 불러와요.
///
/// Copied from [fetchReactionsList].
class FetchReactionsListProvider
    extends AutoDisposeFutureProvider<List<Evaluation?>> {
  /// 미디어 평가(반응) 목록을 불러와요.
  ///
  /// Copied from [fetchReactionsList].
  FetchReactionsListProvider({
    required String mediaId,
  }) : this._internal(
          (ref) => fetchReactionsList(
            ref as FetchReactionsListRef,
            mediaId: mediaId,
          ),
          from: fetchReactionsListProvider,
          name: r'fetchReactionsListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchReactionsListHash,
          dependencies: FetchReactionsListFamily._dependencies,
          allTransitiveDependencies:
              FetchReactionsListFamily._allTransitiveDependencies,
          mediaId: mediaId,
        );

  FetchReactionsListProvider._internal(
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
    FutureOr<List<Evaluation?>> Function(FetchReactionsListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchReactionsListProvider._internal(
        (ref) => create(ref as FetchReactionsListRef),
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
    return _FetchReactionsListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchReactionsListProvider && other.mediaId == mediaId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mediaId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchReactionsListRef on AutoDisposeFutureProviderRef<List<Evaluation?>> {
  /// The parameter `mediaId` of this provider.
  String get mediaId;
}

class _FetchReactionsListProviderElement
    extends AutoDisposeFutureProviderElement<List<Evaluation?>>
    with FetchReactionsListRef {
  _FetchReactionsListProviderElement(super.provider);

  @override
  String get mediaId => (origin as FetchReactionsListProvider).mediaId;
}

String _$watchMyEvaluationsListHash() =>
    r'6a5f9d4e9f31c3a1746b780ec2563ce616f1ea41';

/// 나의 평가 목록을 구독해요.
///
/// Copied from [watchMyEvaluationsList].
@ProviderFor(watchMyEvaluationsList)
final watchMyEvaluationsListProvider =
    StreamProvider<List<Evaluation?>>.internal(
  watchMyEvaluationsList,
  name: r'watchMyEvaluationsListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchMyEvaluationsListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WatchMyEvaluationsListRef = StreamProviderRef<List<Evaluation?>>;
String _$countMyEvaluationsHash() =>
    r'139f29127ea779fe16768070ae01a3669ae30f6e';

/// 나의 평가 개수를 조회해요.
///
/// Copied from [countMyEvaluations].
@ProviderFor(countMyEvaluations)
final countMyEvaluationsProvider = FutureProvider<int>.internal(
  countMyEvaluations,
  name: r'countMyEvaluationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$countMyEvaluationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CountMyEvaluationsRef = FutureProviderRef<int>;
String _$fetchEvaluationHash() => r'ded10c0252725a8921bea213fe76096721d2bb24';

/// 나의 평가 정보를 불러와요.
///
/// Copied from [fetchEvaluation].
@ProviderFor(fetchEvaluation)
const fetchEvaluationProvider = FetchEvaluationFamily();

/// 나의 평가 정보를 불러와요.
///
/// Copied from [fetchEvaluation].
class FetchEvaluationFamily extends Family<AsyncValue<Evaluation?>> {
  /// 나의 평가 정보를 불러와요.
  ///
  /// Copied from [fetchEvaluation].
  const FetchEvaluationFamily();

  /// 나의 평가 정보를 불러와요.
  ///
  /// Copied from [fetchEvaluation].
  FetchEvaluationProvider call({
    required String mediaId,
  }) {
    return FetchEvaluationProvider(
      mediaId: mediaId,
    );
  }

  @override
  FetchEvaluationProvider getProviderOverride(
    covariant FetchEvaluationProvider provider,
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
  String? get name => r'fetchEvaluationProvider';
}

/// 나의 평가 정보를 불러와요.
///
/// Copied from [fetchEvaluation].
class FetchEvaluationProvider extends AutoDisposeFutureProvider<Evaluation?> {
  /// 나의 평가 정보를 불러와요.
  ///
  /// Copied from [fetchEvaluation].
  FetchEvaluationProvider({
    required String mediaId,
  }) : this._internal(
          (ref) => fetchEvaluation(
            ref as FetchEvaluationRef,
            mediaId: mediaId,
          ),
          from: fetchEvaluationProvider,
          name: r'fetchEvaluationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchEvaluationHash,
          dependencies: FetchEvaluationFamily._dependencies,
          allTransitiveDependencies:
              FetchEvaluationFamily._allTransitiveDependencies,
          mediaId: mediaId,
        );

  FetchEvaluationProvider._internal(
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
    FutureOr<Evaluation?> Function(FetchEvaluationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchEvaluationProvider._internal(
        (ref) => create(ref as FetchEvaluationRef),
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
    return _FetchEvaluationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchEvaluationProvider && other.mediaId == mediaId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mediaId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchEvaluationRef on AutoDisposeFutureProviderRef<Evaluation?> {
  /// The parameter `mediaId` of this provider.
  String get mediaId;
}

class _FetchEvaluationProviderElement
    extends AutoDisposeFutureProviderElement<Evaluation?>
    with FetchEvaluationRef {
  _FetchEvaluationProviderElement(super.provider);

  @override
  String get mediaId => (origin as FetchEvaluationProvider).mediaId;
}

String _$submitEvaluationHash() => r'517fe010914739ac06f62df59c769f1dedb11034';

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

String _$removeEvaluationHash() => r'dd080369845735156b8011412f9333f31af54e59';

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
