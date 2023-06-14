import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/domain/media.dart';
import 'package:serendy/src/presentation/screens/screens.dart';
import 'package:serendy/src/presentation/widgets/widgets.dart';

class SliverMediasGrid extends StatelessWidget {
  const SliverMediasGrid({
    required this.medias,
    super.key,
  });

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
          onLongPress: () => context.showCustomModalBottomSheet(
            const MediaMenuSheet(),
          ),
        ),
        childCount: medias.length,
      ),
    );
  }
}
