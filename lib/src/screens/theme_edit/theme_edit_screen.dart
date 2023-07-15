import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/widgets/widgets.dart';

import 'controller/edit_theme_controller.dart';

part 'widgets/_image_picker.dart';
part 'widgets/_privacy_status_tile.dart';
part 'widgets/_remove_tile.dart';
part 'widgets/_save_button.dart';
part 'widgets/_title_text_field.dart';

class EditThemeScreen extends ConsumerWidget {
  static const String routeName = 'edit-theme';
  static const String routeLocation = '/$routeName';
  const EditThemeScreen({required this.theme});

  final Theme theme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = editThemeControllerProvider(theme);

    ref.listen(provider, (previous, next) {
      if (next.status == EditThemeStatus.failure) {
        final errorMessage = next.errorMessage ?? '서버에 문제가 생겼어요.';
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
