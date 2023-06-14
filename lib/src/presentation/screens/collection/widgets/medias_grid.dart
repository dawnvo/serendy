part of '../collection_screen.dart';

class _CollectionMediasGrid extends StatelessWidget {
  const _CollectionMediasGrid({required this.medias});

  final List<Media> medias;

  @override
  Widget build(BuildContext context) {
    return MediasGrid(medias: medias);
  }
}