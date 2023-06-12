import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:serendy/src/_mock.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/models/models.dart';
import 'package:serendy/src/widgets/media_item.dart';
import 'package:serendy/src/widgets/tag.dart';

part 'sheets/media_menu_sheet.dart';
part 'widgets/media_action_bar.dart';
part 'widgets/media_image.dart';
part 'widgets/media_info_tile.dart';
part 'widgets/media_keyword.dart';
part 'widgets/media_title.dart';

@RoutePage()
class MediaScreen extends StatelessWidget {
  const MediaScreen({
    @pathParam required this.id,
    super.key,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    final media = mediaMock;
    final mediaStartDate = (media.startDate?.year).toString();

    return _MediaTemplate(
      image: _MediaImage(image: media.image),
      title: _MediaTitle(title: media.title),
      keyword: _MediaKeyword(
        genres: media.keywords,
        status: [mediaStartDate, media.status.name],
      ),
      actionBar: _MediaActionBar(media: media),
      contents: const [
        _MediaInfoTile(),
      ],
    );
  }
}

class _MediaTemplate extends StatelessWidget {
  const _MediaTemplate({
    required this.image,
    required this.title,
    required this.keyword,
    required this.actionBar,
    required this.contents,
  });

  final _MediaImage image;
  final _MediaTitle title;
  final _MediaKeyword keyword;
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
              image,
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
