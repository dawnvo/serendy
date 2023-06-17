part of 'package:serendy/presentation/edit_collection/edit_collection_screen.dart';

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
        builder: (_) => BlocProvider.value(
          value: context.read<EditCollectionBloc>(),
          child: const _RemoveCollectionDialog(),
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
class _RemoveCollectionDialog extends StatelessWidget {
  const _RemoveCollectionDialog();

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: "테마를 삭제할까요?",
      actions: [
        CustomDialogAction(
          onPressed: () => context.popRoute(),
          child: const Text("취소"),
        ),
        CustomDialogAction(
          isDestructiveAction: true,
          onPressed: () => context
              .read<EditCollectionBloc>()
              .add(const EditCollection$CollectionDeleted()),
          child: const Text("삭제"),
        ),
      ],
    );
  }
}
