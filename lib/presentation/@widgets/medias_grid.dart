import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/features/media/media.dart';
import 'package:serendy/presentation/@widgets/widgets.dart';

class SliverMediasGrid extends StatelessWidget {
  const SliverMediasGrid({
    required this.medias,
    required this.onLongPress,
    super.key,
  });

  final List<Media?> medias;
  final void Function(Media) onLongPress;

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
            onTap: () => context.pushNamed(
              AppRoutes.mediaName,
              pathParameters: {'id': media.id},
            ),
            onLongPress: () => onLongPress(media),
          );
        },
        childCount: medias.length,
      ),
    );
  }
}
