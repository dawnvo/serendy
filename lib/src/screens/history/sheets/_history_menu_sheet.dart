part of '../history_screen.dart';

class _HistoryMenuSheet extends StatelessWidget {
  const _HistoryMenuSheet(this.evaluation);
  final Evaluation evaluation;

  @override
  Widget build(BuildContext context) {
    final media = evaluation.media.convertEntity;
    return MenuTemplate(
      info: MenuInfo(
        image: media.image,
        title: media.title,
      ),
      options: [
        EvaluateMediaMenuItem(media: media),
        SaveMediaMenuItem(media: media),
        DeleteEvaluationMenuItem(media: media),
        ShareMediaMenuItem(media: media),
      ],
    );
  }
}
