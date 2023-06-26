part of '../account_screen.dart';

class _AccountSaveButton extends ConsumerWidget {
  const _AccountSaveButton({required this.isEdited});

  final bool isEdited;

  void handleSubmit(BuildContext context, WidgetRef ref) {
    FocusScope.of(context).unfocus();
    ref.read(accountControllerProvider.notifier).submit(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: isEdited ? () => handleSubmit(context, ref) : null,
      child: const Text("저장하기"),
    );
  }
}
