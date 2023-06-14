import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serendy/src/_mock.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/domain/evaluation.dart'
    hide MediaItem;
import 'package:serendy/src/features/media/application/media_detail/media_detail_provider.dart';
import 'package:serendy/src/features/media/application/media_reaction/media_reaction_provider.dart';
import 'package:serendy/src/features/media/domain/media.dart';
import 'package:serendy/src/presentation/screens/screens.dart';
import 'package:serendy/src/presentation/widgets/user/my_collections_list.dart';
import 'package:serendy/src/presentation/widgets/widgets.dart';

part 'sheets/media_menu_sheet.dart';
part 'sheets/media_reaction_detail_sheet.dart';
part 'sheets/media_reaction_sheet.dart';
part 'sheets/save_media_sheet.dart';

part 'widgets/media_action_bar.dart';
part 'widgets/media_image.dart';
part 'widgets/media_info_tile.dart';
part 'widgets/media_keyword.dart';
part 'widgets/media_reaction_icon_button.dart';
part 'widgets/media_reaction_tile.dart';
part 'widgets/media_title.dart';

@RoutePage()
class MediaScreen extends ConsumerWidget {
  const MediaScreen({
    @pathParam required this.id,
    super.key,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaValue = ref.watch(mediaDetailProvider);

    return mediaValue.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text(err.toString())),
      data: (state) {
        final media = state.media;

        if (media != null) {
          return _MediaView(media);
        } else {
          return const EmptyScreen();
        }
      },
    );
  }
}

class _MediaView extends StatelessWidget {
  const _MediaView(this.media);
  final Media media;

  @override
  Widget build(BuildContext context) {
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
        _MediaReactionTile(),
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