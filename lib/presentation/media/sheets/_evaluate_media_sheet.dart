part of 'package:serendy/presentation/media/media_screen.dart';

class _EvaluateMediaSheet extends StatelessWidget {
  const _EvaluateMediaSheet();

  void handleChange(
    BuildContext context, {
    required Emotion? previous,
    required Emotion current,
  }) {
    // 감정이 이전과 다르면 감정을 변경하고,
    if (previous != current) {
      // evaluationBloc.add(EvaluationUpdated(mediaId: mediaId, emotion: current));
    }
    // 동일하면 선택을 취소해요.
    else {
      // evaluationBloc.add(const EvaluationRemoved(mediaId: mediaId));
    }
  }

  @override
  Widget build(BuildContext context) {
    final evaluation = context.select<EvaluationBloc, Evaluation?>(
      (bloc) => bloc.state.evaluation,
    );

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
                selected: emotion == evaluation?.emotion,
                onSelect: (selected) {
                  handleChange(
                    context,
                    previous: evaluation?.emotion,
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
