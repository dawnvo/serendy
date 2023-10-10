import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/auth/auth.dart';
import 'package:serendy/src/features/profile/application/profile_service.dart';

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
      final supabaseUser = auth.user!;

      // * 로그인에 성공하면
      // * 프로필이 존재하는지 확인해요.
      try {
        await ref.watch(getProfileProvider(id: supabaseUser.id).future);
      }
      // * 프로필을 찾을 수 없으면 새로 만들어요.
      on EntityNotFoundException {
        await ref.read(createProfileProvider(
          uid: supabaseUser.id,
          email: supabaseUser.userMetadata!['email'],
          username: supabaseUser.userMetadata!['name'],
          avatar: supabaseUser.userMetadata!['picture'],
        ).future);
      }

      // * loaded
      state = state.copyWith(status: SignInStatus.success);

      // * failure
    } catch (err) {
      state = state.copyWith(
        status: SignInStatus.failure,
        errorMessage: err.toString(),
      );
    }
  }
}
