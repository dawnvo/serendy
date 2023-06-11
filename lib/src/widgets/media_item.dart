import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/models/models.dart';

class MediaItem extends StatelessWidget {
  const MediaItem({
    required this.media,
    super.key,
    this.onTap,
    this.onMoreTap,
  });

  final Media media;
  final VoidCallback? onTap;
  final VoidCallback? onMoreTap;

  final double _kImageSize = 48.0;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: _buildImage(context),
      title: Text(media.title),
      trailing: _buildMoreButton(context),
    );
  }

  Widget _buildImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        media.image,
        fit: BoxFit.cover,
        width: _kImageSize,
        height: _kImageSize,
      ),
    );
  }

  Widget _buildMoreButton(BuildContext context) {
    return IconButton(
      icon: const Icon(RemixIcon.more_2_line),
      onPressed: onMoreTap,
      alignment: Alignment.centerRight,
      padding: EdgeInsets.zero,
      color: context.colorScheme.outline,
    );
  }
}
