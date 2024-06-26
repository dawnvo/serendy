part of '../home_screen.dart';

class _HomeMediasGrid extends ConsumerWidget {
  const _HomeMediasGrid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeValue = ref.watch(homeControllerProvider);

    return homeValue.when(
      skipLoadingOnReload: true,
      data: (state) => RefreshIndicator(
        onRefresh: () => ref.refresh(getMediasProvider(page: 0).future),
        child: MediasGrid(
          childCount: state.medias.length,
          builder: (context, index) {
            final media = state.medias[index]!;
            return _buildMediaCard(context, media);
          },
        ),
      ),
      loading: () => MediasGrid(
        childCount: 8,
        addAutomaticKeepAlives: false,
        builder: (context, index) => const Placeholder$MediaCard(),
      ),
      error: (err, stack) => const ErrorTemplate(
        message: "작품을 불러오지 못했어요.",
      ),
    );
  }

  Widget _buildMediaCard(BuildContext context, Media media) {
    return MediaCard(
      onTap: () => context.pushNamed(
        AppRoutes.media,
        pathParameters: {'id': media.id},
        extra: media,
      ),
      onLongPress: () => MediaMenuSheet.show(context, media),
      media: media,
    );
  }
}
