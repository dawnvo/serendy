import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';

part 'history_controller.g.dart';
part 'history_state.dart';

@riverpod
class HistoryController extends _$HistoryController {
  @override
  FutureOr<HistoryState> build() async {
    // * LODING
    state = const AsyncValue.loading();

    final evaluationsCount = await ref.watch(countEvaluationsProvider.future);

    // * 내 평가를 여럿 불러와요.
    final evaluations = await ref.watch(watchEvaluationsListProvider.future);

    // * LOADED
    return HistoryState(
      evaluationsCount: evaluationsCount,
      evaluations: evaluations,
    );
  }
}
