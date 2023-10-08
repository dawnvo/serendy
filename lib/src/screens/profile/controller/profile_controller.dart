import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/theme/theme.dart';

part 'profile_controller.g.dart';
part 'profile_state.dart';

@riverpod
class ProfileController extends _$ProfileController {
  @override
  FutureOr<ProfileState> build() async {
    // * 내 평가 개수를 불러와요.
    final evaluationsCount = await ref.watch(countEvaluationsProvider.future);

    // * 내 테마를 불러와요.
    final themes = await ref.watch(getThemesProvider.future);

    // * loaded
    return ProfileState(
      evaluationsCount: evaluationsCount,
      themes: themes,
    );
  }

  /// [EVENT] 평가 개수를 갱신해요.
  void onEvaluationsCountUpdated() {
    // * 컨트롤러가 폐기된 경우 작업을 끝내요.
    if (!state.hasValue) return;

    // * 해당 공급자를 새로고침(초기화)해요.
    ref.invalidate(countEvaluationsProvider);
  }

  /// [EVENT] 나의 테마 목록을 갱신해요.
  Future<void> onMyThemesUpdated() async {
    // * 컨트롤러가 초기화됐다면 해당 공급자를 새로고침해요.
    if (!state.hasValue) return;
    ref.invalidate(getThemesProvider);
  }
}
