import 'package:serendy/core/core.dart';
import 'package:serendy/features/evaluation/data/evaluation_repository.dart';
import 'package:serendy/features/evaluation/domain/evaluation.dart';
import 'package:serendy/features/media/data/media_repository.dart';
import 'package:serendy/features/media/domain/media.dart';
import 'package:serendy/features/user/data/user_repository.dart';
import 'package:serendy/features/user/domain/user.dart';

typedef EvaluatePayload = ({
  String executorId,
  String mediaId,
  Emotion emotion,
});

/// Evaluate
///
/// 1. 과거에 평가를 했었는지 확인해요.
/// 2. 평가를 했었다면, 평가를 갱신해요.
/// 3. 평가를 안했다면, 평가를 생성해요.
typedef EvaluateUseCase = UseCase<EvaluatePayload, Evaluation>;

final class EvaluateService implements EvaluateUseCase {
  const EvaluateService(
    this._evaluationRepository,
    this._userRepository,
    this._mediaRepository,
  );

  final EvaluationRepository _evaluationRepository;
  final UserRepository _userRepository;
  final MediaRepository _mediaRepository;

  @override
  Future<Evaluation> execute(EvaluatePayload payload) async {
    final Evaluation evaluation;

    // [1]
    final doesEvaluationExist =
        await _evaluationRepository.fetchEvaluation(payload.executorId);

    // [2]
    if (doesEvaluationExist != null) {
      evaluation = await emotionChanged(payload, doesEvaluationExist);
    }
    // [3]
    else {
      evaluation = await evaluationCreated(payload);
    }

    return evaluation;
  }

  /// Create evaluation
  Future<Evaluation> evaluationCreated(EvaluatePayload payload) async {
    // 1. 사용자가 존재하는지 확인해요.
    final user = CoreAssert.notEmpty<User>(
      await _userRepository.fetchUser(payload.executorId),
      Exception("사용자를 찾을 수 없어요."),
    );

    // 2. 미디어가 존재하는지 확인해요.
    final media = CoreAssert.notEmpty<Media>(
      await _mediaRepository.fetchMedia(payload.mediaId),
      Exception("미디어를 찾을 수 없어요."),
    );

    // 3. 평가를 생성해요.
    final evaluation = Evaluation(
      media: MediaItem(
        id: media.id,
        title: media.title,
        image: media.image,
      ),
      userId: user.id,
      emotion: payload.emotion,
    );

    await _evaluationRepository.createEvaluation(evaluation);

    return evaluation;
  }

  /// Update evaluation
  Future<Evaluation> emotionChanged(
      EvaluatePayload payload, Evaluation evaluation) async {
    // 1. 올바른 실행자인지 확인해요.
    final hasAccess = payload.executorId == evaluation.userId;
    CoreAssert.isTrue(hasAccess, Exception('접근 권한이 없어요.'));

    // 2. 감정을 변경해요.
    Evaluation changed = evaluation.changeEmotion(payload.emotion);

    // 3. 평가를 제거했었으면 복구해요.
    if (evaluation.removedAt != null) {
      changed = changed.restore();
    }

    await _evaluationRepository.updateEvaluation(changed);

    return changed;
  }
}
