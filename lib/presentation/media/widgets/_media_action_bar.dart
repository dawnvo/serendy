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
            (context) => BlocProvider.value(
              value: context.read<ProfileBloc>(),
              child: _SaveMediaSheet(media: media),
            ),
          ),
          icon: const Icon(RemixIcon.add_box_fill),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(RemixIcon.share_fill),
        ),
        IconButton(
          onPressed: () => context.showCustomModalBottomSheet(
            (context) => MediaMenuSheet(media: media),
          ),
          icon: const Icon(RemixIcon.more_2_fill),
        ),
        const Spacer(),
        _EvaluateIconButton(
          onPressed: () => context.showCustomModalBottomSheet(
            (context) => BlocProvider.value(
              value: context.read<EvaluationBloc>(),
              child: _EvaluateMediaSheet(media: media),
            ),
          ),
          icon: const Icon(RemixIcon.emotion_fill),
        ),
      ]),
    );
  }
}
