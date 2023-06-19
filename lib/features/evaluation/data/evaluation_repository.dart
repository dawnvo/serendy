import 'package:serendy/features/evaluation/domain/evaluation.dart';

abstract class EvaluationRepository {
  Future<List<Evaluation?>> fetchEvaluationList({
    String? userId,
    String? mediaId,
  });

  Future<Evaluation?> fetchEvaluation(String mediaId);

  Future<Evaluation> evaluate(String mediaId, Emotion emotion);

  Future<void> removeEvaluation(String mediaId);
}
