import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/core/enums.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/media.dart';

part 'evaluate_media_controller.g.dart';
part 'evaluate_media_state.dart';

@riverpod
class EvaluateMediaController extends _$EvaluateMediaController
    with NotifierMounted {
  @override
  EvaluateMediaState build(MediaID mediaId) {
    _fetch();
    return const EvaluateMediaState(evaluation: null);
  }

  /// 평가를 불러와요.
  Future<void> _fetch() async {
    final evaluation = await ref.watch(fetchEvaluationProvider(
      mediaId: mediaId,
    ).future);

    state = EvaluateMediaState(evaluation: evaluation);
  }

  /// 미디어를 평가해요.
  Future<void> evaluate({required Emotion emotion}) async {
    final previousEvaluation = state.evaluation;
    Evaluation? newEvaluation;

    try {
      // * 평가한 감정이 없거나 감정을 변경한 경우에만 제출해요.
      if (previousEvaluation?.emotion == null ||
          previousEvaluation?.emotion != emotion) {
        final submitted = await ref.read(submitEvaluationProvider(
          mediaId: mediaId,
          emotion: emotion,
        ).future);

        newEvaluation = submitted;
      }
      // * 평가한 감정을 다시 선택한 경우 평가를 제거(취소)해요.
      else {
        await ref.read(removeEvaluationProvider(
          mediaId: mediaId,
        ).future);

        newEvaluation = null;
      }

      // * 컨트롤러가 폐기되지 않은 경우에만 상태를 설정해요.
      if (!mounted) return;
      state = state.copyWith(
        status: EvaluateMediaStatus.success,
        evaluation: newEvaluation,
      );

      // * 에러가 없으면 이전 화면으로 돌아가요.
      ref.read(goRouterProvider).pop();
    } catch (err) {
      state = state.copyWith(
        status: EvaluateMediaStatus.failure,
        errorMessage: err.toString(),
      );
    }
  }
}