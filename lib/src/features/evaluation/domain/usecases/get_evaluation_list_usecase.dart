import 'package:serendy/src/core/domain/usecase.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';

typedef GetEvaluationListPayload = ({
  String mediaId,
});

final class GetEvaluationListUsecase
    implements UseCase<GetEvaluationListPayload, List<Evaluation?>> {
  const GetEvaluationListUsecase(this._evaluationRepository);
  final EvaluationRepository _evaluationRepository;

  @override
  Future<List<Evaluation?>> execute(GetEvaluationListPayload payload) {
    final evaluations = _evaluationRepository.findMany(payload.mediaId);
    return evaluations;
  }
}
