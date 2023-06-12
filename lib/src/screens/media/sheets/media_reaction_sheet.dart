part of '../media_screen.dart';

final _reactionProvider = StateProvider<Emotion?>((ref) => null);

class MediaReactionSheet extends ConsumerWidget {
  const MediaReactionSheet({super.key});

  void handleChange(
    WidgetRef ref, {
    required Emotion? previous,
    required Emotion? current,
  }) {
    Emotion? changed;

    // 감정이 이전과 다르면 감정을 변경하고, 동일하면 선택을 취소해요.
    if (previous != current) {
      changed = current;
    }

    ref.read(_reactionProvider.notifier).state = changed;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reaction = ref.watch(_reactionProvider);

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
              _EmotionItem(
                emotion: emotion,
                selected: emotion == reaction,
                onSelect: (selected) {
                  handleChange(
                    ref,
                    previous: reaction,
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

class _EmotionItem extends StatelessWidget {
  const _EmotionItem({
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
