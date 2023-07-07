part of '../theme_screen.dart';

class _ThemeMediasGrid extends StatelessWidget {
  const _ThemeMediasGrid({
    required this.theme,
    required this.medias,
  });

  final Theme theme;
  final List<Media> medias;

  @override
  Widget build(BuildContext context) {
    return SliverMediasGrid(
      childCount: medias.length,
      builder: (context, index) {
        final media = medias[index];
        return _buildMediaCard(context, media);
      },
    );
  }

  Widget _buildMediaCard(BuildContext context, Media media) {
    return MediaCard(
      onTap: () => context.pushNamed(
        AppRoutes.mediaName,
        pathParameters: {'id': media.id},
      ),
      onLongPress: () => ThemeItemMenuSheet.show(context, (
        theme: theme,
        media: media,
      )),
      media: media,
    );
  }
}
