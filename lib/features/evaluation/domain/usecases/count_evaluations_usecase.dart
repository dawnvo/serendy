import 'package:serendy/core/domain/usecase.dart';
import 'package:serendy/features/evaluation/domain/ports/persistence/evaluation_repository_port.dart';
import 'package:serendy/features/evaluation/domain/ports/count_evaluations_port.dart';

final class CountEvaluationsUsecase
    implements UseCase<CountEvaluationsPort, int> {
  const CountEvaluationsUsecase(this._evaluationRepository);

  final EvaluationRepositoryPort _evaluationRepository;

  @override
  Future<int> execute(CountEvaluationsPort payload) async {
    final count = await _evaluationRepository.count(payload.userId);
    return count;
  }
}
