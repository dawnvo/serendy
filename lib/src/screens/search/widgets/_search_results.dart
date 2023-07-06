part of '../search_screen.dart';

class _SearchResults extends ConsumerWidget {
  const _SearchResults();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchValue = ref.watch(searchControllerProvider);

    return searchValue.when(
      data: (state) => SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: state.medias.length,
          (context, index) {
            final media = state.medias[index]!;
            return _buildMediaItem(context, media);
          },
        ),
      ),
      loading: () => SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: 4,
          addAutomaticKeepAlives: false,
          (context, index) => const Placeholder$MediaItem(),
        ),
      ),
      error: (err, stack) => SliverToBoxAdapter(
        child: Center(child: Text(err.toString())),
      ),
    );
  }

  Widget _buildMediaItem(BuildContext context, Media media) {
    return MediaItem(
      onTap: () => context.pushNamed(
        AppRoutes.mediaName,
        pathParameters: {'id': media.id},
      ),
      onMoreTap: () => context.showCustomModalBottomSheet(
        (context) => MediaMenuSheet(media: media),
      ),
      media: media,
    );
  }
}
