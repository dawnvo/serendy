import 'package:serendy/features/evaluation/domain/evaluation.dart';

abstract class EvaluationRepository {
  Future<List<Evaluation?>> fetchEvaluationList(String userId);

  Future<Evaluation?> fetchEvaluation(String mediaId);

  Future<void> evaluate(String mediaId, Emotion emotion);

  Future<void> removeEvaluation(String mediaId);
}
