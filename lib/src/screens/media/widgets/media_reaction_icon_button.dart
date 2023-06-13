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
    final myReactionValue = ref.watch(mediaReactionProvider);

    return myReactionValue.maybeWhen(
      orElse: () => const SizedBox(),
      data: (state) {
        final reaction = state.reaction;

        return Row(children: [
          if (reaction != null) _EmotionLabel(reaction.emotion),
          IconButton(
            onPressed: onPressed,
            icon: reaction != null
                ? SvgPicture.asset(reaction.emotion.filePath, height: Sizes.p28)
                : icon,
          ),
        ]);
      },
    );
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
