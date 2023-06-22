import 'package:serendy/core/domain/usecase.dart';
import 'package:serendy/features/evaluation/evaluation.dart';

typedef CountEvaluationsPayload = ({
  String userId,
});

final class CountEvaluationsUsecase
    implements UseCase<CountEvaluationsPayload, int> {
  const CountEvaluationsUsecase(this._evaluationRepository);
  final EvaluationRepository _evaluationRepository;

  @override
  Future<int> execute(CountEvaluationsPayload payload) async {
    final count = await _evaluationRepository.count(payload.userId);
    return count;
  }
}
