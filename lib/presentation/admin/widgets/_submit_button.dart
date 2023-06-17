part of 'package:serendy/presentation/admin/admin_screen.dart';

class _AdminSubmitButton extends StatelessWidget {
  const _AdminSubmitButton();

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(56)),
      onPressed: () => context.read<AddMediaCubit>().submitted(),
      child: const Text('추가하기'),
    );
  }
}
