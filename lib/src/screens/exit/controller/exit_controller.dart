import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/auth/auth.dart';
import 'package:serendy/src/features/user/user.dart';

part 'exit_controller.g.dart';
part 'exit_state.dart';

@riverpod
class ExitController extends _$ExitController with NotifierMounted {
  @override
  ExitState build() {
    ref.onDispose(setUnmounted);

    // * lazy Loading
    _fetch();
    return const ExitState(username: '회원');
  }

  /// 사용자 이름을 불러와요.
  Future<void> _fetch() async {
    // * 내 프로필을 불러와요.
    final user = await ref.watch(getMeProvider.future);
    // * loaded
    state = ExitState(username: user.username);
  }

  /// 이유를 선택해요.
  void changeReason(ExitReason? reason) {
    state = state.copyWith(reason: reason);
  }

  /// 의견을 입력해요.
  void changeComment(String? comment) {
    state = state.copyWith(comment: comment);
  }

  /// 회원 탈퇴해요.
  Future<void> submit() async {
    state = state.copyWith(status: ExitStatus.loading);

    try {
      final futures = <Future>[];

      // * 사용자 정보를 삭제해요.
      futures.add(ref.read(deleteUserProvider(
        reason: state.reason!,
        comment: state.comment,
      ).future));

      // * 사용자 계정을 삭제해요.
      futures.add(ref.read(deleteAuthUserProvider.future));

      // * 로그아웃해요.
      futures.add(ref.read(signOutWithGoogleProvider.future));

      // * batching
      await Future.wait(futures);

      // * 컨트롤러가 폐기된 경우 작업을 끝내요.
      if (!mounted) return;

      // * loaded
      state = state.copyWith(status: ExitStatus.success);

      // * failure
    } catch (err) {
      state = state.copyWith(
        status: ExitStatus.failure,
        errorMessage: err.toString(),
      );
    }
  }
}
