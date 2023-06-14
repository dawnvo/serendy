part of 'package:serendy/presentation/media/media_screen.dart';

class _MediaReactionIconButton extends ConsumerWidget {
  const _MediaReactionIconButton({
    required this.icon,
    required this.onPressed,
  });

  final Widget icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reaction = evaluationMock;

    return Row(children: [
      _EmotionLabel(reaction.emotion),
      IconButton(
        onPressed: onPressed,
        icon: reaction != null
            ? SvgPicture.asset(
                reaction.emotion.filePath,
                height: Sizes.p28,
              )
            : icon,
      ),
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
