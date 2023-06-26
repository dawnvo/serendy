part of '../media_menu_sheet.dart';

class _SaveMediaTile extends StatelessWidget {
  const _SaveMediaTile({required this.media});

  final Media media;

  void handleSaveMedia(BuildContext context) {
    context.pop();
    context.showCustomModalBottomSheet(
      (context) => SaveMediaSheet(media: media),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _MediaMenuListTile(
      onTap: () => handleSaveMedia(context),
      icon: const Icon(RemixIcon.add_box_fill),
      title: "테마에 추가하기",
    );
  }
}
