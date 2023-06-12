part of '../media_screen.dart';

class _MediaReactionIconButton extends ConsumerWidget {
  const _MediaReactionIconButton({
    required this.onPressed,
    required this.icon,
  });

  final VoidCallback onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reaction = ref.watch(_reactionProvider);

    return Row(children: [
      if (reaction != null) _EmotionLabel(reaction),
      IconButton(
        onPressed: onPressed,
        icon: reaction != null
            ? SvgPicture.asset(reaction.filePath, height: Sizes.p28)
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
