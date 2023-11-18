import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/widgets/widgets.dart';

class MediaDetailSheet extends StatelessWidget {
  const MediaDetailSheet(this.media);
  final Media media;

  /// 하단 시트를 열어요.
  static void show(BuildContext context, Media media) {
    context.showCustomBottomSheet((_) => MediaDetailSheet(media));
  }

  @override
  Widget build(BuildContext context) {
    final youtubeId = media.trailer;

    return SizedBox(
      height: context.screenHeight / 2,
      child: switch (youtubeId) {
        // * 트레일러가 존재하면 영상을 틀어요.
        String() => __YoutubeTrailerBody(
            youtubeId: youtubeId,
            keywords: media.keywords.map((genre) => genre).toList(),
            overview: media.overview,
          ),
        // * 없으면 안내 화면을 표시해요.
        null => const __EmptyBody(),
      },
    );
  }
}

class __YoutubeTrailerBody extends ConsumerWidget {
  const __YoutubeTrailerBody({
    required this.youtubeId,
    required this.keywords,
    required this.overview,
  });

  final String youtubeId;
  final List<String> keywords;
  final String? overview;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: context.screenHeight / 2,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YoutubePlayer(config: YoutubePlayerConfig(videoId: youtubeId)),
            Padding(
              padding: const EdgeInsets.all(kContentPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildKeywords(context),
                  Gap.h12,
                  _buildContent(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeywords(BuildContext context) {
    return Wrap(
      spacing: Sizes.p8,
      runSpacing: Sizes.p8,
      children: keywords.map((genre) => Tag(genre)).toList(),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (overview == null) return const SizedBox();
    return Text(overview!);
  }
}

class __EmptyBody extends StatelessWidget {
  const __EmptyBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kContentPadding),
      child: Center(child: _buildMessage(context)),
    );
  }

  Widget _buildMessage(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(RemixIcon.message_3_line, size: Sizes.p64),
        Gap.h20,
        Text(
          "정보를 마련하는 중이에요",
          textAlign: TextAlign.center,
          style: context.textTheme.titleMedium,
        ),
      ],
    );
  }
}
