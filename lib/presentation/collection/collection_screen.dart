import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/features/collection/application/collection_bloc.dart';
import 'package:serendy/features/collection/data/collection_repository_fake.dart';
import 'package:serendy/features/collection/domain/collection.dart';
import 'package:serendy/features/media/domain/media.dart';
import 'package:serendy/presentation/@widgets/widgets.dart';

part 'widgets/_collection_background.dart';
part 'widgets/_collection_detail.dart';
part 'widgets/_collection_titles.dart';
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
        collectionRepository: CollectionRepositoryFake(),
      )..add(CollectionFetched(id: id)),
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
          detail: _CollectionDetail(
            collection: state.collection,
          ),
          mediasGrid: _CollectionMediasGrid(
            medias: state.collection.items.map((e) => e!.media).toList(),
          ),
        ),
      CollectionLoading() => const Center(child: CircularProgressIndicator()),
      CollectionError() => Text(state.message),
      CollectionsListLoaded() => const SizedBox(),
    };
  }
}

class _CollectionTemplate extends StatelessWidget {
  const _CollectionTemplate({
    required this.backgroundImage,
    required this.titles,
    required this.detail,
    required this.mediasGrid,
  });

  final _CollectionBackgroundImage backgroundImage;
  final _CollectionTitles titles;
  final _CollectionDetail detail;
  final _CollectionMediasGrid mediasGrid;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(children: [
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
                  Gap.h8,
                  detail,
                  Gap.h32,
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
