part of '../discover_screen.dart';

class _DiscoverCollectionsGrid extends ConsumerWidget {
  const _DiscoverCollectionsGrid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final discoverValue = ref.watch(discoverControllerProvider);

    return discoverValue.when(
      data: (state) => SliverCollectionsGrid(
        collections: state.collections,
      ),
      error: (err, stack) => SliverToBoxAdapter(
        child: Center(child: Text(err.toString())),
      ),
      loading: () => const SliverToBoxAdapter(
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
