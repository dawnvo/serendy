import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/user/user.dart';

typedef CountEvaluationsPayload = ({
  UserID userId,
});

final class CountEvaluationsUsecase implements UseCase<CountEvaluationsPayload, int> {
  const CountEvaluationsUsecase(this._evaluationRepository);
  final EvaluationRepository _evaluationRepository;

  @override
  Future<int> execute(CountEvaluationsPayload payload) async {
    final count = await _evaluationRepository.countEvaluations(
      userId: payload.userId,
    );
    return count;
  }
}
