import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/user/user.dart';
import 'package:serendy/src/features/theme/theme.dart';

part 'account_controller.g.dart';
part 'account_state.dart';

@riverpod
class AccountController extends _$AccountController {
  @override
  FutureOr<AccountState> build() async {
    // * 내 프로필을 불러와요.
    final user = await ref.watch(getMeProvider.future);

    // * loaded
    return AccountState(
      email: user.email,
      username: user.username,
    );
  }

  /// 아이디를 검증해요.
  Future<void> validateUsername(String username) async {
    // TODO: account state 분리하기
    // * 하단 시트를 닫았다 열어도 errorText 초기화 안되는 문제.
    // * 상태가 account 화면에 종속해 발생한 문제
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      // * 이전과 동일한 이름일 경우 작업을 끝내요.
      if (username == state.requireValue.username) {
        return state.requireValue.copyWith(errorText: null);
      }

      // * 문자열을 검증해요.
      if (username.contains(RegExp(r'[^a-zA-Z0-9_]+'))) {
        return state.requireValue.copyWith(
          errorText: '영문자, 숫자 및 밑줄(_)만 사용 가능해요.',
        );
      }

      // * 문자 수를 검증해요.
      if (username.length < 3) {
        return state.requireValue.copyWith(
          errorText: "아이디는 3자 이상이어야 해요.",
        );
      }

      // * 고유 이름인지 검증해요.
      final isUsernameTaken = await ref.watch(checkUsernameProvider(
        username: username,
      ).future);

      if (isUsernameTaken) {
        return state.requireValue.copyWith(
          errorText: "이미 사용 중인 아이디에요.",
        );
      }

      // * 사용 가능한 아이디에요.
      return state.requireValue.copyWith(errorText: null);
    });
  }

  /// 프로필을 수정해요.
  Future<void> submit({String? username}) async {
    state = await AsyncValue.guard(() async {
      // * 프로필을 수정해요.
      final edited = await ref.read(editProfileProvider(
        username: username,
      ).future);

      // * 관련 공급자를 새로고침해요.
      ref.invalidate(getMeProvider);
      ref.invalidate(getMyThemesProvider);

      // * loaded
      return state.requireValue.copyWith(
        username: edited.username,
      );
    });
  }
}
