import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/theme/theme.dart';

part 'profile_controller.g.dart';
part 'profile_state.dart';

@riverpod
class ProfileController extends _$ProfileController {
  @override
  FutureOr<ProfileState> build() async {
    final themes = await ref.watch(getThemesProvider.future);
    final count = await ref.watch(countEvaluationsProvider.future);

    return ProfileState(
      evaluationsCount: count,
      themes: themes,
    );
  }

  // Event: 평가 개수를 갱신해요.
  void onEvaluationsCountUpdated() {
    // * 컨트롤러가 폐기된 경우 작업을 끝내요.
    if (!state.hasValue) return;
    ref.invalidate(countEvaluationsProvider);
  }
}
