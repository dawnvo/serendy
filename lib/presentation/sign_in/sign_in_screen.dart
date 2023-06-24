import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/core/locator.dart';
import 'package:serendy/presentation/@blocs/authentication/authentication_bloc.dart';
import 'package:serendy/presentation/@widgets/alert_dialog.dart';
import 'package:serendy/presentation/sign_in/bloc/sign_in_bloc.dart';

part 'widgets/_error_dialog.dart';
part 'widgets/_sign_in_button.dart';
part 'widgets/_sign_in_title.dart';

class SignInScreen extends StatelessWidget {
  static const String routeName = 'signIn';
  static const String routeLocation = '/$routeName';
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationBloc(
            authService: sl(),
          ),
        ),
        BlocProvider(
          create: (context) => SignInBloc(
            authService: sl(),
            userService: sl(),
          ),
        ),
      ],
      child: const _SignInView(),
    );
  }
}

class _SignInView extends StatelessWidget {
  const _SignInView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (_, state) {
        if (state.status == SignInStatus.failure) {
          _SignInErrorDialog.show(
            context,
            state.errorMessage,
          );
        }
      },
      child: const _SignInTemplate(
        signInTitle: _SignInTitle(),
        signInButton: _SignInButton(),
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
