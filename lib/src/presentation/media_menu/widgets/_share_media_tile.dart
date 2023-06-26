part of '../media_menu_sheet.dart';

class _ShareMediaTile extends StatelessWidget {
  const _ShareMediaTile({required this.media});

  final Media media;

  void handleShare(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return _MediaMenuListTile(
      onTap: () => handleShare(context),
      icon: const Icon(RemixIcon.share_fill),
      title: "공유하기",
    );
  }
}
