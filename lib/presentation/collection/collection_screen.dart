import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:go_router/go_router.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/core/locator.dart';
import 'package:serendy/features/collection/collection.dart';
import 'package:serendy/features/media/media.dart';
import 'package:serendy/presentation/@sheets/media_menu_sheet.dart';
import 'package:serendy/presentation/@widgets/widgets.dart';
import 'package:serendy/presentation/collection/bloc/collection_bloc.dart';

part 'widgets/_collection_background.dart';
part 'widgets/_collection_titles.dart';
part 'widgets/_detail_bar.dart';
part 'widgets/_medias_grid.dart';

class CollectionScreen extends StatelessWidget {
  static const String routeName = 'collections';
  static const String routeLocation = '/$routeName/:id';
  const CollectionScreen({
    required this.id,
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
          background: _CollectionBackground(
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
    required this.background,
    required this.titles,
    required this.detailBar,
    required this.mediasGrid,
  });

  final _CollectionBackground background;
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
          child: background,
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
