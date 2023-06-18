import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/features/media/domain/media.dart';
import 'package:serendy/presentation/@sheets/sheets.dart';
import 'package:serendy/presentation/@widgets/widgets.dart';

class SliverMediasGrid extends StatelessWidget {
  const SliverMediasGrid({
    required this.medias,
    super.key,
  });

  final List<Media?> medias;

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
        (context, index) {
          final media = medias[index]!;
          return MediaCard(
            media: media,
            onTap: () => context.pushRoute(MediaRoute(id: media.id)),
            onLongPress: () => context.showCustomModalBottomSheet(
              (context) => const MediaMenuSheet(),
            ),
          );
        },
        childCount: medias.length,
      ),
    );
  }
}
