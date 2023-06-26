import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/remixicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/core/enums.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/sheets/sheets.dart';
import 'package:serendy/src/widgets/widgets.dart';

import '../media_evaluate/controller/evaluate_media_controller.dart';
import 'controller/media_controller.dart';

part 'sheets/_reaction_detail_sheet.dart';
part 'widgets/_action_bar.dart';
part 'widgets/_evaluate_icon_button.dart';
part 'widgets/_info_tile.dart';
part 'widgets/_media_cover_image.dart';
part 'widgets/_media_keywords.dart';
part 'widgets/_media_title.dart';
part 'widgets/_reaction_tile.dart';

class MediaScreen extends ConsumerWidget {
  static const String routeName = 'medias';
  static const String routeLocation = '/$routeName/:id';
  const MediaScreen({
    required this.id,
    super.key,
  });

  final MediaID id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaValue = ref.watch(mediaControllerProvider(id));

    return mediaValue.when(
      data: (state) => _MediaTemplate(
        coverImage: _MediaCoverImage(image: state.media.image),
        title: _MediaTitle(title: state.media.title),
        keyword: _MediaKeywords(
          genres: state.media.keywords,
          status: [
            '${state.media.startDate?.year}',
            state.media.status.name,
          ],
        ),
        actionBar: _MediaActionBar(media: state.media),
        contents: [
          _MediaReactionTile(reactions: state.reactions),
          const _MediaInfoTile(),
        ],
      ),
      error: (err, stack) => Scaffold(
        body: Center(child: Text(err.toString())),
      ),
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
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
