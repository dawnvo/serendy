import 'package:serendy/src/core/domain/usecase.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';

typedef WatchEvaluationListPayload = ({
  String userId,
});

final class WatchEvaluationListUsecase
    implements StreamUseCase<WatchEvaluationListPayload, List<Evaluation?>> {
  const WatchEvaluationListUsecase(this._evaluationRepository);
  final EvaluationRepository _evaluationRepository;

  @override
  Stream<List<Evaluation?>> execute(WatchEvaluationListPayload payload) {
    final evaluations = _evaluationRepository.watchMany(payload.userId);
    return evaluations;
  }
}
