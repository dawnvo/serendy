import 'package:serendy/core/usecase.dart';
import 'package:serendy/features/evaluation/data/evaluation_repository.dart';
import 'package:serendy/features/evaluation/domain/evaluation.dart';

typedef GetEvaluationsListPayload = ({
  String executorId,
  String userId,
});

/// Get evaluation list
///
/// 1. 평가를 조회해요.
/// -. 제거한 평가는 조회하지 않아요.
/// -. 비공개 평가는 소유자만 조회할 수 있어요.
typedef GetEvaluationsListUseCase
    = UseCase<GetEvaluationsListPayload, List<Evaluation?>>;

final class GetEvaluationsListService implements GetEvaluationsListUseCase {
  const GetEvaluationsListService(this._evaluationRepository);

  final EvaluationRepository _evaluationRepository;

  @override
  Future<List<Evaluation?>> execute(GetEvaluationsListPayload payload) async {
    // [1]
    final evaluations = await _evaluationRepository.fetchEvaluationList(
        // payload.userId,
        );
    return evaluations;
  }
}
