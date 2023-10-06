// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluation_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchMediaReactionsListHash() =>
    r'3a75ec5881046ad30a44a9d1a380e0ac61e98725';

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

/// 작품 평가 목록을 불러와요.
///
/// Copied from [fetchMediaReactionsList].
@ProviderFor(fetchMediaReactionsList)
const fetchMediaReactionsListProvider = FetchMediaReactionsListFamily();

/// 작품 평가 목록을 불러와요.
///
/// Copied from [fetchMediaReactionsList].
class FetchMediaReactionsListFamily
    extends Family<AsyncValue<List<Evaluation?>>> {
  /// 작품 평가 목록을 불러와요.
  ///
  /// Copied from [fetchMediaReactionsList].
  const FetchMediaReactionsListFamily();

  /// 작품 평가 목록을 불러와요.
  ///
  /// Copied from [fetchMediaReactionsList].
  FetchMediaReactionsListProvider call({
    required String mediaId,
  }) {
    return FetchMediaReactionsListProvider(
      mediaId: mediaId,
    );
  }

  @override
  FetchMediaReactionsListProvider getProviderOverride(
    covariant FetchMediaReactionsListProvider provider,
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
  String? get name => r'fetchMediaReactionsListProvider';
}

/// 작품 평가 목록을 불러와요.
///
/// Copied from [fetchMediaReactionsList].
class FetchMediaReactionsListProvider
    extends AutoDisposeFutureProvider<List<Evaluation?>> {
  /// 작품 평가 목록을 불러와요.
  ///
  /// Copied from [fetchMediaReactionsList].
  FetchMediaReactionsListProvider({
    required String mediaId,
  }) : this._internal(
          (ref) => fetchMediaReactionsList(
            ref as FetchMediaReactionsListRef,
            mediaId: mediaId,
          ),
          from: fetchMediaReactionsListProvider,
          name: r'fetchMediaReactionsListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchMediaReactionsListHash,
          dependencies: FetchMediaReactionsListFamily._dependencies,
          allTransitiveDependencies:
              FetchMediaReactionsListFamily._allTransitiveDependencies,
          mediaId: mediaId,
        );

  FetchMediaReactionsListProvider._internal(
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
    FutureOr<List<Evaluation?>> Function(FetchMediaReactionsListRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchMediaReactionsListProvider._internal(
        (ref) => create(ref as FetchMediaReactionsListRef),
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
    return _FetchMediaReactionsListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchMediaReactionsListProvider && other.mediaId == mediaId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mediaId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchMediaReactionsListRef
    on AutoDisposeFutureProviderRef<List<Evaluation?>> {
  /// The parameter `mediaId` of this provider.
  String get mediaId;
}

class _FetchMediaReactionsListProviderElement
    extends AutoDisposeFutureProviderElement<List<Evaluation?>>
    with FetchMediaReactionsListRef {
  _FetchMediaReactionsListProviderElement(super.provider);

  @override
  String get mediaId => (origin as FetchMediaReactionsListProvider).mediaId;
}

String _$watchEvaluationsListHash() =>
    r'768221f96f01dc2c0e82438f1e530e5e1295add5';

/// 평가 목록을 구독해요.
///
/// Copied from [watchEvaluationsList].
@ProviderFor(watchEvaluationsList)
final watchEvaluationsListProvider = StreamProvider<List<Evaluation?>>.internal(
  watchEvaluationsList,
  name: r'watchEvaluationsListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchEvaluationsListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WatchEvaluationsListRef = StreamProviderRef<List<Evaluation?>>;
String _$countEvaluationsHash() => r'6f780ac3c3bd24297d8f338c81d7c97f1c8889ad';

/// 평가 개수를 조회해요.
///
/// Copied from [countEvaluations].
@ProviderFor(countEvaluations)
final countEvaluationsProvider = FutureProvider<int>.internal(
  countEvaluations,
  name: r'countEvaluationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$countEvaluationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CountEvaluationsRef = FutureProviderRef<int>;
String _$fetchEvaluationHash() => r'379ee6ce97979a6f137f5854735c726cd4c4f53e';

/// 평가 정보를 불러와요.
///
/// Copied from [fetchEvaluation].
@ProviderFor(fetchEvaluation)
const fetchEvaluationProvider = FetchEvaluationFamily();

/// 평가 정보를 불러와요.
///
/// Copied from [fetchEvaluation].
class FetchEvaluationFamily extends Family<AsyncValue<Evaluation?>> {
  /// 평가 정보를 불러와요.
  ///
  /// Copied from [fetchEvaluation].
  const FetchEvaluationFamily();

  /// 평가 정보를 불러와요.
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

/// 평가 정보를 불러와요.
///
/// Copied from [fetchEvaluation].
class FetchEvaluationProvider extends AutoDisposeFutureProvider<Evaluation?> {
  /// 평가 정보를 불러와요.
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
