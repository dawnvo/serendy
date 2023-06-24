part of '../admin_screen.dart';

class _AdminSubmitButton extends StatelessWidget {
  const _AdminSubmitButton({required this.onSubmit});

  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: onSubmit,
      style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(56)),
      child: const Text('추가하기'),
    );
  }
}
