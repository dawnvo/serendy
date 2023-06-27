import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/collection/collection.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/widgets/widgets.dart';
import 'package:serendy/src/sheets/sheets.dart';

import 'controller/collection_controller.dart';

part 'widgets/_collection_background.dart';
part 'widgets/_collection_titles.dart';
part 'widgets/_detail_bar.dart';
part 'widgets/_medias_grid.dart';

class CollectionScreen extends ConsumerWidget {
  static const String routeName = 'collections';
  static const String routeLocation = '/$routeName/:id';
  const CollectionScreen({
    required this.id,
    super.key,
  });

  final CollectionID id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionValue = ref.watch(collectionControllerProvider(id));

    return collectionValue.when(
      skipLoadingOnReload: true,
      data: (state) => _CollectionTemplate(
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
          collection: state.collection,
          medias: state.collection.items.map((e) => e!.media).toList(),
        ),
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
