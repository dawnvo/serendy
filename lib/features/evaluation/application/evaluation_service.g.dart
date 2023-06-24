// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluation_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchReactionsListHash() =>
    r'7fe70e37883b20fee6766ab75608d724704ab783';

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

typedef FetchReactionsListRef = AutoDisposeFutureProviderRef<List<Evaluation?>>;

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
    required this.mediaId,
  }) : super.internal(
          (ref) => fetchReactionsList(
            ref,
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
        );

  final String mediaId;

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

String _$watchMyEvaluationsListHash() =>
    r'abbbe46f489dcc73d47762bd634ef050f1e1a7d9';

/// 나의 평가 목록을 구독해요.
///
/// Copied from [watchMyEvaluationsList].
@ProviderFor(watchMyEvaluationsList)
final watchMyEvaluationsListProvider =
    AutoDisposeStreamProvider<List<Evaluation?>>.internal(
  watchMyEvaluationsList,
  name: r'watchMyEvaluationsListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchMyEvaluationsListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WatchMyEvaluationsListRef
    = AutoDisposeStreamProviderRef<List<Evaluation?>>;
String _$countMyEvaluationsHash() =>
    r'cff6b0f9d843f55efdf356077287399605e6891e';

/// 나의 평가 개수를 조회해요.
///
/// Copied from [countMyEvaluations].
@ProviderFor(countMyEvaluations)
final countMyEvaluationsProvider = AutoDisposeFutureProvider<int>.internal(
  countMyEvaluations,
  name: r'countMyEvaluationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$countMyEvaluationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CountMyEvaluationsRef = AutoDisposeFutureProviderRef<int>;
String _$fetchEvaluationHash() => r'ded10c0252725a8921bea213fe76096721d2bb24';
typedef FetchEvaluationRef = AutoDisposeFutureProviderRef<Evaluation?>;

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
    required this.mediaId,
  }) : super.internal(
          (ref) => fetchEvaluation(
            ref,
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
        );

  final String mediaId;

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

String _$submitEvaluationHash() => r'517fe010914739ac06f62df59c769f1dedb11034';
typedef SubmitEvaluationRef = AutoDisposeFutureProviderRef<Evaluation>;

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
    required this.mediaId,
    required this.emotion,
  }) : super.internal(
          (ref) => submitEvaluation(
            ref,
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
        );

  final String mediaId;
  final Emotion emotion;

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

String _$removeEvaluationHash() => r'dd080369845735156b8011412f9333f31af54e59';
typedef RemoveEvaluationRef = AutoDisposeFutureProviderRef<void>;

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
    required this.mediaId,
  }) : super.internal(
          (ref) => removeEvaluation(
            ref,
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
        );

  final String mediaId;

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
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
