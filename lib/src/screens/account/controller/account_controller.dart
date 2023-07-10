import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/auth/auth.dart';
import 'package:serendy/src/features/user/user.dart';
import 'package:serendy/src/screens/profile/controller/profile_controller.dart';

part 'account_controller.g.dart';
part 'account_state.dart';

@riverpod
class AccountController extends _$AccountController with NotifierMounted {
  @override
  FutureOr<AccountState> build() async {
    ref.onDispose(setUnmounted);
    final me = await ref.refresh(fetchMeProvider.future);

    return AccountState(
      initialUser: me,
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
  Future<void> submit(BuildContext context) async {
    state = const AsyncLoading();

    final newState = await AsyncValue.guard(() async {
      // * 프로필을 수정해요.
      final edited = await ref.read(editProfileProvider(
        avatar: state.requireValue.avatar,
        username: state.requireValue.name,
      ).future);

      // * 수정에 성공하면 프로필 화면의 상태를 갱신해요.
      await ref
          .read(profileControllerProvider.notifier)
          .userProfileUpdated(edited);

      // * 상태를 수동으로 설정해 `isEdited`를 초기화해요.
      return state.requireValue.copyWith(
        initialUser: edited,
        avatar: edited.avatar, // 로컬 이미지 주소 != 클라우드 이미지 주소
      );
    });

    // * 컨트롤러가 폐기되지 않은 경우에만 상태를 설정해요.
    if (!mounted) return;
    state = newState;
  }

  /// 로그아웃해요.
  Future<void> signOut(BuildContext context) async {
    try {
      await ref.read(authServiceProvider).signOutWithGoogle();
      // TODO: 로그인한 사용자 상태 초기화하기
    } catch (err) {
      // * 로그아웃에 실패하면 메시지로 안내해요.
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(err.toString()),
      ));
    }
  }
}
