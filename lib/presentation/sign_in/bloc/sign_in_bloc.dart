import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/core/exceptions/auth_exception.dart';
import 'package:serendy/core/exceptions/core_exception.dart';
import 'package:serendy/features/auth/auth.dart';
import 'package:serendy/features/user/user.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({
    required this.authService,
    required this.userService,
  }) : super(const SignInState()) {
    on<SignIn$WithGoogleRequested>(_onSignIn$WithGoogleRequested);
    on<SignIn$WithAppleRequested>(_onSignIn$WithAppleRequested);
  }

  final AuthService authService;
  final UserService userService;

  void _onSignIn$WithGoogleRequested(
    SignIn$WithGoogleRequested event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(status: SignInStatus.loading));

    final userCredential = await authService.signInWithGoogle();
    final firebaseUser = userCredential?.user;
    if (firebaseUser == null) return;

    try {
      final authId = firebaseUser.uid;
      await userService.fetchUser(userId: authId);

      emit(state.copyWith(status: SignInStatus.success));
    }

    /// [fetchUser]에서 사용자 정보를 찾을 수 없을 때.
    on EntityNotFoundException {
      // 사용자 정보가 DB에 없으면 새로 만들어요.
      await userService.createUser(
        authId: firebaseUser.uid,
        name: firebaseUser.displayName!,
      );
    }

    /// [signIn$WithGoogle]에서 로그인에 실패했을 때.
    on SignInWithGoogleFailure catch (e) {
      emit(state.copyWith(
        status: SignInStatus.failure,
        errorMessage: e.message,
      ));
    }
  }

  void _onSignIn$WithAppleRequested(
    SignIn$WithAppleRequested event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(status: SignInStatus.loading));
    // await authService.signIn$WithGoogle();
    Future.delayed(const Duration(seconds: 3));
    emit(state.copyWith(status: SignInStatus.success));
  }
}
