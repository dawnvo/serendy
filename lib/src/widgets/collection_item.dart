import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/collection/collection.dart';

class CollectionItem extends StatelessWidget {
  const CollectionItem({
    required this.collection,
    super.key,
    this.onTap,
  });

  final Collection collection;
  final VoidCallback? onTap;

  static const _imageSize = 56.0;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: kContentPadding,
      ),
      titleTextStyle: context.textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w500,
      ),
      subtitleTextStyle: context.textTheme.bodySmall?.copyWith(
        color: context.colorScheme.onSurfaceVariant,
      ),
      onTap: onTap,
      leading: _buildImage(context),
      title: Text(collection.title),
      subtitle: Text('작품 ${collection.itemCount}'),
    );
  }

  Widget _buildImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kBorderRadius),
      clipBehavior: Clip.hardEdge,
      child: CachedNetworkImage(
        imageUrl: collection.image ?? Assets.collectionDefaultImage,
        fit: BoxFit.cover,
        width: _imageSize,
        height: _imageSize,
      ),
    );
  }
}

//Placeholder
class Placeholder$CollectionItem extends StatelessWidget {
  const Placeholder$CollectionItem({super.key});

  @override
  Widget build(BuildContext context) {
    final color = context.colorScheme.surfaceVariant;
    const imageSize = CollectionItem._imageSize;

    return Container(
      constraints: const BoxConstraints(minHeight: 72),
      padding: const EdgeInsets.symmetric(
        horizontal: kContentPadding,
      ),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(kBorderRadius),
          clipBehavior: Clip.hardEdge,
          child: Container(
            color: color,
            width: imageSize,
            height: imageSize,
          ),
        ),
        Gap.w16,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: color,
              width: 120,
              height: context.textTheme.bodyMedium?.fontSize,
            ),
            Gap.h8,
            Container(
              color: color,
              width: 64,
              height: context.textTheme.bodySmall?.fontSize,
            ),
          ],
        ),
      ]),
    );
  }
}
