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

  final double _imageSize = 56.0;

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
