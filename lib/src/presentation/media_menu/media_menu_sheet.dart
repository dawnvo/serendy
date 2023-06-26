import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:go_router/go_router.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/presentation/@sheets/save_media_sheet.dart';
import 'package:serendy/src/presentation/@widgets/widgets.dart';

part 'widgets/_delete_collection_item_tile.dart';
part 'widgets/_hide_media_tile.dart';
part 'widgets/_save_media_tile.dart';
part 'widgets/_evaluate_media_tile.dart';
part 'widgets/_share_media_tile.dart';

enum MediaMenuType { media, collection }

class MediaMenuSheet extends StatelessWidget {
  const MediaMenuSheet({
    this.type = MediaMenuType.media,
    required this.media,
    super.key,
  });

  final MediaMenuType type;
  final Media media;

  @override
  Widget build(BuildContext context) {
    return _MediaMenuTemplate(
      mediaItem: MediaItem(media: media),
      evaluateTile: _EvaluateMediaTile(media: media),
      saveTile: _SaveMediaTile(media: media),
      destructiveTile: switch (type) {
        MediaMenuType.media => const _HideMediaTile(),
        MediaMenuType.collection => const _DeleteCollectionItemTile(),
      },
      shareTile: _ShareMediaTile(media: media),
    );
  }
}

class _MediaMenuTemplate extends StatelessWidget {
  const _MediaMenuTemplate({
    required this.mediaItem,
    required this.evaluateTile,
    required this.saveTile,
    required this.shareTile,
    required this.destructiveTile,
  });

  final MediaItem mediaItem;
  final _EvaluateMediaTile evaluateTile;
  final _SaveMediaTile saveTile;
  final _ShareMediaTile shareTile;
  final Widget destructiveTile;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Gap.h4,
        mediaItem,
        Gap.h4,
        const Divider(),
        Column(children: [
          evaluateTile,
          saveTile,
          destructiveTile,
          shareTile,
        ]),
      ]),
    );
  }
}

class _MediaMenuListTile extends StatelessWidget {
  const _MediaMenuListTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final Widget icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: icon,
      title: Text(title),
      iconColor: context.colorScheme.outline,
      titleTextStyle: context.textTheme.bodyMedium,
    );
  }
}
