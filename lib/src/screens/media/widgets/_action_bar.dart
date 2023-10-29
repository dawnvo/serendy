part of '../media_screen.dart';

class _MediaActionBar extends StatelessWidget {
  const _MediaActionBar({required this.media});

  final Media media;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.p64,
      child: Row(children: [
        IconButton(
          onPressed: () => SaveMediaSheet.show(context, media),
          icon: const Icon(RemixIcon.add_box_fill),
        ),
        IconButton(
          onPressed: () => Share.share(
            '${Assets.applink}/medias/${media.id}',
            subject: media.title,
          ),
          icon: const Icon(RemixIcon.share_fill),
        ),
        IconButton(
          onPressed: () => MediaMenuSheet.show(context, media),
          icon: const Icon(RemixIcon.more_2_fill),
        ),
        const Spacer(),
        _MediaEvaluateIconButton(media: media),
      ]),
    );
  }
}
