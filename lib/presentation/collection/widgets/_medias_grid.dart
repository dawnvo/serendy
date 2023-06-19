part of 'package:serendy/presentation/collection/collection_screen.dart';

class _CollectionMediasGrid extends StatelessWidget {
  const _CollectionMediasGrid({required this.medias});

  final List<Media> medias;

  @override
  Widget build(BuildContext context) {
    return SliverMediasGrid(
      medias: medias,
      onLongPress: (media) => context.showCustomModalBottomSheet(
        (context) => MediaMenuSheet(
          type: MediaMenuType.collection,
          media: media,
        ),
      ),
    );
  }
}
