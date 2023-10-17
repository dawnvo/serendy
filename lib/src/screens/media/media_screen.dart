import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/sheets/sheets.dart';
import 'package:serendy/src/widgets/widgets.dart';

import '../media_evaluate/controller/evaluate_media_controller.dart';
import 'controller/media_controller.dart';

import 'sheets/save_media_sheet.dart';
import 'sheets/media_detail_sheet.dart';
import 'sheets/reaction_detail_sheet.dart';

part 'widgets/_action_bar.dart';
part 'widgets/_detail_tile.dart';
part 'widgets/_evaluate_icon_button.dart';
part 'widgets/_media_cover_image.dart';
part 'widgets/_media_keywords.dart';
part 'widgets/_media_title.dart';
part 'widgets/_reaction_tile.dart';

class MediaScreen extends ConsumerWidget {
  static const String routeName = 'medias';
  static const String routeLocation = '$routeName/:id';
  const MediaScreen({
    required this.id,
    this.media,
  });

  final MediaID id;
  final Media? media;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaValue = ref.watch(mediaControllerProvider(id));

    return mediaValue.when(
      skipLoadingOnReload: true,
      data: (state) => _MediaTemplate(
        coverImage: _MediaCoverImage(
          image: state.media.image,
        ),
        title: _MediaTitle(title: state.media.title),
        keyword: _MediaKeywords(
          genres: state.media.keywords,
          status: [
            '${state.media.startDate?.year}',
            state.media.status.label,
          ],
        ),
        actionBar: _MediaActionBar(media: state.media),
        contents: [
          _MediaReactionsTile(reactions: state.reactions),
          _MediaDetailsTile(media: state.media),
        ],
      ),
      loading: () => _Placeholder$MediaScreen(media),
      error: (err, stack) => const ErrorTemplate(
        message: "작품 정보를 불러오지 못했어요.",
        backButton: true,
      ),
    );
  }
}

//Template
class _MediaTemplate extends StatelessWidget {
  const _MediaTemplate({
    required this.coverImage,
    required this.title,
    required this.keyword,
    required this.actionBar,
    required this.contents,
  });

  final _MediaCoverImage coverImage;
  final _MediaTitle title;
  final _MediaKeywords keyword;
  final _MediaActionBar actionBar;
  final List<Widget> contents;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: context.screenHeight / 1.8,
            child: Stack(fit: StackFit.expand, children: [
              coverImage,
              Align(
                alignment: Alignment.bottomLeft,
                child: title,
              ),
            ]),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kContentPadding,
                ),
                child: keyword,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: kContentPadding / 2,
                ),
                child: actionBar,
              ),
              ...contents,
              Gap.h40,
            ],
          ),
        ]),
      ),
    );
  }
}

//Placeholder
class _Placeholder$MediaScreen extends StatelessWidget {
  const _Placeholder$MediaScreen(this.media);
  final Media? media;

  @override
  Widget build(BuildContext context) {
    final data = media;
    if (data == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: LoadingIndicator()),
      );
    }
    return _MediaTemplate(
      coverImage: _MediaCoverImage(image: data.image),
      title: _MediaTitle(title: data.title),
      keyword: _MediaKeywords(
        genres: data.keywords,
        status: [
          '${data.startDate?.year}',
          data.status.label,
        ],
      ),
      actionBar: _MediaActionBar(media: data),
      contents: const [Center(child: LoadingIndicator())],
    );
  }
}
