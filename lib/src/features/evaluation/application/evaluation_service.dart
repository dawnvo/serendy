import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/features/auth/auth.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/core/enums.dart';
import 'package:serendy/src/features/media/media.dart';

part 'evaluation_service.g.dart';

/// 작품 평가 목록을 불러와요.
@riverpod
Future<List<Evaluation?>> fetchMediaReactionsList(
  FetchMediaReactionsListRef ref, {
  required MediaID mediaId,
}) {
  return EvaluationModule.getEvaluationListUsecase.execute((mediaId: mediaId));
}

/// 평가 목록을 구독해요.
@Riverpod(keepAlive: true)
Stream<List<Evaluation?>> watchEvaluationsList(
  WatchEvaluationsListRef ref,
) {
  final userId = ref.watch(requireUserIdProvider);
  return EvaluationModule.watchEvaluationListUsecase.execute((userId: userId));
}

/// 평가 개수를 조회해요.
@Riverpod(keepAlive: true)
Future<int> countEvaluations(
  CountEvaluationsRef ref,
) {
  final userId = ref.watch(requireUserIdProvider);
  return EvaluationModule.countEvaluationsUsecase.execute((userId: userId));
}

/// 평가 정보를 불러와요.
@riverpod
Future<Evaluation?> fetchEvaluation(
  FetchEvaluationRef ref, {
  required MediaID mediaId,
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
  required MediaID mediaId,
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
  required MediaID mediaId,
}) {
  final userId = ref.watch(requireUserIdProvider);
  return EvaluationModule.removeEvaluationUsecase.execute((
    executorId: userId,
    mediaId: mediaId,
  ));
}
