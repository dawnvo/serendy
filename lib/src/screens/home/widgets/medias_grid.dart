part of '../home_screen.dart';

class _HomeMediasGrid extends StatelessWidget {
  const _HomeMediasGrid({required this.medias});

  final List<Media> medias;

  @override
  Widget build(BuildContext context) {
    const aspectRatio = 1 / 1.3333;
    const columns = 2;
    const spacing = 4.0;

    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: aspectRatio,
        crossAxisCount: columns,
        mainAxisSpacing: spacing,
        crossAxisSpacing: spacing,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) => MediaCard(
          media: medias[index],
          onTap: () => context.pushRoute(MediaRoute(id: 'mediaId')),
        ),
        childCount: medias.length,
      ),
    );
  }
}
