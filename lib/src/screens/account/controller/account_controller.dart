import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/profile/profile.dart';
import 'package:serendy/src/features/theme/theme.dart';

part 'account_controller.g.dart';
part 'account_state.dart';

@riverpod
class AccountController extends _$AccountController with NotifierMounted {
  @override
  FutureOr<AccountState> build() async {
    // * 내 프로필을 불러와요.
    final profile = await ref.watch(getMeProvider.future);

    // * loaded
    return AccountState(
      initialProfile: profile,
      email: profile.email,
      name: profile.name,
    );
  }

  /// 이름을 수정해요.
  void changeName(String name) {
    state = AsyncValue.data(state.requireValue.copyWith(
      name: name,
    ));
  }

  /// 수정한 프로필을 제출해요.
  Future<void> submit() async {
    state = await AsyncValue.guard(() async {
      // * 프로필을 수정해요.
      final edited = await ref.read(editProfileProvider(
        username: state.requireValue.name,
      ).future);

      // * 프로필 관련 공급자를 새로고침해요.
      ref.invalidate(getMeProvider);
      ref.invalidate(getMyThemesProvider);

      // * loaded
      return state.requireValue.copyWith(
        initialProfile: edited, // isEdited 초기화
        isSubmitted: true,
      );
    });
  }
}
