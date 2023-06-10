part of '../discover_screen.dart';

class _DiscoverCollectionsGrid extends StatelessWidget {
  const _DiscoverCollectionsGrid(this.items);

  final List<Collection> items;

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
        (context, index) => CollectionCard(
          collection: items[index],
          onTap: () => context.pushRoute(CollectionRoute(id: "collectionId")),
        ),
        childCount: items.length,
      ),
    );
  }
}
