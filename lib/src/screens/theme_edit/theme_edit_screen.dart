import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/widgets/widgets.dart';

import '../library/controller/library_controller.dart';
import '../theme/controller/theme_controller.dart';
import 'controller/edit_theme_controller.dart';

part 'widgets/_image_picker.dart';
part 'widgets/_privacy_status_tile.dart';
part 'widgets/_remove_tile.dart';
part 'widgets/_save_button.dart';
part 'widgets/_title_text_field.dart';

class EditThemeScreen extends ConsumerWidget {
  static const String routeName = 'edit-theme';
  static const String routeLocation = 'edit';
  const EditThemeScreen({required this.theme});

  final Theme theme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = editThemeControllerProvider(theme);

    ref.listen(provider, (previous, next) {
      //success
      if (next.status == EditThemeStatus.success) {
        // * [EVENT] 나의 테마 목록을 갱신해요.
        ref //
            .read(libraryControllerProvider.notifier)
            .onMyThemesUpdated();

        // * 편집하지 않은 경우 작업을 끝내요. (테마 삭제 등)
        if (next.editedTheme == null) return;

        // * [EVENT] 테마 정보를 갱신해요.
        ref //
            .read(themeControllerProvider(theme.id, theme).notifier)
            .onThemeUpdated(next.editedTheme!);
      }
      //failure
      else if (next.status == EditThemeStatus.failure) {
        final errorMessage = next.errorMessage ?? '서버에 문제가 발생했어요.';
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(errorMessage)));
      }
    });

    return _EditThemeTemplate(
      saveButton: _EditThemeSaveButton(provider),
      imagePicker: _EditThemeImagePicker(provider),
      textField: _EditThemeTitleTextField(provider),
      options: [
        _EditThemePrivacyStatusTile(provider),
        _EditThemeRemoveTile(provider),
      ],
    );
  }
}

//template
class _EditThemeTemplate extends StatelessWidget {
  const _EditThemeTemplate({
    required this.saveButton,
    required this.imagePicker,
    required this.textField,
    required this.options,
  });

  final _EditThemeSaveButton saveButton;
  final _EditThemeImagePicker imagePicker;
  final _EditThemeTitleTextField textField;
  final List<Widget> options;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(actions: [saveButton]),
        body: SingleChildScrollView(
          child: Column(children: [
            Gap.h12,
            imagePicker,
            Gap.h12,
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kContentPadding,
              ),
              child: textField,
            ),
            Gap.h24,
            ...options,
          ]),
        ),
      ),
    );
  }
}
