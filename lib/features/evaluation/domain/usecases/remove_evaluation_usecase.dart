import 'package:serendy/core/domain/assert.dart';
import 'package:serendy/core/domain/usecase.dart';
import 'package:serendy/core/exceptions/core_exception.dart';
import 'package:serendy/features/evaluation/evaluation.dart';

typedef RemoveEvaluationPayload = ({
  String executorId,
  String mediaId,
});

final class RemoveEvaluationUsecase
    implements UseCase<RemoveEvaluationPayload, void> {
  const RemoveEvaluationUsecase(this._evaluationRepository);
  final EvaluationRepository _evaluationRepository;

  @override
  Future<void> execute(RemoveEvaluationPayload payload) async {
    // 평가를 찾을 수 없으면 예외 처리
    final evaluation = CoreAssert.notEmpty<Evaluation>(
      await _evaluationRepository.findOne(payload.executorId, payload.mediaId),
      const EntityNotFoundException(overrideMessage: "평가를 찾을 수 없어요."),
    );

    // 권한이 없으면 예외 처리
    final hasAccess = payload.executorId == evaluation.userId;
    CoreAssert.isTrue(hasAccess, const AccessDeniedException());

    final removed = evaluation.remove();
    await _evaluationRepository.update(removed);
  }
}
