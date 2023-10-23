part of '../theme_screen.dart';

class _ThemeItemsGrid extends StatelessWidget {
  const _ThemeItemsGrid({
    required this.theme,
    required this.medias,
  });

  final Theme theme;
  final List<Media> medias;

  @override
  Widget build(BuildContext context) {
    return MediasGrid(
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
        AppRoutes.media,
        pathParameters: {'id': media.id},
        extra: media,
      ),
      onLongPress: () => ThemeItemMenuSheet.show(context, theme, media),
      media: media,
    );
  }
}
