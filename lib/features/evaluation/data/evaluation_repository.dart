import 'package:serendy/features/evaluation/domain/evaluation.dart';

abstract class EvaluationRepository {
  Future<List<Evaluation?>> fetchEvaluationList();

  Stream<List<Evaluation?>> watchEvaluationList();

  Future<Evaluation?> fetchEvaluation(String id);

  Stream<Evaluation?> watchEvaluation(String id);

  Future<void> createEvaluation(Evaluation evaluation);

  Future<void> updateEvaluation(Evaluation evaluation);

  Future<void> removeEvaluation(Evaluation evaluation);
}
