import 'package:serendy/core/domain/usecase.dart';
import 'package:serendy/features/evaluation/evaluation.dart';

typedef GetEvaluationListPayload = ({
  String? userId,
  String? mediaId,
});

final class GetEvaluationListUsecase
    implements UseCase<GetEvaluationListPayload, List<Evaluation?>> {
  const GetEvaluationListUsecase(this._evaluationRepository);
  final EvaluationRepository _evaluationRepository;

  @override
  Future<List<Evaluation?>> execute(GetEvaluationListPayload payload) {
    final evaluations = _evaluationRepository.findMany(
      userId: payload.userId,
      mediaId: payload.mediaId,
    );
    return evaluations;
  }
}
