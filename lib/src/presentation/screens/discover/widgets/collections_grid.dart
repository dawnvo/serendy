part of '../discover_screen.dart';

class _DiscoverCollectionsGrid extends StatelessWidget {
  const _DiscoverCollectionsGrid(this.collections);

  final List<Collection> collections;

  @override
  Widget build(BuildContext context) {
    return SliverCollectionsGrid(
      collections: collections,
    );
  }
}
