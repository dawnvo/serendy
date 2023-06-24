part of '../evaluate_media_screen.dart';

class _EvaluateMediaEmotionGrid extends StatelessWidget {
  const _EvaluateMediaEmotionGrid();

  void handleChange(
    BuildContext context, {
    required Emotion? previous,
    required Emotion current,
  }) {
    // 감정이 이전과 다르면 감정을 변경하고,
    if (previous != current) {
    }
    // 동일하면 선택을 취소해요.
    else {}
  }

  @override
  Widget build(BuildContext context) {
    final evaluation = ''.isEmpty ? evaluationMock : null;

    return GridView.count(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.p48,
        vertical: Sizes.p24,
      ),
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      children: [
        for (final emotion in Emotion.values)
          __EmotionGridTile(
            emotion: emotion,
            selected: emotion == evaluation?.emotion,
            onSelect: (selected) {
              handleChange(
                context,
                previous: evaluation?.emotion,
                current: selected,
              );
              context.pop();
            },
          )
      ],
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