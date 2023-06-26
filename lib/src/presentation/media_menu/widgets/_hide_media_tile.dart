part of '../media_menu_sheet.dart';

class _HideMediaTile extends StatelessWidget {
  const _HideMediaTile();

  void handleHideMedia(BuildContext context) {
    final snackBar = SnackBar(
      action: SnackBarAction(
        onPressed: () {},
        label: "취소",
      ),
      content: const Text('앞으로 이 작품은 보이지 않습니다.'),
    );

    context.pop();
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return _MediaMenuListTile(
      onTap: () => handleHideMedia(context),
      icon: const Icon(RemixIcon.indeterminate_circle_fill),
      title: "이 작품 숨기기",
    );
  }
}
