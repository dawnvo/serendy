import 'package:serendy/core/domain/usecase.dart';
import 'package:serendy/features/evaluation/evaluation.dart';

typedef GetEvaluationPayload = ({
  String userId,
  String mediaId,
});

final class GetEvaluationUsecase
    implements UseCase<GetEvaluationPayload, Evaluation?> {
  const GetEvaluationUsecase(this._evaluationRepository);
  final EvaluationRepository _evaluationRepository;

  @override
  Future<Evaluation?> execute(GetEvaluationPayload payload) async {
    final evaluation = await _evaluationRepository.findOne(
      payload.userId,
      payload.mediaId,
    );
    return evaluation;
  }
}
