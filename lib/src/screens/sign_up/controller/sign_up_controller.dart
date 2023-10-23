import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/user/user.dart';

part 'sign_up_controller.g.dart';
part 'sign_up_state.dart';

@riverpod
class SignUpController extends _$SignUpController {
  @override
  FutureOr<SignUpState> build() async {
    return const SignUpState();
  }

  /// 아이디를 검증해요.
  Future<void> validateUsername(String username) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      // * 이전과 동일한 이름일 경우 작업을 끝내요.
      if (username == state.requireValue.username) {
        return state.requireValue.copyWith(
          errorText: null,
        );
      }

      // * 사용 가능한 이름인지 검증해요.
      final errorText = await ref.watch(checkUsernameProvider(
        username: username,
      ).future);

      // * loaded
      return state.requireValue.copyWith(
        username: username,
        errorText: errorText,
      );
    });
  }

  /// 계정을 만들어요.
  Future<void> submit() async {
    if (state.requireValue.username.isEmpty) return;

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      // * 사용자 정보를 불러와요.
      final supabase = ref.watch(supabaseProvider);
      final currentUser = supabase.auth.currentUser!;

      // * 계정을 만들어요.
      final created = await ref.read(createUserProvider(
        uid: currentUser.id,
        email: currentUser.email!,
        username: state.requireValue.username,
      ).future);

      // * loaded
      return state.requireValue.copyWith(
        username: created.username,
        errorText: null,
      );
    });
  }
}
