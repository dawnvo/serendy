import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serendy/src/features/auth/auth.dart';
import 'package:serendy/src/features/collection/collection.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/widgets/widgets.dart';

import 'widgets/_delete_collection_item_tile.dart';
import 'widgets/_evaluate_media_tile.dart';
import 'widgets/_hide_media_tile.dart';
import 'widgets/_save_media_tile.dart';
import 'widgets/_share_media_tile.dart';

class CollectionItemMenuSheet extends ConsumerWidget {
  const CollectionItemMenuSheet({
    required this.collection,
    required this.media,
    super.key,
  });

  final Collection collection;
  final Media media;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserId = ref.watch(requireUserIdProvider);
    final isOwner = currentUserId == collection.owner.id;

    return MenuTemplate(
      info: MenuInfo(
        image: media.image,
        title: media.title,
      ),
      options: [
        EvaluateMediaTile(media: media),
        SaveMediaTile(media: media),
        if (isOwner)
          DeleteCollectionItemTile(media: media, collectionId: collection.id)
        else
          HideMediaTile(media: media),
        ShareMediaTile(media: media),
      ],
    );
  }
}
