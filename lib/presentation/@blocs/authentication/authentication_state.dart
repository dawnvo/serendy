part of 'authentication_bloc.dart';

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
}

final class AuthenticationState extends Equatable {
  const AuthenticationState._({
    required this.status,
    this.userId = '',
  });

  const AuthenticationState.authenticated(String userId)
      : this._(status: AuthenticationStatus.authenticated, userId: userId);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
  final UserID userId;

  @override
  List<Object> get props => [status, userId];
}
