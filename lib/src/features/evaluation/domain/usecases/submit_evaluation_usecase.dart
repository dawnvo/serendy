import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/user/user.dart';

typedef SubmitEvaluationPayload = ({
  UserID executorId,
  MediaID mediaId,
  Emotion emotion,
});

final class SubmitEvaluationUsecase implements UseCase<SubmitEvaluationPayload, Evaluation> {
  const SubmitEvaluationUsecase(
    this._evaluationRepository,
    this._userRepository,
    this._mediaRepository,
  );

  final EvaluationRepository _evaluationRepository;
  final UserRepository _userRepository;
  final MediaRepository _mediaRepository;

  @override
  Future<Evaluation> execute(SubmitEvaluationPayload payload) async {
    final Evaluation evaluation;

    // * 평가가 존재하는지 확인해요.
    final doesEvaluationExist = await _evaluationRepository.fetchEvaluationSlice(
      userId: payload.executorId,
      mediaId: payload.mediaId,
    );

    // * 평가한 적이 있으면 평가를 갱신해요.
    if (doesEvaluationExist != null) {
      evaluation = await _changeEmotion(payload, doesEvaluationExist);
    }
    // * 평가한 적이 없으면 새롭게 만들어요.
    else {
      evaluation = await _createEvaluation(payload);
    }

    return evaluation;
  }

  /**
   * 평가 감정을 변경해요.
   */
  Future<Evaluation> _changeEmotion(
    SubmitEvaluationPayload payload,
    Evaluation evaluation,
  ) async {
    // * 올바른 실행자인지 확인해요.
    CoreAssert.isTrue(
      payload.executorId == evaluation.userId,
      const AccessDeniedException(),
    );

    // * 감정을 변경해요.
    Evaluation changed = evaluation.changeEmotion(payload.emotion);

    // * 제거한 기록이 존재하면 복원해요.
    if (evaluation.removedAt != null) {
      changed = changed.restore();
    }

    // * commit
    await _evaluationRepository.updateEvaluation(changed);
    return changed;
  }

  /**
   * 평가를 생성해요.
   */
  Future<Evaluation> _createEvaluation(
    SubmitEvaluationPayload payload,
  ) async {
    // * 사용자가 존재하는지 확인해요.
    final user = CoreAssert.notEmpty<User>(
      await _userRepository.fetchUser(id: payload.executorId),
      const EntityNotFoundException(overrideMessage: "사용자를 찾을 수 없어요."),
    );

    // * 작품이 존재하는지 확인해요.
    final media = CoreAssert.notEmpty<Media>(
      await _mediaRepository.fetchMediaSlice(id: payload.mediaId),
      const EntityNotFoundException(overrideMessage: "작품을 찾을 수 없어요."),
    );

    // * 평가 인스턴스를 생성해요.
    final evaluation = Evaluation(
      media: EvaluationMedia(
        id: media.id,
        title: media.title,
        image: media.image,
      ),
      userId: user.id,
      emotion: payload.emotion,
    );

    // * commit
    await _evaluationRepository.createEvaluation(evaluation);
    return evaluation;
  }
}
