part of 'package:serendy/presentation/media/media_screen.dart';

class _MediaActionBar extends StatelessWidget {
  const _MediaActionBar({required this.media});

  final Media media;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Row(children: [
        IconButton(
          onPressed: () => context.showCustomModalBottomSheet(
            (context) => const _SaveMediaSheet(),
          ),
          icon: const Icon(RemixIcon.add_box_fill),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(RemixIcon.share_fill),
        ),
        IconButton(
          onPressed: () => context.showCustomModalBottomSheet(
            (context) => const MediaMenuSheet(),
          ),
          icon: const Icon(RemixIcon.more_2_fill),
        ),
        const Spacer(),
        _EvaluateIconButton(
          onPressed: () => context.showCustomModalBottomSheet(
            (context) => const _EvaluateMediaSheet(),
          ),
          icon: const Icon(RemixIcon.emotion_fill),
        ),
      ]),
    );
  }
}
