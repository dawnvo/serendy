import 'package:serendy/_mock.dart';
import 'package:serendy/features/evaluation/domain/evaluation.dart';

final class EvaluationRepository {
  final List<Evaluation?> _evaluations = [evaluationMock];

  Future<List<Evaluation?>> fetchEvaluationList() async {
    return Future.value(_evaluations);
  }

  Stream<List<Evaluation?>> watchEvaluationList() async* {
    yield _evaluations;
  }

  Future<Evaluation?> fetchEvaluation(String id) async {
    return Future.value(_evaluations[0]);
  }

  Stream<Evaluation?> watchEvaluation(String id) {
    return watchEvaluationList().map((evaluation) => evaluation[0]);
  }

  Future<void> createEvaluation(String id, String imageUrl) {
    throw UnimplementedError();
  }

  Future<void> updateEvaluation(Evaluation evalEvaluation) {
    throw UnimplementedError();
  }

  Future<void> deleteEvaluation(String id) {
    throw UnimplementedError();
  }
}
