import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/widgets/widgets.dart';

import 'controller/sign_in_controller.dart';

part 'widgets/_error_dialog.dart';
part 'widgets/_sign_in_button.dart';
part 'widgets/_sign_in_title.dart';

class SignInScreen extends ConsumerWidget {
  static const String routeName = 'signIn';
  static const String routeLocation = '/$routeName';
  const SignInScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(signInControllerProvider, (previous, next) {
      if (next.status == SignInStatus.failure) {
        final errorMessage = next.errorMessage ?? '서버에 문제가 발생했어요.';
        _SignInErrorDialog.show(context, errorMessage);
      }
    });

    return const _SignInTemplate(
      signInTitle: _SignInTitle(),
      signInButton: _SignInButton(),
    );
  }
}

//Template
class _SignInTemplate extends StatelessWidget {
  const _SignInTemplate({
    required this.signInTitle,
    required this.signInButton,
  });

  final _SignInTitle signInTitle;
  final _SignInButton signInButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: signInTitle),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(kContentPadding).add(
          const EdgeInsets.only(bottom: Sizes.p40),
        ),
        child: signInButton,
      ),
    );
  }
}
