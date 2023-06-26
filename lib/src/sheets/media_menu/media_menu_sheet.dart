import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/collection/collection.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/widgets/widgets.dart';

import 'controller/media_menu_controller.dart';

part 'widgets/_delete_collection_item_tile.dart';
part 'widgets/_evaluate_media_tile.dart';
part 'widgets/_hide_media_tile.dart';
part 'widgets/_save_media_tile.dart';
part 'widgets/_share_media_tile.dart';

enum MediaMenuType { media, collection }

/// TODO: 메뉴별로 나눌지 고민하기
///
/// 미디어 메뉴, 컬렉션 메뉴, 컬렉션항목 메뉴 등...
class MediaMenuSheet extends StatelessWidget {
  const MediaMenuSheet({
    this.type = MediaMenuType.media,
    required this.media,
    super.key,
    this.collectionId,
  });

  final MediaMenuType type;
  final Media media;
  // 컬렉션 화면에서 메뉴를 열면 식별자를 받아와요.
  final CollectionID? collectionId;

  @override
  Widget build(BuildContext context) {
    final provider = mediaMenuControllerProvider(media);

    return _MediaMenuTemplate(
      mediaItem: MediaItem(media: media),
      evaluateTile: _EvaluateMediaTile(provider),
      saveTile: _SaveMediaTile(provider),
      destructiveTile: switch (type) {
        MediaMenuType.media => _HideMediaTile(provider),
        MediaMenuType.collection => _DeleteCollectionItemTile(
            provider,
            collectionId: collectionId,
          ),
      },
      shareTile: _ShareMediaTile(provider),
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
