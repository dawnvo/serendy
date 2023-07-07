import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/theme/theme.dart';

part 'create_theme_controller.g.dart';
part 'create_theme_state.dart';

@riverpod
class CreateThemeController extends _$CreateThemeController
    with NotifierMounted {
  @override
  CreateThemeState build() {
    ref.onDispose(setUnmounted);
    return CreateThemeState(
      hintText: Assets.createThemeHints.pickRandomly()!,
    );
  }

  /// 제목을 입력해요.
  void changeTitle(String title) {
    state = state.copyWith(title: title);
  }

  /// 테마를 만들어요.
  Future<void> createTheme() async {
    state = state.copyWith(status: CreateThemeStatus.loading);

    try {
      // * 제목을 입력하지 않으면 힌트가 제목을 대신해요.
      var title = state.title;
      if (title.isEmpty) title = state.hintText;

      await ref.read(createThemeProvider(title: title).future);

      // * 컨트롤러가 폐기되지 않은 경우에만 상태를 설정해요.
      if (!mounted) return;
      state = state.copyWith(status: CreateThemeStatus.success);

      // * 이전 화면으로 돌아가요.
      ref.read(goRouterProvider).pop();
    } catch (err) {
      // * 에러가 발생하면 상태를 설정해요.
      state = state.copyWith(
        status: CreateThemeStatus.failure,
        errorMessage: err.toString(),
      );
    }
  }
}
