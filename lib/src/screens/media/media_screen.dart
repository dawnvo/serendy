import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/remixicon.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/core/enums.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/sheets/sheets.dart';
import 'package:serendy/src/widgets/widgets.dart';

import '../media_evaluate/controller/evaluate_media_controller.dart';
import 'controller/media_controller.dart';

part 'sheets/_media_detail_sheet.dart';
part 'sheets/_reaction_detail_sheet.dart';
part 'widgets/_action_bar.dart';
part 'widgets/_detail_tile.dart';
part 'widgets/_evaluate_icon_button.dart';
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
        coverImage: _MediaCoverImage(
          image: state.media.images.largeImageUrl,
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
      loading: () => const _Placeholder$MediaScreen(),
      error: (err, stack) => Scaffold(
        body: Center(child: Text(err.toString())),
      ),
    );
  }
}

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
            height: context.screenWidth * (9 / 8),
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
  const _Placeholder$MediaScreen();

  @override
  Widget build(BuildContext context) {
    final color = context.colorScheme.surfaceVariant;
    final tileTitleSize = context.textTheme.bodyLarge!;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(height: context.screenWidth * (9 / 8), color: color),
          Gap.h24,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kContentPadding),
            child: Column(children: [
              SizedBox(
                height: 64,
                child: Row(children: [
                  Container(color: color, width: 48 * 3, height: 48),
                  const Spacer(),
                  CircleAvatar(
                    backgroundColor: color,
                    radius: 48 / 2,
                  ),
                ]),
              ),
              ...List.filled(
                2,
                SizedBox(
                  height: 72,
                  child: Row(children: [
                    CircleAvatar(
                      backgroundColor: color,
                      radius: 28 / 2,
                    ),
                    Gap.w16,
                    Container(
                      color: color,
                      width: 160,
                      height: tileTitleSize.fontSize! * tileTitleSize.height!,
                    ),
                  ]),
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
