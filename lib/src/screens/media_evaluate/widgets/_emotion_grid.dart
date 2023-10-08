part of '../media_evaluate_screen.dart';

class _EvaluateMediaEmotionGrid extends ConsumerWidget {
  const _EvaluateMediaEmotionGrid({required this.mediaId});

  final MediaID mediaId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final debouncer = ref.watch(debouncerProvider);
    final evaluation = ref.watch(
      evaluateMediaControllerProvider(mediaId).select((_) => _.evaluation),
    );

    return SizedBox(
      width: 320,
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: Sizes.p24),
        children: [
          for (final emotion in Emotion.values)
            __EmotionGridTile(
              onSelect: (selected) => debouncer.run(() {
                ref
                    .read(evaluateMediaControllerProvider(mediaId).notifier)
                    .evaluate(emotion: selected);
              }),
              emotion: emotion,
              selected: emotion == evaluation?.emotion,
            )
        ],
      ),
    );
  }
}

class __EmotionGridTile extends StatelessWidget {
  const __EmotionGridTile({
    required this.selected,
    required this.emotion,
    required this.onSelect,
  });

  final Emotion emotion;
  final bool selected;
  final void Function(Emotion) onSelect;

  @override
  Widget build(BuildContext context) {
    final emotionIcon = SvgPicture.asset(
      emotion.filePath,
      height: Sizes.p48,
    );
    return InkWell(
      borderRadius: BorderRadius.circular(kBorderRadius),
      onTap: () => onSelect(emotion),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (selected)
              Opacity(
                opacity: 0.5,
                child: emotionIcon,
              )
            else
              emotionIcon,
            Gap.h12,
            Text(
              emotion.label,
              style: context.textTheme.labelMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
