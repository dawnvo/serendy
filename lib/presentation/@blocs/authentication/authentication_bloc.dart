import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/features/auth/auth.dart';
import 'package:serendy/features/user/user.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({required this.authService})
      : super(authService.currentUserId != null
            ? AuthenticationState.authenticated(authService.currentUserId!)
            : const AuthenticationState.unauthenticated()) {
    on<_Authentication$UserChanged>(_onUserChanged);
    on<Authentication$SignOutRequested>(_onSignOutRequested);

    /// 인증 상태 변경을 감지해요.
    ///
    /// * 로그인 또는 로그아웃할 때
    _userSubscription = authService.authStateChanges.listen((userId) {
      add(_Authentication$UserChanged(userId));
    });
  }

  final AuthService authService;
  late final StreamSubscription<UserID?> _userSubscription;

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }

  void _onUserChanged(
    _Authentication$UserChanged event,
    Emitter<AuthenticationState> emit,
  ) {
    emit(event.userId != null
        ? AuthenticationState.authenticated(event.userId!)
        : const AuthenticationState.unauthenticated());
  }

  void _onSignOutRequested(
    Authentication$SignOutRequested event,
    Emitter<AuthenticationState> emit,
  ) {
    unawaited(authService.signOut());
  }
}
