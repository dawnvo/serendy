part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

/// 로그인을 진행해요.
final class SignIn$WithGoogleRequested extends SignInEvent {
  const SignIn$WithGoogleRequested();
}

/// 로그아웃을 진행해요.
final class SignIn$WithAppleRequested extends SignInEvent {
  const SignIn$WithAppleRequested();
}
