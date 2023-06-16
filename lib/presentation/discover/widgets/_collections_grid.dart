part of 'package:serendy/presentation/discover/discover_screen.dart';

class _DiscoverCollectionsGrid extends StatelessWidget {
  const _DiscoverCollectionsGrid();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<DiscoverBloc>().state;
    List<Collection?> collections = [];

    if (state is DiscoverLoaded) {
      collections = state.collections;
    }

    return SliverCollectionsGrid(
      collections: collections,
    );
  }
}
