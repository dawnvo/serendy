part of 'package:serendy/presentation/media/media_screen.dart';

class _MediaReactionIconButton extends StatelessWidget {
  const _MediaReactionIconButton({
    required this.icon,
    required this.onPressed,
  });

  final Widget icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<EvaluationBloc>().state;

    return switch (state) {
      EvaluationLoaded() => Row(children: [
          _EmotionLabel(state.evaluation.emotion),
          IconButton(
            onPressed: onPressed,
            icon: SvgPicture.asset(
              state.evaluation.emotion.filePath,
              height: Sizes.p28,
            ),
          ),
        ]),
      EvaluationEmpty() => IconButton(
          onPressed: onPressed,
          icon: icon,
        ),
      EvaluationLoading() => const SizedBox(),
      EvaluationError() => const SizedBox(),
      EvaluationsListLoaded() => const SizedBox(),
    };
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
