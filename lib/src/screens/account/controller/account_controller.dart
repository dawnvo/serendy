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
      email: profile.email,
      username: profile.name,
    );
  }

  /// 아이디를 검증해요.
  void validateUsername(String username) {
    String? errorMessage;
    if (username.contains(RegExp(r'[^a-zA-Z0-9_]+'))) {
      errorMessage = '영문자, 숫자 및 밑줄(_)만 사용 가능해요.';
    } else if (username.length < 3) {
      errorMessage = "아이디는 3자 이상이어야 해요.";
    } else if (username == "void") {
      errorMessage = "이미 사용 중인 아이디에요.";
    } else {
      errorMessage = '';
    }
    state = AsyncValue.data(state.requireValue.copyWith(
      errorMessage: errorMessage,
    ));
  }

  /// 수정한 프로필을 제출해요.
  Future<void> submit({String? username}) async {
    state = await AsyncValue.guard(() async {
      // * 프로필을 수정해요.
      final edited = await ref.read(editProfileProvider(
        username: username,
      ).future);

      // * 프로필 관련 공급자를 새로고침해요.
      ref.invalidate(getMeProvider);
      ref.invalidate(getMyThemesProvider);

      // * loaded
      return state.requireValue.copyWith(
        username: edited.name, // isEdited 초기화
      );
    });
  }
}
