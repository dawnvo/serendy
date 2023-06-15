part of 'package:serendy/presentation/media/media_screen.dart';

class _EvaluateIconButton extends StatelessWidget {
  const _EvaluateIconButton({
    required this.icon,
    required this.onPressed,
  });

  final Widget icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<EvaluationBloc>().state;
    Evaluation? evaluation;

    if (state is EvaluationLoaded) {
      evaluation = state.evaluation;
    }

    return Row(children: [
      if (evaluation != null) _EmotionLabel(evaluation.emotion),
      if (evaluation != null)
        IconButton(
          onPressed: onPressed,
          icon: SvgPicture.asset(
            evaluation.emotion.filePath,
            height: Sizes.p28,
          ),
        )
      else
        IconButton(
          onPressed: onPressed,
          icon: icon,
        )
    ]);
  }
}

/// Emotion label
class _EmotionLabel extends StatelessWidget {
  const _EmotionLabel(this.emotion);

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
