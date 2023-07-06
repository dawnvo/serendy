part of '../discover_screen.dart';

class _DiscoverCollectionsGrid extends ConsumerWidget {
  const _DiscoverCollectionsGrid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final discoverValue = ref.watch(discoverControllerProvider);

    return discoverValue.when(
      data: (state) => SliverCollectionsGrid(
        childCount: state.collections.length,
        builder: (context, index) {
          final collection = state.collections[index]!;
          return _buildCollectionCard(context, collection);
        },
      ),
      loading: () => SliverCollectionsGrid(
        childCount: 8,
        addAutomaticKeepAlives: false,
        builder: (context, index) => const Placeholder$CollectionCard(),
      ),
      error: (err, stack) => SliverToBoxAdapter(
        child: Center(child: Text(err.toString())),
      ),
    );
  }

  Widget _buildCollectionCard(BuildContext context, Collection collection) {
    return CollectionCard(
      onTap: () => context.pushNamed(
        AppRoutes.collectionName,
        pathParameters: {'id': collection.id},
      ),
      collection: collection,
    );
  }
}
