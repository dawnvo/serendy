import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/user/user.dart';

part 'exit_controller.g.dart';
part 'exit_state.dart';

@riverpod
class ExitController extends _$ExitController with NotifierMounted {
  @override
  ExitState build() {
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
  void changeReason(Reason? reason) {
    state = state.copyWith(reason: reason);
  }

  /// 의견을 입력해요.
  void changeComment(String? comment) {
    state = state.copyWith(comment: comment);
  }

  /// 회원 탈퇴해요.
  Future<void> submit() async {
    print(state);
  }
}
