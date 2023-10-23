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
    state = const AsyncValue.loading();

    // TODO: account state 분리하기
    // 하단 시트를 닫았다 열어도 errorText 초기화 안되는 문제.
    // 상태가 account 화면에 종속해 발생한 문제

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
        errorText: errorText,
      );
    });
  }

  /// 프로필을 수정해요.
  Future<void> submit({String? username}) async {
    // * 이전과 동일한 이름일 경우 작업을 끝내요.
    if (username == state.requireValue.username) return;

    state = const AsyncValue.loading();
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
        errorText: null,
      );
    });
  }
}
