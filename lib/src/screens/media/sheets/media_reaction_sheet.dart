part of '../media_screen.dart';

class MediaReactionSheet extends StatelessWidget {
  const MediaReactionSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final emotionItems = Emotion.values
        .map((emotion) => _EmotionItem(
              emotion: emotion,
              onTap: () {},
            ))
        .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.p32),
      child: Column(children: [
        Gap.h12,
        Text(
          "감상 후 어떤 느낌이 들었나요?",
          style: context.textTheme.titleMedium,
        ),
        Gap.h24,
        Expanded(
          child: GridView.count(
            // physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            children: emotionItems,
          ),
        ),
      ]),
    );
  }
}

class _EmotionItem extends StatelessWidget {
  const _EmotionItem({
    required this.emotion,
    required this.onTap,
  });

  final Emotion emotion;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(kBorderRadius),
      onTap: onTap,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              emotion.filePath,
              width: Sizes.p48,
              height: Sizes.p48,
            ),
            Gap.h8,
            Text(
              emotion.label,
              style: context.textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}
