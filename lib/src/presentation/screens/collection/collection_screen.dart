import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:serendy/src/_mock.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/collection/domain/collection.dart';
import 'package:serendy/src/features/media/domain/media.dart';
import 'package:serendy/src/presentation/screens/screens.dart';
import 'package:serendy/src/presentation/widgets/widgets.dart';

part 'widgets/collection_background.dart';
part 'widgets/collection_detail.dart';
part 'widgets/collection_titles.dart';
part 'widgets/medias_grid.dart';

@RoutePage()
class CollectionScreen extends StatelessWidget {
  const CollectionScreen({
    @pathParam required this.id,
    super.key,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    final collection = collectionsMock[0];

    return _CollectionTemplate(
      backgroundImage: _CollectionBackgroundImage(
        image: collection.image,
      ),
      titles: _CollectionTitles(
        title: collection.title,
        subtitle: collection.description,
      ),
      detail: _CollectionDetail(
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
