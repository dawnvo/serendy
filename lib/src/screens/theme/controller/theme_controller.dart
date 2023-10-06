import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/features/profile/profile.dart';

part 'theme_controller.g.dart';
part 'theme_state.dart';

@riverpod
class ThemeController extends _$ThemeController {
  @override
  FutureOr<ThemeState> build(ThemeID id, [Theme? theme]) async {
    theme ??= await ref.watch(fetchThemeProvider(id: id).future);
    final items = await ref.watch(fetchThemeItemsProvider(id: id).future);
    final owner = await ref.watch(fetchProfileProvider(
      id: theme!.owner.id,
    ).future);

    return ThemeState(
      theme: theme.copy(items: items),
      owner: owner,
    );
  }

  Future<void> themeUpdated(Theme theme) async {
    List<ThemeItem?>? themeItems;
    if (theme.items.isEmpty) {
      themeItems = state.requireValue.theme.items;
    }

    // * 컨트롤러가 폐기된 경우 작업을 끝내요.
    if (!state.hasValue) return;
    state = AsyncData(state.requireValue.copyWith(
      theme: theme.copy(items: themeItems),
    ));
  }
}
