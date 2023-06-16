import 'package:serendy/core/core.dart';
import 'package:serendy/features/evaluation/data/evaluation_repository.dart';
import 'package:serendy/features/evaluation/domain/evaluation.dart';

typedef GetEvaluationPayload = ({
  String executorId,
  String mediaId,
});

/// Get evaluation
///
/// 1. 평가를 조회해요.
/// 2. 평가가 없거나, 제거한 평가라면 종료해요.
typedef GetEvaluationUseCase = UseCase<GetEvaluationPayload, Evaluation?>;

final class GetEvaluationService implements GetEvaluationUseCase {
  const GetEvaluationService(this._evaluationRepository);

  final EvaluationRepository _evaluationRepository;

  @override
  Future<Evaluation?> execute(GetEvaluationPayload payload) async {
    // [1]
    final evaluation = await _evaluationRepository.fetchEvaluation(
      payload.executorId,
      // payload.mediaId,
    );

    // [2]
    if (evaluation == null || evaluation.removedAt != null) {
      return null;
    }

    return evaluation;
  }
}
