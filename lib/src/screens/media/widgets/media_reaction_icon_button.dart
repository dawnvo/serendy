part of '../media_screen.dart';

class _MediaReactionIconButton extends StatelessWidget {
  const _MediaReactionIconButton({
    required this.onPressed,
    required this.icon,
  });

  final VoidCallback onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final Emotion? emotion = Emotion.joy;

    return Row(children: [
      if (emotion != null) _EmotionLabel(emotion),
      IconButton(
        onPressed: onPressed,
        icon: emotion != null
            ? SvgPicture.asset(emotion.filePath, height: Sizes.p28)
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
