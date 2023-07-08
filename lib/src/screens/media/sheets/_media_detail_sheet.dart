part of '../media_screen.dart';

class _MediaDetailSheet extends StatelessWidget {
  const _MediaDetailSheet(this.media);
  final Media media;

  @override
  Widget build(BuildContext context) {
    final youtubeId = media.youtubeId;

    // * DB에 트레일러 주소가 존재하면 영상을 틀어줘요.
    if (youtubeId.isNotEmpty) {
      return __YoutubeTrailerBody(
        youtubeId: youtubeId.first!,
        keywords: media.keywords.map((genre) => genre).toList(),
      );
    }
    // * 트레일러 주소가 없으면 안내 화면을 표시해요.
    else {
      return const __EmptyBody();
    }
  }
}

class __YoutubeTrailerBody extends ConsumerWidget {
  const __YoutubeTrailerBody({
    required this.youtubeId,
    required this.keywords,
  });

  final String youtubeId;
  final List<String> keywords;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        YoutubePlayer(config: YoutubePlayerConfig(videoId: youtubeId)),
        Padding(
          padding: const EdgeInsets.all(kContentPadding),
          child: Wrap(
            spacing: 8,
            children: keywords.map((genre) => Tag(genre)).toList(),
          ),
        ),
      ],
    );
  }
}

class __EmptyBody extends StatelessWidget {
  const __EmptyBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kContentPadding),
      child: Column(children: [
        const SizedBox(
          width: 200,
          height: 200,
          child: Placeholder(),
        ),
        Gap.h16,
        Text(
          "정보를 마련하는 중이에요\n나중에 다시 만나요",
          textAlign: TextAlign.center,
          style: context.textTheme.titleMedium,
        ),
      ]),
    );
  }
}
