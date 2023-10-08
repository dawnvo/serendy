import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/auth/auth.dart';
import 'package:serendy/src/features/profile/profile.dart';

part 'account_controller.g.dart';
part 'account_state.dart';

@riverpod
class AccountController extends _$AccountController with NotifierMounted {
  @override
  FutureOr<AccountState> build() async {
    ref.onDispose(setUnmounted);
    final me = await ref.watch(getMeProvider.future);

    return AccountState(
      initialProfile: me,
      avatar: me.avatar,
      name: me.name,
      email: me.email,
    );
  }

  /// 이미지를 변경해요.
  void changeAvatar(String? imagePath) {
    state = AsyncData(state.requireValue.copyWith(avatar: imagePath));
  }

  /// 이름을 수정해요.
  void changeName(String name) {
    state = AsyncData(state.requireValue.copyWith(name: name));
  }

  /// 프로필을 수정해요.
  Future<void> editProfile() async {
    // * loading
    state = const AsyncValue.loading();

    try {
      // * 프로필을 수정해요.
      final edited = await ref.read(editProfileProvider(
        avatar: state.requireValue.avatar,
        username: state.requireValue.name,
      ).future);

      // * 컨트롤러가 폐기된 경우 작업을 끝내요.
      if (!mounted) return;

      // * loaded
      state = AsyncValue.data(state.requireValue.copyWith(
        // 상태를 다시 설정해 `isEdited` 초기화
        initialProfile: edited,
        // 로컬 이미지 주소 != 클라우드 이미지 주소
        avatar: edited.avatar,
      ));
    } catch (err, stack) {
      state = AsyncValue.error(err, stack);
    }
  }

  /// 로그아웃해요.
  Future<void> signOut() async {
    await ref.read(signOutProvider.future);
  }

  /// 회원탈퇴해요.
  Future<void> deleteUser() async {
    await ref.read(deleteUserProvider.future);
  }
}
