part of '../theme_edit_screen.dart';

class _EditThemeRemoveTile extends ConsumerWidget {
  const _EditThemeRemoveTile(this.provider);
  final EditThemeControllerProvider provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: () => ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(content: Text('테마를 삭제하려면 길게 누르세요.')),
        ),
      onLongPress: () => showDialog(
        context: context,
        builder: (_) => __RemoveThemeDialog(onRemove: () {
          ref.read(provider.notifier).remove();
        }),
      ),
      title: const Text("테마 삭제"),
      trailing: Icon(
        RemixIcon.arrow_right_s_line,
        color: context.colorScheme.outline,
      ),
    );
  }
}

//Dialog
class __RemoveThemeDialog extends StatelessWidget {
  const __RemoveThemeDialog({required this.onRemove});
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: "테마를 삭제할까요?",
      actions: [
        CustomDialogAction(
          onPressed: () => context.pop(),
          child: const Text("취소"),
        ),
        CustomDialogAction(
          isDestructiveAction: true,
          onPressed: onRemove,
          child: const Text("삭제"),
        ),
      ],
    );
  }
}
