part of 'package:serendy/presentation/account/account_screen.dart';

class _AccountNameTextField extends StatelessWidget {
  const _AccountNameTextField({required this.focusNode});

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AccountBloc>().state;

    // TODO: 사용자 이름 초기화 문제 해결하기
    // 사용자 이름을 서버에서 가져오는 가운데
    // 텍스트 컨트롤러가 초기화돼 새로운 값으로 갱신을 못해요.
    //
    // 고안한 해결 방법으로는 세 가지예요.
    // 1. BloC 상태를 초기화할 때 사용자 정보를 넘겨주기. 🔥
    // 2. 불러오기에 성공했을 때 [TitleTextField]를 초기화하기.
    // 3. 값이 변경될 때마다 [TextEditingController]를 새로 만들기.
    if (state.status == AccountStatus.success) {
      return TitleTextField(
        onChanged: (value) {},
        value: state.username,
        hintText: "닉네임",
        focusNode: focusNode,
      );
    } else {
      return const SizedBox();
    }
  }
}
