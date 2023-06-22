import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/core/locator.dart';
import 'package:serendy/presentation/@blocs/authentication/authentication_bloc.dart';
import 'package:serendy/presentation/@widgets/alert_dialog.dart';
import 'package:serendy/presentation/sign_in/bloc/sign_in_bloc.dart';

part 'widgets/_error_dialog.dart';
part 'widgets/_sign_in_button.dart';
part 'widgets/_sign_in_title.dart';

@RoutePage()
class SignInScreen extends StatelessWidget {
  const SignInScreen(this.onResult, {super.key});
  final void Function(bool) onResult;

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
      child: _SignInView(onResult),
    );
  }
}

class _SignInView extends StatelessWidget {
  const _SignInView(this.onResult);
  final void Function(bool) onResult;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        /// 인증 상태에 따라 네비게이션을 분기해요.
        BlocListener<AuthenticationBloc, AuthenticationState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            // 인증된 사용자일 경우
            if (state.status == AuthenticationStatus.authenticated) {
              onResult(true);
            }
            // 인증되지 않은 사용자일 경우
            else if (state.status == AuthenticationStatus.unauthenticated) {
              onResult(false);
            }
          },
        ),

        /// 로그인에 실패하면 메시지로 안내해요.
        BlocListener<SignInBloc, SignInState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (_, state) {
            if (state.status == SignInStatus.failure) {
              _SignInErrorDialog.show(
                context,
                state.errorMessage,
              );
            }
          },
        ),
      ],
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
