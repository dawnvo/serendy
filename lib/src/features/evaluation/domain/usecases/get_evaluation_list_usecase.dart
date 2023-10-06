import 'package:serendy/src/core/domain/usecase.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/media.dart';

typedef GetEvaluationListPayload = ({
  MediaID mediaId,
});

final class GetEvaluationListUsecase
    implements UseCase<GetEvaluationListPayload, List<Evaluation?>> {
  const GetEvaluationListUsecase(this._evaluationRepository);
  final EvaluationRepository _evaluationRepository;

  @override
  Future<List<Evaluation?>> execute(GetEvaluationListPayload payload) {
    final evaluations = _evaluationRepository.fetchEvaluationsList(
      mediaId: payload.mediaId,
    );
    return evaluations;
  }
}
