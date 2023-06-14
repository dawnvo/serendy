import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix_icon/remixicon.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serendy/_mock.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/features/evaluation/data/evaluation_repository.dart';
import 'package:serendy/features/evaluation/domain/evaluation.dart';
import 'package:serendy/features/media/application/media_bloc.dart';
import 'package:serendy/features/media/data/media_repository.dart';
import 'package:serendy/features/media/domain/media.dart';
import 'package:serendy/presentation/@sheets/sheets.dart';
import 'package:serendy/presentation/@widgets/widgets.dart';

part 'sheets/_save_media_sheet.dart';
part 'sheets/_media_reaction_detail_sheet.dart';
part 'sheets/_media_reaction_sheet.dart';

part 'widgets/_media_image.dart';
part 'widgets/_media_title.dart';
part 'widgets/_media_keywords.dart';
part 'widgets/_media_action_bar.dart';
part 'widgets/_media_reaction_icon_button.dart';
part 'widgets/_media_reaction_tile.dart';
part 'widgets/_media_info_tile.dart';

@RoutePage()
class MediaScreen extends StatelessWidget {
  const MediaScreen({
    @pathParam required this.id,
    super.key,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MediaBloc(
        mediaRepository: MediaRepository(),
        evaluationRepository: EvaluationRepository(),
      )..add(MediaFetched(id: id)),
      child: const _MediaView(),
    );
  }
}

/// VIEW
class _MediaView extends StatelessWidget {
  const _MediaView();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MediaBloc>().state;

    return switch (state) {
      MediaLoaded() => _MediaTemplate(
          image: _MediaImage(image: state.media.image),
          title: _MediaTitle(title: state.media.title),
          keyword: _MediaKeywords(
            genres: state.media.keywords,
            status: [
              (state.media.startDate?.year).toString(),
              state.media.status.name,
            ],
          ),
          actionBar: _MediaActionBar(media: state.media),
          contents: const [
            _MediaReactionTile(),
            _MediaInfoTile(),
          ],
        ),
      MediaLoading() => const CircularProgressIndicator(),
      MediaError() => Text(state.message),
      MediasListLoaded() => const SizedBox(),
    };
  }
}

/// TEMPLATE
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
