part of '../media_screen.dart';

class _MediaDetailSheet extends ConsumerWidget {
  const _MediaDetailSheet({required this.media});

  final Media media;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(youtubePlayerController(
      const YoutubePlayerConfig(videoId: 'd7-GyxrbaG0'),
    ));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(kBorderRadius),
          clipBehavior: Clip.hardEdge,
          child: YoutubePlayer(controller: controller),
        ),
        Gap.h12,
        const Text(
          "스파이, 암살자 그리고 초능력자. "
          "각자 다른 사정이 있는 세 사람이"
          "서로에게 정체를 숨기고 가상 가족을 결성한다.",
        ),
        Gap.h8,
        Row(children: media.keywords.map((genre) => Tag(genre)).toList()),
      ],
    );
  }
}
