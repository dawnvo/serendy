import 'dart:developer';

import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/infrastructure/media_repository_fake.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/user/infrastructure/user_repository_fake.dart';
import 'package:serendy/src/features/user/user.dart';

final class EvaluationRepositoryFake extends EvaluationRepository {
  EvaluationRepositoryFake();

  final _evaluationStore = InMemoryStore(mockEvaluations);

  @override
  Future<List<Evaluation?>> fetchEvaluations({
    UserID? userId,
    MediaID? mediaId,
    int? page,
    int? perPage,
  }) async {
    log(name: 'Repository', 'fetchEvaluations');
    var evaluations = _evaluationStore.value;
    if (userId != null) evaluations = evaluations.where((_) => _.userId == userId).toList();
    if (mediaId != null) evaluations = evaluations.where((_) => _.media.id == mediaId).toList();
    return evaluations..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
  }

  @override
  Future<int> countEvaluations({
    required UserID userId,
  }) async {
    log(name: 'Repository', 'countEvaluations');
    final evaluations = _evaluationStore.value;
    return evaluations.length + 490;
  }

  @override
  Future<Evaluation?> fetchEvaluationSlice({
    required UserID userId,
    required MediaID mediaId,
  }) async {
    log(name: 'Repository', 'fetchEvaluationSlice');
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
    log(name: 'Repository', 'fetchEvaluation');
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
    log(name: 'Repository', 'createEvaluation');
    final evaluations = _evaluationStore.value;
    evaluations.add(evaluation);
  }

  @override
  Future<void> updateEvaluation(
    Evaluation evaluation,
  ) async {
    log(name: 'Repository', 'updateEvaluation');
    final evaluations = _evaluationStore.value;
    final index = evaluations.indexWhere((_) => _.id == evaluation.id);
    if (index != -1) evaluations[index] = evaluation;
  }

  @override
  Future<void> removeEvaluation(
    Evaluation evaluation,
  ) async {
    log(name: 'Repository', 'removeEvaluation');
    final evaluations = _evaluationStore.value;
    evaluations.removeWhere((_) => _.id == evaluation.id);
  }
}

final mockEvaluations = [
  ...List.filled(
    9,
    Evaluation(
      userId: mockUsers[0].id,
      emotion: Emotion.nice,
      media: EvaluationMedia(
        id: mockMedias[0].id,
        title: mockMedias[0].title,
        image: mockMedias[0].image,
      ),
    ),
  ),
];
