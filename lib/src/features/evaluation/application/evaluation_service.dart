import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/auth/auth.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/media.dart';

part 'evaluation_service.g.dart';

/// 평가 목록을 불러와요.
@riverpod
Future<List<Evaluation?>> getEvaluations(
  GetEvaluationsRef ref, {
  int? page,
}) {
  final userId = ref.watch(requireUserIdProvider);
  return EvaluationModule.getEvaluationsUsecase.execute((
    mediaId: null,
    userId: userId,
    page: page,
  ));
}

/// 평가 개수를 조회해요.
@riverpod
Future<int> countEvaluations(
  CountEvaluationsRef ref,
) {
  final userId = ref.watch(requireUserIdProvider);
  return EvaluationModule.countEvaluationsUsecase.execute((userId: userId));
}

/// 평가 정보를 불러와요.
@riverpod
Future<Evaluation?> getEvaluation(
  GetEvaluationRef ref, {
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
