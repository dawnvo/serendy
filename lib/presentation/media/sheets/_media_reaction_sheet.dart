part of 'package:serendy/presentation/media/media_screen.dart';

class _MediaReactionSheet extends StatelessWidget {
  const _MediaReactionSheet();

  void handleChange({
    required Emotion? previous,
    required Emotion? current,
  }) {
    Emotion? changed;

    // 감정이 이전과 다르면 감정을 변경하고, 동일하면 선택을 취소해요.
    if (previous != current) {
      changed = current;
    }

    print(changed);

    // ref.read(mediaReactionProvider.notifier).changeEmotion(changed);
  }

  @override
  Widget build(BuildContext context) {
    final reaction = evaluationMock;

    return SingleChildScrollView(
      child: Column(children: [
        Gap.h12,
        Text(
          "감상 후 어떤 느낌이 들었나요?",
          style: context.textTheme.titleMedium,
        ),
        GridView.count(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.p32,
            vertical: Sizes.p24,
          ),
          shrinkWrap: true,
          crossAxisCount: 3,
          children: [
            for (final emotion in Emotion.values)
              _EmotionGridTile(
                emotion: emotion,
                selected: emotion == reaction.emotion,
                onSelect: (selected) {
                  handleChange(
                    previous: reaction.emotion,
                    current: selected,
                  );
                  context.popRoute();
                },
              )
          ],
        ),
      ]),
    );
  }
}

class _EmotionGridTile extends StatelessWidget {
  const _EmotionGridTile({
    required this.selected,
    required this.emotion,
    required this.onSelect,
  });

  final Emotion emotion;
  final bool selected;
  final void Function(Emotion?) onSelect;

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
            selected
                ? Opacity(
                    opacity: 0.5,
                    child: emotionIcon,
                  )
                : emotionIcon,
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
