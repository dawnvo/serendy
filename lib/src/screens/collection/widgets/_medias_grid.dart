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
      onLongPress: (media) => context.showCustomModalBottomSheet(
        (context) => CollectionItemMenuSheet(
          collection: collection,
          media: media,
        ),
      ),
      medias: medias,
    );
  }
}
