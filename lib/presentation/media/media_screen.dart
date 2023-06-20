import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix_icon/remixicon.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/core/enums.dart';
import 'package:serendy/core/locator.dart';
import 'package:serendy/features/collection/collection.dart';
import 'package:serendy/features/evaluation/evaluation.dart';
import 'package:serendy/features/media/media.dart';
import 'package:serendy/presentation/@blocs/blocs.dart';
import 'package:serendy/presentation/@sheets/sheets.dart';
import 'package:serendy/presentation/@widgets/widgets.dart';
import 'package:serendy/presentation/media/bloc/media_bloc.dart';

part 'sheets/_evaluate_media_sheet.dart';
part 'sheets/_media_reaction_detail_sheet.dart';
part 'sheets/_save_media_sheet.dart';
part 'widgets/_evaluate_icon_button.dart';
part 'widgets/_media_action_bar.dart';
part 'widgets/_media_image.dart';
part 'widgets/_media_info_tile.dart';
part 'widgets/_media_keywords.dart';
part 'widgets/_media_reaction_tile.dart';
part 'widgets/_media_title.dart';

@RoutePage()
class MediaScreen extends StatelessWidget {
  const MediaScreen({
    @pathParam required this.id,
    super.key,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MediaBloc(
            mediaService: sl(),
            evaluationService: sl(),
          )..add(Media$Fetched(id: id)),
        ),
        BlocProvider(
          create: (context) => MyEvaluationBloc(
            evaluationService: sl(),
          )..add(MyEvaluation$Fetched(mediaId: id)),
        ),
        BlocProvider(
          create: (context) => MyCollectionsBloc(
            collectionService: sl(),
          )..add(const MyCollections$Fetched()),
        ),
      ],
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
          contents: [
            _MediaReactionTile(reactions: state.reactions),
            const _MediaInfoTile(),
          ],
        ),
      MediaLoading() => const Center(child: CircularProgressIndicator()),
      MediaError() => Text(state.message),
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
