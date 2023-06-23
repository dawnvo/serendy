import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/core/locator.dart';
import 'package:serendy/features/collection/collection.dart';
import 'package:serendy/features/media/media.dart';
import 'package:serendy/presentation/@sheets/media_menu_sheet.dart';
import 'package:serendy/presentation/@widgets/widgets.dart';
import 'package:serendy/presentation/collection/bloc/collection_bloc.dart';

part 'widgets/_collection_background_image.dart';
part 'widgets/_collection_titles.dart';
part 'widgets/_detail_bar.dart';
part 'widgets/_medias_grid.dart';

@RoutePage()
class CollectionScreen extends StatelessWidget {
  const CollectionScreen({
    @pathParam required this.id,
    super.key,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CollectionBloc(
        collectionService: sl(),
      )..add(Collection$Fetched(id: id)),
      child: const _CollectionView(),
    );
  }
}

class _CollectionView extends StatelessWidget {
  const _CollectionView();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CollectionBloc>().state;

    return switch (state) {
      CollectionLoaded() => _CollectionTemplate(
          backgroundImage: _CollectionBackgroundImage(
            image: state.collection.image,
          ),
          titles: _CollectionTitles(
            title: state.collection.title,
            subtitle: state.collection.description,
          ),
          detailBar: _CollectionDetailBar(
            collection: state.collection,
          ),
          mediasGrid: _CollectionMediasGrid(
            medias: state.collection.items.map((e) => e!.media).toList(),
          ),
        ),
      CollectionLoading() => const Center(child: CircularProgressIndicator()),
      CollectionError() => Text(state.message),
    };
  }
}

class _CollectionTemplate extends StatelessWidget {
  const _CollectionTemplate({
    required this.backgroundImage,
    required this.titles,
    required this.detailBar,
    required this.mediasGrid,
  });

  final _CollectionBackgroundImage backgroundImage;
  final _CollectionTitles titles;
  final _CollectionDetailBar detailBar;
  final _CollectionMediasGrid mediasGrid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          height: 320,
          width: double.infinity,
          child: backgroundImage,
        ),
        CustomScrollView(slivers: [
          const SliverAppBar(backgroundColor: Colors.transparent),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: kContentPadding,
            ),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titles,
                  detailBar,
                  Gap.h24,
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: kContentPadding,
            ),
            sliver: mediasGrid,
          ),
        ]),
      ]),
    );
  }
}
