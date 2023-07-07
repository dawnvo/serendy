import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/theme/theme.dart';

part 'discover_controller.g.dart';
part 'discover_state.dart';

@riverpod
class DiscoverController extends _$DiscoverController {
  @override
  FutureOr<DiscoverState> build() async {
    final themes = await ref.watch(fetchThemesListProvider.future);
    return DiscoverState(themes: themes);
  }
}
