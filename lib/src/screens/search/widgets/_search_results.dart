part of '../search_screen.dart';

class _SearchResults extends ConsumerWidget {
  const _SearchResults();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchValue = ref.watch(searchControllerProvider);

    return searchValue.when(
      data: (state) => ListView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: state.medias.length,
        itemBuilder: (context, index) {
          final media = state.medias[index]!;
          return _buildMediaItem(context, media);
        },
      ),
      error: (err, stack) => Center(child: Text(err.toString())),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  MediaItem _buildMediaItem(BuildContext context, Media media) {
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
