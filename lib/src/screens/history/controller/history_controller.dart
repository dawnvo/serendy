import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';

part 'history_controller.g.dart';
part 'history_state.dart';

@riverpod
class HistoryController extends _$HistoryController {
  @override
  FutureOr<HistoryState> build() async {
    // * 내 평가 개수를 불러와요.
    final evaluationsCount = await ref.watch(
      countEvaluationsProvider.future,
    );
    // * 내 평가를 불러와요.
    final evaluations = await ref.watch(
      getEvaluationsProvider(page: 0).future,
    );

    // * loaded
    return HistoryState(
      evaluationsCount: evaluationsCount,
      evaluations: evaluations,
    );
  }

  /// 평가를 더 불러와요.
  Future<void> fetchMore() async {
    // * 컨트롤러가 폐기된 경우 작업을 끝내요.
    if (!state.hasValue) return;

    final evaluations = state.requireValue.evaluations;
    final nextPage = state.requireValue.page + 1;

    state = await AsyncValue.guard(() async {
      // * 미디어를 불러와요.
      final newEvaluations = await ref.watch(getEvaluationsProvider(
        page: nextPage,
      ).future);

      // * loaded
      return state.requireValue.copyWith(
        evaluations: [...evaluations, ...newEvaluations],
        page: nextPage,
        isCompleted: newEvaluations.isEmpty,
      );
    });
  }

  bool canLoadMore() {
    if (state.isLoading) return false;
    if (!state.hasValue) return false;
    if (state.requireValue.isCompleted) return false;
    return true;
  }
}
