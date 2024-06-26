import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/theme/theme.dart';

part 'theme_controller.g.dart';
part 'theme_state.dart';

@riverpod
class ThemeController extends _$ThemeController {
  @override
  FutureOr<ThemeState> build(ThemeID id, [Theme? theme]) async {
    // * 이미 테마를 불러온 경우 재사용해요.
    // * 특수 경로로 유입한 경우 새로 불러와요.
    theme ??= await ref.watch(getThemeProvider(id: id).future);

    // * 테마 항목을 불러와요.
    final items = await ref.watch(getThemeItemsProvider(id: id).future);

    // * loaded
    return ThemeState(theme: theme!.copy(items: items));
  }

  /// [EVENT] 테마를 갱신해요.
  void onThemeUpdated(Theme theme) {
    // * 컨트롤러가 폐기된 경우 작업을 끝내요.
    if (!state.hasValue) return;

    // * 받아온 테마에 항목이 없으면, 본래 항목을 사용해요.
    if (theme.items.isEmpty) {
      theme = theme.copy(items: state.requireValue.theme.items);
    }

    // * loaded
    state = AsyncValue.data(state.requireValue.copyWith(theme: theme));
  }

  /// [EVENT] 테마 항목을 갱신해요.
  void onThemeItemsUpdated() {
    // * 컨트롤러가 폐기된 경우 작업을 끝내요.
    if (!state.hasValue) return;
    // * 관련 공급자를 새로고침(초기화)해요.
    ref.invalidate(getThemeItemsProvider(id: id));
  }
}
