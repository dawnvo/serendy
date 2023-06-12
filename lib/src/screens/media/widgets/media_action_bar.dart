part of '../media_screen.dart';

class _MediaActionBar extends StatelessWidget {
  const _MediaActionBar({required this.media});

  final Media media;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Row(children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(RemixIcon.add_box_fill),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(RemixIcon.share_fill),
        ),
        IconButton(
          onPressed: () => context.showCustomModalBottomSheet(
            const MediaMenuSheet(),
          ),
          icon: const Icon(RemixIcon.more_2_fill),
        ),
        const Spacer(),
        IconButton(
          onPressed: () => context.showCustomModalBottomSheet(
            const MediaReactionSheet(),
          ),
          icon: const Icon(RemixIcon.emotion_fill),
        ),
      ]),
    );
  }
}
