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
          icon: const Icon(RemixIcon.add_box_fill),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(RemixIcon.share_fill),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(RemixIcon.more_2_fill),
          onPressed: () => context.showCustomModalBottomSheet(
            const MediaMenuSheet(),
          ),
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(RemixIcon.emotion_fill),
          onPressed: () {},
        ),
      ]),
    );
  }
}
