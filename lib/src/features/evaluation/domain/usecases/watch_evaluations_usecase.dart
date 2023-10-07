import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/profile/profile.dart';

typedef WatchEvaluationsPayload = ({
  UserID userId,
});

final class WatchEvaluationsUsecase
    implements StreamUseCase<WatchEvaluationsPayload, List<Evaluation?>> {
  const WatchEvaluationsUsecase(this._evaluationRepository);
  final EvaluationRepository _evaluationRepository;

  @override
  Stream<List<Evaluation?>> execute(WatchEvaluationsPayload payload) {
    final evaluations = _evaluationRepository.watchEvaluations(
      userId: payload.userId,
    );
    return evaluations;
  }
}
