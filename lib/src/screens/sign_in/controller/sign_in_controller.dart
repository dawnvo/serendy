import 'package:serendy/src/configs/configs.dart';
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
      final auth = await ref.read(signInWithGoogleProvider.future);

      // * 회원가입이 필요한 사용자인지 확인해요.
      await checkAndSignUpIfNotExists(auth.user!.id);

      // * 관련 공급자를 새로고침해요.
      ref.invalidate(currentUserIdProvider);
      ref.invalidate(requireUserIdProvider);

      // * failure
    } catch (err) {
      state = state.copyWith(
        status: SignInStatus.failure,
        errorMessage: err.toString(),
      );
    }
  }

  /// 회원가입이 필요한 사용자인지 확인해요.
  Future<void> checkAndSignUpIfNotExists(UserID id) async {
    try {
      // * 사용자가 존재하는지 확인해요.
      await ref.read(getUserProvider(id: id).future);

      // * 존재하지 않으면 회원가입 화면으로 이동해요.
    } on EntityNotFoundException {
      ref.read(goRouterProvider).pushNamed(AppRoutes.signUp);
    }
  }
}
