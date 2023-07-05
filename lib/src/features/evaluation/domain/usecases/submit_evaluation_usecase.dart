import 'package:serendy/src/core/domain/assert.dart';
import 'package:serendy/src/core/domain/usecase.dart';
import 'package:serendy/src/core/enums.dart';
import 'package:serendy/src/core/exceptions/core_exception.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/user/user.dart';

typedef SubmitEvaluationPayload = ({
  String executorId,
  String mediaId,
  Emotion emotion,
});

final class SubmitEvaluationUsecase
    implements UseCase<SubmitEvaluationPayload, Evaluation> {
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

    final doesEvaluationExist = await _evaluationRepository.findOne(
      payload.executorId,
      payload.mediaId,
    );

    if (doesEvaluationExist != null) {
      // 평가한 적이 있으면, 평가를 갱신합니다.
      evaluation = await changeEmotion(payload, doesEvaluationExist);
    } else {
      // 평가한 적이 없으면, 새롭게 만듭니다.
      evaluation = await createEvaluation(payload);
    }

    return evaluation;
  }

  Future<Evaluation> changeEmotion(
    SubmitEvaluationPayload payload,
    Evaluation evaluation,
  ) async {
    // 권한이 없으면 예외 처리
    CoreAssert.isTrue(
      payload.executorId == evaluation.userId,
      const AccessDeniedException(),
    );

    // 평가 수정
    Evaluation changed = evaluation.changeEmotion(payload.emotion);

    // 제거한 적이 있으면, 생성 날짜를 갱신
    if (evaluation.removedAt != null) {
      changed = changed.restore();
    }

    await _evaluationRepository.update(changed);

    return changed;
  }

  Future<Evaluation> createEvaluation(
    SubmitEvaluationPayload payload,
  ) async {
    // 사용자를 찾을 수 없으면 예외 처리
    final user = CoreAssert.notEmpty<User>(
      await _userRepository.findOne(payload.executorId),
      const EntityNotFoundException(overrideMessage: "사용자를 찾을 수 없어요."),
    );

    // 미디어를 찾을 수 없으면 예외 처리
    final media = CoreAssert.notEmpty<Media>(
      await _mediaRepository.findOne(payload.mediaId),
      const EntityNotFoundException(overrideMessage: "미디어를 찾을 수 없어요."),
    );

    // 평가 생성
    final evaluation = Evaluation(
      emotion: payload.emotion,
      userId: user.id,
      media: MediaInfo(
        id: media.id,
        title: media.title,
        image: media.images.largeImageUrl,
      ),
    );

    await _evaluationRepository.create(evaluation);

    return evaluation;
  }
}
