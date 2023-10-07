import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/media.dart';

typedef GetEvaluationsPayload = ({
  MediaID mediaId,
});

final class GetEvaluationsUsecase implements UseCase<GetEvaluationsPayload, List<Evaluation?>> {
  const GetEvaluationsUsecase(this._evaluationRepository);
  final EvaluationRepository _evaluationRepository;

  @override
  Future<List<Evaluation?>> execute(GetEvaluationsPayload payload) {
    final evaluations = _evaluationRepository.fetchEvaluations(
      mediaId: payload.mediaId,
    );
    return evaluations;
  }
}
