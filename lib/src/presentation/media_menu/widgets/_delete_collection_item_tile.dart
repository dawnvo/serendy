part of '../media_menu_sheet.dart';

class _DeleteCollectionItemTile extends ConsumerWidget {
  const _DeleteCollectionItemTile(
    this.provider, {
    required this.collectionId,
  });

  final MediaMenuControllerProvider provider;
  final CollectionID? collectionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _MediaMenuListTile(
      onTap: () => ref
          .read(provider.notifier)
          .onDeleteCollectionItemTapped(context, collectionId),
      icon: const Icon(RemixIcon.indeterminate_circle_fill),
      title: "이 테마에서 삭제하기",
    );
  }
}
