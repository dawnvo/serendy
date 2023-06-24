part of '../discover_screen.dart';

class _DiscoverCollectionsGrid extends StatelessWidget {
  const _DiscoverCollectionsGrid();

  @override
  Widget build(BuildContext context) {
    final collections = collectionsMock;

    return SliverCollectionsGrid(
      collections: collections,
    );
  }
}
