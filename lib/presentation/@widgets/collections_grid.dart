import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/features/collection/collection.dart';
import 'package:serendy/presentation/@widgets/widgets.dart';

class SliverCollectionsGrid extends StatelessWidget {
  const SliverCollectionsGrid({
    required this.collections,
    super.key,
  });

  final List<Collection?> collections;

  @override
  Widget build(BuildContext context) {
    const columns = 2;
    const spacing = 8.0;
    const contentHeight = 72.0;

    final screenWidth = context.screenWidth;
    final cardWidth = (screenWidth / columns) - (kContentPadding * 2) - spacing;

    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: cardWidth + contentHeight,
        crossAxisCount: columns,
        mainAxisSpacing: spacing,
        crossAxisSpacing: spacing,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final collection = collections[index]!;
          return CollectionCard(
            collection: collection,
            onTap: () => context.pushRoute(CollectionRoute(
              id: collection.id,
            )),
          );
        },
        childCount: collections.length,
      ),
    );
  }
}
