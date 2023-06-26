part of '../edit_collection_screen.dart';

class _EditCollectionRemoveTile extends ConsumerWidget {
  const _EditCollectionRemoveTile(this.provider);
  final EditCollectionControllerProvider provider;

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
        builder: (_) => __RemoveCollectionDialog(
          onDelete: () => ref.read(provider.notifier).delete(),
        ),
      ),
      title: const Text("테마 삭제"),
      trailing: Icon(
        RemixIcon.arrow_right_s_line,
        color: context.colorScheme.outline,
      ),
    );
  }
}

/// Dialog
class __RemoveCollectionDialog extends StatelessWidget {
  const __RemoveCollectionDialog({required this.onDelete});
  final VoidCallback onDelete;

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
          onPressed: onDelete,
          child: const Text("삭제"),
        ),
      ],
    );
  }
}
