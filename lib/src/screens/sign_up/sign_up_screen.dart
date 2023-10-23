import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/auth/auth.dart';
import 'package:serendy/src/widgets/widgets.dart';

import 'controller/sign_up_controller.dart';

part 'widgets/_back_button.dart';
part 'widgets/_submit_button.dart';
part 'widgets/_username_text_filed.dart';

class SignUpScreen extends ConsumerWidget {
  static const String routeName = 'signUp';
  static const String routeLocation = '/$routeName';
  const SignUpScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const _SignUpTemplate(
      backButton: _SignUpBackButton(),
      textField: _SignUpUsernameTextField(),
      submitButton: _SignUpSubmitButton(),
    );
  }
}

//template
class _SignUpTemplate extends StatelessWidget {
  const _SignUpTemplate({
    required this.backButton,
    required this.textField,
    required this.submitButton,
  });

  final _SignUpBackButton backButton;
  final _SignUpUsernameTextField textField;
  final _SignUpSubmitButton submitButton;

  @override
  Widget build(BuildContext context) {
    final bottom = context.mediaQuery.viewInsets.bottom;
    return Scaffold(
      appBar: AppBar(leading: backButton),
      body: Padding(
        padding: const EdgeInsets.all(kContentPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "아이디를 입력해주세요.",
              style: context.textTheme.titleLarge,
            ),
            Gap.h12,
            textField,
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(kContentPadding) //
            .add(EdgeInsets.only(bottom: bottom.roundToDouble())),
        child: submitButton,
      ),
    );
  }
}
