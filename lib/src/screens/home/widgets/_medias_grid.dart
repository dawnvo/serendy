part of '../home_screen.dart';

class _HomeMediasGrid extends ConsumerWidget {
  const _HomeMediasGrid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeValue = ref.watch(homeControllerProvider);

    return homeValue.when(
      data: (state) => SliverMediasGrid(
        childCount: state.medias.length,
        builder: (context, index) {
          final media = state.medias[index]!;
          return _buildMediaCard(context, media);
        },
      ),
      loading: () => SliverMediasGrid(
        childCount: 8,
        addAutomaticKeepAlives: false,
        builder: (context, index) => const Placeholder$MediaCard(),
      ),
      error: (err, stack) => SliverToBoxAdapter(
        child: Center(child: Text(err.toString())),
      ),
    );
  }

  Widget _buildMediaCard(BuildContext context, Media media) {
    return MediaCard(
      onTap: () => context.pushNamed(
        AppRoutes.mediaName,
        pathParameters: {'id': media.id},
      ),
      onLongPress: () => MediaMenuSheet.show(context, (media: media)),
      media: media,
    );
  }
}
