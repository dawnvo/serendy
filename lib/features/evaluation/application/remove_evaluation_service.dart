import 'package:serendy/core/core.dart';
import 'package:serendy/features/evaluation/data/evaluation_repository.dart';
import 'package:serendy/features/evaluation/domain/evaluation.dart';

typedef RemoveEvaluationPayload = ({
  String executorId,
  String mediaId,
});

/// Remove evaluation
///
/// 1. 평가가 존재하는지 확인해요.
/// 2. 올바른 실행자인지 확인해요.
/// 3. 평가를 제거해요.
typedef RemoveEvaluationUseCase = UseCase<RemoveEvaluationPayload, void>;

final class RemoveEvaluationService implements RemoveEvaluationUseCase {
  const RemoveEvaluationService(
    this._evaluationRepository,
  );

  final EvaluationRepository _evaluationRepository;

  @override
  Future<void> execute(RemoveEvaluationPayload payload) async {
    // [1]
    final evaluation = CoreAssert.notEmpty(
      await _evaluationRepository.fetchEvaluation(payload.executorId),
      Exception("평가를 찾을 수 없어요."),
    );

    // [2]
    final hasAccess = payload.executorId == evaluation.userId;
    CoreAssert.isTrue(hasAccess, Exception('접근 권한이 없어요.'));

    // [3]
    final removed = evaluation.remove();
    await _evaluationRepository.updateEvaluation(removed);
  }
}
