import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/presentation/@widgets/alert_dialog.dart';

part 'widgets/_error_dialog.dart';
part 'widgets/_sign_in_button.dart';
part 'widgets/_sign_in_title.dart';

class SignInScreen extends StatelessWidget {
  static const String routeName = 'signIn';
  static const String routeLocation = '/$routeName';
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
