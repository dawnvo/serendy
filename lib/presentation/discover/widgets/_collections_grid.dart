part of 'package:serendy/presentation/discover/discover_screen.dart';

class _DiscoverCollectionsGrid extends StatelessWidget {
  const _DiscoverCollectionsGrid({required this.collections});

  final List<Collection> collections;

  @override
  Widget build(BuildContext context) {
    return SliverCollectionsGrid(
      collections: collections,
    );
  }
}
