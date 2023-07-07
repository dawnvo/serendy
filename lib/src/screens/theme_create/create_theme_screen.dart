import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/widgets/widgets.dart';

import 'controller/create_theme_controller.dart';

part 'widgets/_submit_button.dart';
part 'widgets/_title_text_field.dart';

class CreateThemeScreen extends ConsumerWidget {
  static const String routeName = 'create-theme';
  static const String routeLocation = '/$routeName';
  const CreateThemeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(createThemeControllerProvider, (previous, next) {
      if (next.status == CreateThemeStatus.failure) {
        final errorMessage = next.errorMessage ?? '서버에 문제가 생겼어요.';
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(errorMessage)));
      }
    });

    return const _CreateThemeTemplate(
      textField: _CreateThemeTitleTextField(),
      submitButton: _CreateThemeSubmitButton(),
    );
  }
}

class _CreateThemeTemplate extends StatelessWidget {
  const _CreateThemeTemplate({
    required this.textField,
    required this.submitButton,
  });

  final _CreateThemeTitleTextField textField;
  final _CreateThemeSubmitButton submitButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "어떤 테마를 만들까요?",
            style: context.textTheme.titleLarge?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          Gap.h12,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kContentPadding),
            child: textField,
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(kContentPadding).add(EdgeInsets.only(
          bottom: context.mediaQuery.viewInsets.bottom.roundToDouble(),
        )),
        child: submitButton,
      ),
    );
  }
}
