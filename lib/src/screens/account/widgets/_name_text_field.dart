part of '../account_screen.dart';

class _AccountNameTextField extends ConsumerWidget {
  const _AccountNameTextField({
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TitleTextField(
      onChanged: (value) =>
          ref.read(accountControllerProvider.notifier).changeName(value),
      value: name,
      hintText: "닉네임",
    );
  }
}
