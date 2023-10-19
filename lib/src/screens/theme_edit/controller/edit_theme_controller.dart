import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/theme/theme.dart';

part 'edit_theme_controller.g.dart';
part 'edit_theme_state.dart';

@riverpod
class EditThemeController extends _$EditThemeController with NotifierMounted {
  @override
  EditThemeState build(Theme theme) {
    ref.onDispose(setUnmounted);
    return EditThemeState(
      initialTheme: theme,
      image: theme.image,
      title: theme.title,
      description: theme.description,
      private: theme.private,
    );
  }

  /// 이미지를 변경해요.
  void changeImage(String? imagePath) {
    state = state.copyWith(image: imagePath);
  }

  /// 제목을 수정해요.
  void changeTitle(String title) {
    state = state.copyWith(title: title.trim());
  }

  /// 설명을 수정해요.
  void changeDescription(String description) {
    state = state.copyWith(description: description.trim());
  }

  /// 상태를 변경해요.
  void changePrivacyStatus(bool private) {
    state = state.copyWith(private: private);
  }

  /// 테마를 수정해요.
  Future<void> submit() async {
    state = state.copyWith(status: EditThemeStatus.loading);

    try {
      // * 테마를 수정해요.
      final edited = await ref.read(editThemeProvider(
        id: theme.id,
        image: state.image,
        title: state.title,
        description: state.description,
        private: state.private,
      ).future);

      // * 컨트롤러가 폐기된 경우 작업을 끝내요.
      if (!mounted) return;

      // * loaded
      state = state.copyWith(
        status: EditThemeStatus.success,
        editedTheme: edited,
      );

      // * 이전 화면으로 돌아가요.
      ref.read(goRouterProvider).pop();

      // * failure
    } catch (err) {
      state = state.copyWith(
        status: EditThemeStatus.failure,
        errorMessage: err.toString(),
      );
    }
  }

  /// 테마를 삭제해요.
  Future<void> remove() async {
    state = state.copyWith(status: EditThemeStatus.loading);

    try {
      // * 테마를 제거해요.
      await ref.read(removeThemeProvider(
        id: state.initialTheme.id,
      ).future);

      // * 컨트롤러가 폐기된 경우 작업을 끝내요.
      if (!mounted) return;

      // * loaded
      state = state.copyWith(
        status: EditThemeStatus.success,
        editedTheme: null,
      );

      // * 프로필 화면으로 이동해요.
      ref.read(goRouterProvider).goNamed(AppRoutes.library);

      // * failure
    } catch (err) {
      state = state.copyWith(
        status: EditThemeStatus.failure,
        errorMessage: err.toString(),
      );
    }
  }
}
