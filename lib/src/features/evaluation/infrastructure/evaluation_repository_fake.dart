import 'dart:developer';

import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/infrastructure/media_repository_fake.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/user/infrastructure/user_repository_fake.dart';
import 'package:serendy/src/features/user/user.dart';

final class EvaluationRepositoryFake extends EvaluationRepository {
  EvaluationRepositoryFake();

  final _evaluationStore = InMemoryStore<List<Evaluation>>([]);

  @override
  Future<List<Evaluation?>> fetchEvaluations({
    UserID? userId,
    MediaID? mediaId,
    int? page,
    int? perPage,
  }) async {
    log(name: 'EvaluationRepository', 'fetchEvaluations');
    var evaluations = _evaluationStore.value;
    if (userId != null) evaluations = evaluations.where((_) => _.userId == userId).toList();
    if (mediaId != null) evaluations = evaluations.where((_) => _.media.id == mediaId).toList();
    return evaluations..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
  }

  @override
  Future<int> countEvaluations({
    required UserID userId,
  }) async {
    log(name: 'EvaluationRepository', 'countEvaluations');
    final evaluations = _evaluationStore.value;
    return evaluations.length;
  }

  @override
  Future<Evaluation?> fetchEvaluationSlice({
    required UserID userId,
    required MediaID mediaId,
  }) async {
    log(name: 'EvaluationRepository', 'fetchEvaluationSlice');
    final evaluations = _evaluationStore.value;
    return evaluations
        .where((_) => _.userId == userId)
        .where((_) => _.media.id == mediaId)
        .firstOrNull;
  }

  @override
  Future<Evaluation?> fetchEvaluation({
    required UserID userId,
    required MediaID mediaId,
  }) async {
    log(name: 'EvaluationRepository', 'fetchEvaluation');
    final evaluations = _evaluationStore.value;
    return evaluations
        .where((_) => _.userId == userId)
        .where((_) => _.media.id == mediaId)
        .where((_) => _.removedAt == null)
        .firstOrNull;
  }

  @override
  Future<void> createEvaluation(
    Evaluation evaluation,
  ) async {
    log(name: 'EvaluationRepository', 'createEvaluation');
    final evaluations = _evaluationStore.value;
    evaluations.add(evaluation);
  }

  @override
  Future<void> updateEvaluation(
    Evaluation evaluation,
  ) async {
    log(name: 'EvaluationRepository', 'updateEvaluation');
    final evaluations = _evaluationStore.value;
    final index = evaluations.indexWhere((_) => _.id == evaluation.id);
    if (index != -1) evaluations[index] = evaluation;
  }

  @override
  Future<void> removeEvaluation(
    Evaluation evaluation,
  ) async {
    log(name: 'EvaluationRepository', 'removeEvaluation');
    final evaluations = _evaluationStore.value;
    evaluations.removeWhere((_) => _.id == evaluation.id);
  }
}

final mockEvaluations = mockMedias.map((media) {
  return Evaluation(
    userId: mockUsers[0].id,
    emotion: Emotion.nice,
    media: EvaluationMedia(
      id: media.id,
      title: media.title,
      image: media.image,
    ),
  );
});
