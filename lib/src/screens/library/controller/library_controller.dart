import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/theme/theme.dart';

part 'library_controller.g.dart';
part 'library_state.dart';

@riverpod
class LibraryController extends _$LibraryController {
  @override
  FutureOr<LibraryState> build() async {
    // * 내 평가 개수를 불러와요.
    final evaluationsCount = await ref.watch(countEvaluationsProvider.future);

    // * 내 테마를 불러와요.
    final themes = await ref.watch(getMyThemesProvider.future);

    // * loaded
    return LibraryState(
      evaluationsCount: evaluationsCount,
      themes: themes,
    );
  }

  /// [EVENT] 나의 테마 목록을 갱신해요.
  void onMyThemesUpdated() {
    // * 컨트롤러가 초기화됐다면 공급자를 새로고침해요.
    if (!state.hasValue) return;
    ref.invalidate(getMyThemesProvider);
  }
}
