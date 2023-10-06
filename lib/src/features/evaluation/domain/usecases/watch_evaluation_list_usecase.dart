import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/profile/profile.dart';

typedef WatchEvaluationListPayload = ({
  UserID userId,
});

final class WatchEvaluationListUsecase
    implements StreamUseCase<WatchEvaluationListPayload, List<Evaluation?>> {
  const WatchEvaluationListUsecase(this._evaluationRepository);
  final EvaluationRepository _evaluationRepository;

  @override
  Stream<List<Evaluation?>> execute(WatchEvaluationListPayload payload) {
    final evaluations = _evaluationRepository.watchEvaluationsList(
      userId: payload.userId,
    );
    return evaluations;
  }
}
