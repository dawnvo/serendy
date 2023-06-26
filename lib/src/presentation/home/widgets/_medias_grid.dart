part of '../home_screen.dart';

class _HomeMediasGrid extends ConsumerWidget {
  const _HomeMediasGrid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeValue = ref.watch(homeControllerProvider);

    return homeValue.when(
      data: (state) => SliverMediasGrid(
        onLongPress: (media) => context.showCustomModalBottomSheet(
          (context) => MediaMenuSheet(media: media),
        ),
        medias: state.medias,
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
