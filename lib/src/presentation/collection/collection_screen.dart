import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:go_router/go_router.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/core/_mock.dart';
import 'package:serendy/src/features/collection/collection.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/presentation/@sheets/media_menu_sheet.dart';
import 'package:serendy/src/presentation/@widgets/widgets.dart';

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
    final collection = collectionsMock[0];

    return _CollectionTemplate(
      background: _CollectionBackground(
        image: collection.image,
      ),
      titles: _CollectionTitles(
        title: collection.title,
        subtitle: collection.description,
      ),
      detailBar: _CollectionDetailBar(
        collection: collection,
      ),
      mediasGrid: _CollectionMediasGrid(
        medias: collection.items.map((e) => e!.media).toList(),
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
