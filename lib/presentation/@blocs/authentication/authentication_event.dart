part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

/// 인증 상태를 감지해요.
final class _Authentication$UserChanged extends AuthenticationEvent {
  const _Authentication$UserChanged(this.userId);
  final UserID? userId;
}

/// 로그아웃을 진행해요.
final class Authentication$SignOutRequested extends AuthenticationEvent {
  const Authentication$SignOutRequested();
}
