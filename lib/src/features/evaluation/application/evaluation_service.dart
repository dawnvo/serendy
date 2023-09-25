import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/features/auth/auth.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/core/enums.dart';

part 'evaluation_service.g.dart';

/// 미디어 평가 목록을 불러와요.
@riverpod
Future<List<Evaluation?>> fetchReactionsList(
  FetchReactionsListRef ref, {
  required String mediaId,
}) {
  return EvaluationModule.getEvaluationListUsecase.execute((mediaId: mediaId));
}

/// 나의 평가 목록을 구독해요.
@Riverpod(keepAlive: true)
Stream<List<Evaluation?>> watchMyEvaluationsList(
  WatchMyEvaluationsListRef ref,
) {
  final userId = ref.watch(requireUserIdProvider);
  return EvaluationModule.watchEvaluationListUsecase.execute((userId: userId));
}

/// 나의 평가 개수를 조회해요.
@Riverpod(keepAlive: true)
Future<int> countMyEvaluations(
  CountMyEvaluationsRef ref,
) {
  final userId = ref.watch(requireUserIdProvider);
  return EvaluationModule.countEvaluationsUsecase.execute((userId: userId));
}

/// 나의 평가 정보를 불러와요.
@riverpod
Future<Evaluation?> fetchEvaluation(
  FetchEvaluationRef ref, {
  required String mediaId,
}) {
  final userId = ref.watch(requireUserIdProvider);
  return EvaluationModule.getEvaluationUsecase.execute((
    userId: userId,
    mediaId: mediaId,
  ));
}

/// 평가를 생성 또는 수정해요.
@riverpod
Future<Evaluation> submitEvaluation(
  SubmitEvaluationRef ref, {
  required String mediaId,
  required Emotion emotion,
}) {
  final userId = ref.watch(requireUserIdProvider);
  return EvaluationModule.submitEvaluationUsecase.execute((
    executorId: userId,
    mediaId: mediaId,
    emotion: emotion,
  ));
}

/// 평가를 제거해요.
@riverpod
Future<void> removeEvaluation(
  RemoveEvaluationRef ref, {
  required String mediaId,
}) {
  final userId = ref.watch(requireUserIdProvider);
  return EvaluationModule.removeEvaluationUsecase.execute((
    executorId: userId,
    mediaId: mediaId,
  ));
}
