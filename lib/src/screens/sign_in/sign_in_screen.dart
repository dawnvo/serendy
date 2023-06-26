import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/widgets/widgets.dart';

import 'controller/sign_in_controller.dart';

part 'widgets/_error_dialog.dart';
part 'widgets/_sign_in_button.dart';
part 'widgets/_sign_in_title.dart';

class SignInScreen extends ConsumerWidget {
  static const String routeName = 'signIn';
  static const String routeLocation = '/$routeName';
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(signInControllerProvider, (previous, next) {
      if (next.status == SignInStatus.failure) {
        _SignInErrorDialog.show(context, next.errorMessage);
      }
    });

    return const _SignInTemplate(
      signInTitle: _SignInTitle(),
      signInButton: _SignInButton(),
    );
  }
}

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
      body: Center(
        child: signInTitle,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(kContentPadding).add(
          const EdgeInsets.only(bottom: Sizes.p40),
        ),
        child: signInButton,
      ),
    );
  }
}
