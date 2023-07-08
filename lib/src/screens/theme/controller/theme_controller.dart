import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/features/user/user.dart';

part 'theme_controller.g.dart';
part 'theme_state.dart';

@riverpod
class ThemeController extends _$ThemeController {
  @override
  FutureOr<ThemeState> build(ThemeID id, [Theme? theme]) async {
    theme ??= await ref.watch(fetchThemeProvider(id: id).future);
    final items = await ref.watch(fetchThemeItemsProvider(id: id).future);
    final owner = await ref.watch(fetchUserProvider(
      id: theme!.owner.id,
    ).future);

    return ThemeState(
      theme: theme.copy(items: items),
      owner: owner,
    );
  }

  Future<void> themeUpdated(Theme theme) async {
    // * 컨트롤러를 초기화한 경우에만 상태를 설정해요.
    if (!state.hasValue) return;
    state = AsyncData(state.requireValue.copyWith(theme: theme));
  }
}
