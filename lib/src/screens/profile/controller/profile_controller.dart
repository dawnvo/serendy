import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/features/user/user.dart';

part 'profile_controller.g.dart';
part 'profile_state.dart';

@Riverpod(keepAlive: true)
class ProfileController extends _$ProfileController {
  @override
  FutureOr<ProfileState> build() async {
    final me = await ref.watch(fetchMeProvider.future);
    final themes = await ref.watch(watchMyThemesListProvider.future);
    final count = await ref.watch(countMyEvaluationsProvider.future);

    return ProfileState(
      user: me,
      myThemes: themes,
      evaluationsCount: count,
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
    final prevCount = state.requireValue.evaluationsCount;
    final nextCount = await ref.refresh(countMyEvaluationsProvider.future);

    // * 승급 조건에 충족한 경우 RankUp 화면을 보여줘요.
    final rank = findRankByCount(nextCount);
    if (prevCount < rank.range.min && nextCount == rank.range.min) {
      ref.read(goRouterProvider).pushNamed(AppRoutes.rankUp, extra: rank);
    }
  }
}
