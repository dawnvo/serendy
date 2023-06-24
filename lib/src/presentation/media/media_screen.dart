import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/remixicon.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/core/_mock.dart';
import 'package:serendy/src/core/enums.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/presentation/@sheets/sheets.dart';
import 'package:serendy/src/presentation/@widgets/widgets.dart';

part 'sheets/_reaction_detail_sheet.dart';
part 'sheets/_save_media_sheet.dart';
part 'widgets/_action_bar.dart';
part 'widgets/_evaluate_icon_button.dart';
part 'widgets/_info_tile.dart';
part 'widgets/_media_cover_image.dart';
part 'widgets/_media_keywords.dart';
part 'widgets/_media_title.dart';
part 'widgets/_reaction_tile.dart';

class MediaScreen extends StatelessWidget {
  static const String routeName = 'medias';
  static const String routeLocation = '/$routeName/:id';
  const MediaScreen({
    required this.id,
    super.key,
  });

  final MediaID id;

  @override
  Widget build(BuildContext context) {
    final media = mediaMock;
    final reactions = [evaluationMock];

    return _MediaTemplate(
      coverImage: _MediaCoverImage(image: media.image),
      title: _MediaTitle(title: media.title),
      keyword: _MediaKeywords(
        genres: media.keywords,
        status: [
          (media.startDate?.year).toString(),
          media.status.name,
        ],
      ),
      actionBar: _MediaActionBar(media: media),
      contents: [
        _MediaReactionTile(reactions: reactions),
        const _MediaInfoTile(),
      ],
    );
  }
}

/// TEMPLATE
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
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: context.screenWidth * (5 / 4),
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
              Padding(
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
