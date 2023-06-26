part of '../media_menu_sheet.dart';

class _EvaluateMediaTile extends StatelessWidget {
  const _EvaluateMediaTile({required this.media});

  final Media media;

  void handleEvaluateMedia(BuildContext context) {
    context.pop();
    context.pushNamed(AppRoutes.evaluateMediaName, extra: media);
  }

  @override
  Widget build(BuildContext context) {
    return _MediaMenuListTile(
      onTap: () => handleEvaluateMedia(context),
      icon: const Icon(RemixIcon.emotion_fill),
      title: "감상했어요",
    );
  }
}
