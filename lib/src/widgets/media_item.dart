import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';

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

  static const _imageSize = 48.0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: Sizes.p64),
        padding: const EdgeInsets.symmetric(horizontal: kContentPadding),
        child: Row(children: [
          _buildImage(context),
          Gap.w16,
          Expanded(
            child: Text(
              media.title,
              style: context.textTheme.bodyLarge,
            ),
          ),
          if (onMoreTap != null) _buildMoreButton(context),
        ]),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Sizes.p8),
      clipBehavior: Clip.hardEdge,
      child: Image.network(
        media.images.smallImageUrl,
        fit: BoxFit.cover,
        width: _imageSize,
        height: _imageSize,
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

//Placeholder
class Placeholder$MediaItem extends StatelessWidget {
  const Placeholder$MediaItem({super.key});

  @override
  Widget build(BuildContext context) {
    final color = context.colorScheme.surfaceVariant;
    const imageSize = MediaItem._imageSize;
    final titleSize = context.textTheme.bodyLarge!;
    return Container(
      constraints: const BoxConstraints(minHeight: Sizes.p64),
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
        Container(
          color: color,
          width: 120,
          height: titleSize.fontSize! * titleSize.height!,
        ),
      ]),
    );
  }
}
