part of '../collection_screen.dart';

class _CollectionMediasGrid extends StatelessWidget {
  const _CollectionMediasGrid({
    required this.collectionId,
    required this.medias,
  });

  final CollectionID collectionId;
  final List<Media> medias;

  @override
  Widget build(BuildContext context) {
    return SliverMediasGrid(
      onLongPress: (media) => context.showCustomModalBottomSheet(
        (context) => MediaMenuSheet(
          type: MediaMenuType.collection,
          collectionId: collectionId,
          media: media,
        ),
      ),
      medias: medias,
    );
  }
}
