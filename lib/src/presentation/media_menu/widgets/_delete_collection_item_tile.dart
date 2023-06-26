part of '../media_menu_sheet.dart';

class _DeleteCollectionItemTile extends StatelessWidget {
  const _DeleteCollectionItemTile();

  void handleDeleteCollectionItem(BuildContext context) {
    context.pop();
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(content: Text('테마에서 삭제했어요.')),
      );
  }

  @override
  Widget build(BuildContext context) {
    return _MediaMenuListTile(
      onTap: () => handleDeleteCollectionItem(context),
      icon: const Icon(RemixIcon.indeterminate_circle_fill),
      title: "이 테마에서 삭제하기",
    );
  }
}
