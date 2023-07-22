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
      error: (err, stack) => const SliverToBoxAdapter(
        child: Center(child: Text("검색 결과를 불러오지 못했어요.")),
      ),
    );
  }

  Widget _buildMediaItem(BuildContext context, Media media) {
    return MediaItem(
      onTap: () => context.pushNamed(
        AppRoutes.media,
        pathParameters: {'id': media.id},
        extra: media,
      ),
      onMoreTap: () => MediaMenuSheet.show(context, media),
      media: media,
    );
  }
}
