import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serendy/src/configs/configs.dart';

part 'widgets/sign_in_title.dart';
part 'widgets/sign_in_button.dart';

@RoutePage()
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _SignInTemplate(
      signInTitle: const _SignInTitle(),
      signInButton: _SignInButton(
        onPressed: () {},
      ),
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
      body: Center(
        child: signInTitle,
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kContentPadding,
          vertical: Sizes.p40,
        ),
        child: signInButton,
      ),
    );
  }
}
