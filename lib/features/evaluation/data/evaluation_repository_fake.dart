import 'package:serendy/_mock.dart';
import 'package:serendy/features/evaluation/data/evaluation_repository.dart';
import 'package:serendy/features/evaluation/domain/evaluation.dart';

final class EvaluationRepositoryFake extends EvaluationRepository {
  final List<Evaluation?> _evaluations = [evaluationMock];

  @override
  Future<List<Evaluation?>> fetchEvaluationList() async {
    return _evaluations;
  }

  @override
  Stream<List<Evaluation?>> watchEvaluationList() async* {
    yield _evaluations;
  }

  @override
  Future<Evaluation?> fetchEvaluation(String id) async {
    return _evaluations[0];
  }

  @override
  Stream<Evaluation?> watchEvaluation(String id) {
    return watchEvaluationList().map((evaluations) => evaluations[0]);
  }

  @override
  Future<void> createEvaluation(Evaluation evaluation) async {
    _evaluations.add(evaluation);
  }

  @override
  Future<void> updateEvaluation(Evaluation evaluation) async {
    final index = _evaluations.indexWhere((e) => e?.id == evaluation.id);
    if (index == -1) return;

    _evaluations[index] = evaluation;
  }

  @override
  Future<void> removeEvaluation(Evaluation evaluation) async {
    _evaluations.removeWhere((e) => e?.id == evaluation.id);
  }
}
