part of '../exit_screen.dart';

class _ExitSubmitButton extends ConsumerWidget {
  const _ExitSubmitButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(exitControllerProvider);

    void onPressed() {
      ref.read(exitControllerProvider.notifier).submit();
    }

    return FilledButton(
      onPressed: state.reason != null ? onPressed : null,
      child: const Text('계정 삭제하기'),
    );
  }
}
