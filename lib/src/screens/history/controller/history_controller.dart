import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';

part 'history_controller.g.dart';
part 'history_state.dart';

@riverpod
class HistoryController extends _$HistoryController {
  @override
  FutureOr<HistoryState> build() async {
    final evaluations = await ref.watch(watchMyEvaluationsListProvider.future);
    return HistoryState(evaluations: evaluations);
  }
}
