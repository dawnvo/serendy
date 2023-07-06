part of '../collection_screen.dart';

class _CollectionMediasGrid extends StatelessWidget {
  const _CollectionMediasGrid({
    required this.collection,
    required this.medias,
  });

  final Collection collection;
  final List<Media> medias;

  @override
  Widget build(BuildContext context) {
    return SliverMediasGrid(
      childCount: medias.length,
      builder: (context, index) {
        final media = medias[index];

        return MediaCard(
          onTap: () => context.pushNamed(
            AppRoutes.mediaName,
            pathParameters: {'id': media.id},
          ),
          onLongPress: () => context.showCustomModalBottomSheet(
            (context) => CollectionItemMenuSheet(
              collection: collection,
              media: media,
            ),
          ),
          media: media,
        );
      },
    );
  }
}
