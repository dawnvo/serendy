import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/media.dart';

part 'evaluate_media_controller.g.dart';
part 'evaluate_media_state.dart';

@riverpod
class EvaluateMediaController extends _$EvaluateMediaController with NotifierMounted {
  @override
  EvaluateMediaState build(MediaID mediaId) {
    // * initialize
    ref.onDispose(setUnmounted);

    // * lazy Loading
    _fetchEvaluation();
    return const EvaluateMediaState(evaluation: null);
  }

  /// 평가를 불러와요.
  Future<void> _fetchEvaluation() async {
    // * 내 평가를 불러와요.
    final evaluation = await ref.watch(getEvaluationProvider(
      mediaId: mediaId,
    ).future);

    // * loaded
    state = EvaluateMediaState(evaluation: evaluation);
  }

  /// 작품을 평가해요.
  Future<void> evaluate({required Emotion emotion}) async {
    final previousEvaluation = state.evaluation;
    Evaluation? newEvaluation;

    try {
      // * 평가한 감정이 없거나
      // * 평가를 변경한 경우에만 제출해요.
      if (previousEvaluation?.emotion == null || //
          previousEvaluation?.emotion != emotion) {
        final submitted = await ref.read(submitEvaluationProvider(
          mediaId: mediaId,
          emotion: emotion,
        ).future);

        newEvaluation = submitted;
      }

      // * 동일한 감정을 선택한 경우 평가를 취소해요.
      else if (previousEvaluation?.emotion == emotion) {
        await ref.read(removeEvaluationProvider(
          mediaId: mediaId,
        ).future);

        newEvaluation = null;
      }

      // * 컨트롤러가 폐기된 경우 작업을 끝내요.
      if (!mounted) return;

      // * loaded
      state = state.copyWith(
        status: EvaluateMediaStatus.success,
        evaluation: newEvaluation,
      );

      // * 이전 화면으로 돌아가요.
      ref.read(goRouterProvider).pop();

      // * failure
    } catch (err) {
      state = state.copyWith(
        status: EvaluateMediaStatus.failure,
        errorMessage: err.toString(),
      );
    }
  }
}
