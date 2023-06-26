import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/core/exceptions/core_exception.dart';
import 'package:serendy/src/features/auth/auth.dart';
import 'package:serendy/src/features/user/user.dart';

part 'sign_in_controller.g.dart';
part 'sign_in_state.dart';

@riverpod
class SignInController extends _$SignInController {
  @override
  SignInState build() {
    return const SignInState();
  }

  /// Google 로그인을 진행해요.
  Future<void> signInWithGoogle() async {
    state = state.copyWith(status: SignInStatus.loading);

    try {
      // * 로그인을 진행해요.
      final userCredential =
          await ref.read(authServiceProvider).signInWithGoogle();

      // * 로그인한 사용자를 성공적으로 불러왔는지 확인해요.
      final firebaseUser = userCredential.user;
      if (firebaseUser == null) return;

      // * 서버에 해당 사용자가 존재하는지 확인해요.
      try {
        await ref.read(fetchUserProvider(id: firebaseUser.uid).future);
      }
      // * 사용자를 찾을 수 없으면 새로 만들어요.
      on EntityNotFoundException {
        ref.read(createUserProvider(
          uid: firebaseUser.uid,
          username: firebaseUser.displayName!,
          email: firebaseUser.email!,
        ));
      }

      state = state.copyWith(status: SignInStatus.success);
    }
    // * 로그인에 실패하면 상태를 설정해요.
    catch (err) {
      state = state.copyWith(
        status: SignInStatus.failure,
        errorMessage: err.toString(),
      );
    }
  }
}
