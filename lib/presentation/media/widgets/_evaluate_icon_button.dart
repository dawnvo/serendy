part of 'package:serendy/presentation/media/media_screen.dart';

class _MediaEvaluateIconButton extends StatelessWidget {
  const _MediaEvaluateIconButton({required this.media});

  final Media media;

  void handlePressed(BuildContext context) {
    context.pushRoute(MediaEvaluateRoute(media: media));
  }

  @override
  Widget build(BuildContext context) {
    final evaluation = context.select<MyEvaluationBloc, Evaluation?>(
      (bloc) => bloc.state.evaluation,
    );

    return Row(children: [
      if (evaluation != null) __EmotionLabel(evaluation.emotion),
      if (evaluation != null)
        IconButton(
          onPressed: () => handlePressed(context),
          icon: SvgPicture.asset(
            evaluation.emotion.filePath,
            height: Sizes.p28,
          ),
        )
      else
        IconButton(
          onPressed: () => handlePressed(context),
          icon: const Icon(RemixIcon.emotion_fill),
        )
    ]);
  }
}

/// Emotion label
class __EmotionLabel extends StatelessWidget {
  const __EmotionLabel(this.emotion);

  final Emotion emotion;

  @override
  Widget build(BuildContext context) {
    return Chip(
      shape: const StadiumBorder(),
      side: BorderSide(color: emotion.color),
      visualDensity: VisualDensity.compact,
      labelPadding: EdgeInsets.zero,
      label: Text(
        emotion.label,
        style: context.textTheme.labelMedium?.copyWith(
          color: emotion.color,
        ),
      ),
    );
  }
}
