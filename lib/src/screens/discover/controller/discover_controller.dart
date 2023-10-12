import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/theme/theme.dart';

part 'discover_controller.g.dart';
part 'discover_state.dart';

@riverpod
class DiscoverController extends _$DiscoverController {
  @override
  FutureOr<DiscoverState> build() async {
    // * 추천 테마를 불러와요.
    final themes = await ref.watch(getThemesProvider().future);
    // * loaded
    return DiscoverState(themes: themes);
  }

  /// 테마를 더 불러와요.
  Future<void> fetchMore() async {
    // * 컨트롤러가 폐기된 경우 작업을 끝내요.
    if (!state.hasValue) return;

    final nextPage = state.requireValue.page + 1;
    final prevThemes = state.requireValue.themes;

    state = await AsyncValue.guard(() async {
      // * 미디어를 불러와요.
      final themes = await ref.watch(getThemesProvider(
        page: nextPage,
      ).future);

      // * loaded
      return state.requireValue.copyWith(
        page: nextPage,
        themes: [...prevThemes, ...themes],
      );
    });
  }
}
