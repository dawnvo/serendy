part of '../account_screen.dart';

class _AccountNameTextField extends StatelessWidget {
  const _AccountNameTextField({required this.focusNode});

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    const username = 'username';

    return TitleTextField(
      onChanged: (value) {},
      value: username,
      hintText: "닉네임",
      focusNode: focusNode,
    );
  }
}
