part of 'package:serendy/presentation/account/account_screen.dart';

class _AccountNameTextField extends StatelessWidget {
  const _AccountNameTextField({required this.focusNode});

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return TitleTextField(
      onChanged: (value) {},
      placeholder: "닉네임",
      focusNode: focusNode,
    );
  }
}
