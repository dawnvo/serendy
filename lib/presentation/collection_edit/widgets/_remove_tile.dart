part of '../edit_collection_screen.dart';

class _EditCollectionRemoveTile extends StatelessWidget {
  const _EditCollectionRemoveTile();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(content: Text('테마를 삭제하려면 길게 누르세요.')),
        ),
      onLongPress: () => showDialog(
        context: context,
        builder: (_) => const __RemoveCollectionDialog(),
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
  const __RemoveCollectionDialog();

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
          onPressed: () => {},
          child: const Text("삭제"),
        ),
      ],
    );
  }
}
