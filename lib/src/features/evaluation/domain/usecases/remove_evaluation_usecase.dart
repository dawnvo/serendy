import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/user/user.dart';

typedef RemoveEvaluationPayload = ({
  UserID executorId,
  MediaID mediaId,
});

final class RemoveEvaluationUsecase implements UseCase<RemoveEvaluationPayload, Evaluation> {
  const RemoveEvaluationUsecase(this._evaluationRepository);
  final EvaluationRepository _evaluationRepository;

  @override
  Future<Evaluation> execute(RemoveEvaluationPayload payload) async {
    // * 평가가 존재하는지 확인해요.
    final evaluation = CoreAssert.notEmpty<Evaluation>(
      await _evaluationRepository.fetchEvaluationSlice(
        userId: payload.executorId,
        mediaId: payload.mediaId,
      ),
      const EntityNotFoundException(overrideMessage: "평가를 찾을 수 없어요."),
    );

    // * 올바른 실행자인지 확인해요.
    final hasAccess = payload.executorId == evaluation.userId;
    CoreAssert.isTrue(hasAccess, const AccessDeniedException());

    // * 평가를 제거해요.
    final removed = evaluation.remove();

    // * commit
    await _evaluationRepository.removeEvaluation(removed);
    return removed;
  }
}
