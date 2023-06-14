part of '../edit_collection_screen.dart';

class _EditCollectionRemoveTile extends ConsumerWidget {
  const _EditCollectionRemoveTile(this.provider);
  final EditCollectionProvider provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionId =
        ref.watch(provider.select((state) => state.initialCollection.id));

    return ListTile(
      onTap: () => ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(content: Text('테마를 삭제하려면 길게 누르세요.')),
        ),
      onLongPress: () => showDialog(
        context: context,
        builder: (_) => _RemoveCollectionDialog(
          collectionId: collectionId,
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
  const _RemoveCollectionDialog({required this.collectionId});

  final String collectionId;

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
          onPressed: () => context.replaceRoute(const ProfileRoute()),
          child: const Text("삭제"),
        ),
      ],
    );
  }
}