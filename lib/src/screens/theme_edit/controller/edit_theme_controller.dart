import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/theme/theme.dart';

import '../../theme/controller/theme_controller.dart';

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
    state = state.copyWith(title: title);
  }

  /// 설명을 수정해요.
  void changeDescription(String description) {
    state = state.copyWith(description: description);
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

      // * 테마 화면의 상태를 갱신해요.
      ref.read(themeControllerProvider(theme.id).notifier).themeUpdated(edited);

      // * 컨트롤러가 폐기된 경우 작업을 끝내요.
      if (!mounted) return;
      state = state.copyWith(status: EditThemeStatus.success);

      // * 테마 화면으로 돌아가요.
      ref.read(goRouterProvider).pop();
    } catch (err) {
      // * 에러가 발생하면 상태를 설정해요.
      state = state.copyWith(
        status: EditThemeStatus.failure,
        errorMessage: err.toString(),
      );
    }
  }

  /// 테마를 삭제해요.
  Future<void> delete() async {
    state = state.copyWith(status: EditThemeStatus.loading);

    try {
      await ref.read(removeThemeProvider(
        id: state.initialTheme.id,
      ).future);

      // * 컨트롤러가 폐기된 경우 작업을 끝내요.
      if (!mounted) return;
      state = state.copyWith(status: EditThemeStatus.success);

      // * 프로필 화면으로 이동해요.
      ref.read(goRouterProvider).goNamed(AppRoutes.profile);
    } catch (err) {
      // * 에러가 발생하면 상태를 설정해요.
      state = state.copyWith(
        status: EditThemeStatus.failure,
        errorMessage: err.toString(),
      );
    }
  }
}
