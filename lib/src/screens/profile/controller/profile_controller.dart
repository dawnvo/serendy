import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/features/user/user.dart';

part 'profile_controller.g.dart';
part 'profile_state.dart';

@riverpod
class ProfileController extends _$ProfileController {
  @override
  FutureOr<ProfileState> build() async {
    final me = await ref.watch(fetchMeProvider.future);
    final count = await ref.watch(countMyEvaluationsProvider.future);
    final themes = await ref.watch(watchMyThemesListProvider.future);

    return ProfileState(
      user: me,
      evaluationsCount: count,
      myThemes: themes,
    );
  }

  Future<void> userProfileUpdated(User user) async {
    // * 컨트롤러를 초기화한 경우에만 상태를 설정해요.
    if (!state.hasValue) return;
    state = AsyncData(state.requireValue.copyWith(user: user));
  }

  void evaluationsCountUpdated() async {
    // * 컨트롤러를 초기화한 경우에만 상태를 설정해요.
    if (!state.hasValue) return;
    ref.invalidate(countMyEvaluationsProvider);
  }
}
