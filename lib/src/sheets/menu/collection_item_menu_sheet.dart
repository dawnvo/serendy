import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/auth/auth.dart';
import 'package:serendy/src/features/collection/collection.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/widgets/widgets.dart';

import 'widgets/_delete_collection_item_tile.dart';
import 'widgets/_evaluate_media_tile.dart';
import 'widgets/_hide_media_tile.dart';
import 'widgets/_save_media_tile.dart';
import 'widgets/_share_media_tile.dart';

typedef CollectionItemMenuSheetPayload = ({
  Collection collection,
  Media media,
});

class CollectionItemMenuSheet extends ConsumerWidget {
  const CollectionItemMenuSheet(this.payload, {super.key});
  final CollectionItemMenuSheetPayload payload;

  static void show(
      BuildContext context, CollectionItemMenuSheetPayload payload) {
    context.showCustomBottomSheet((_) => CollectionItemMenuSheet(payload));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserId = ref.watch(requireUserIdProvider);
    final isOwner = currentUserId == payload.collection.owner.id;

    return MenuTemplate(
      info: MenuInfo(
        image: payload.media.image,
        title: payload.media.title,
      ),
      options: [
        EvaluateMediaTile(media: payload.media),
        SaveMediaTile(media: payload.media),
        if (isOwner)
          DeleteCollectionItemTile(
            media: payload.media,
            collection: payload.collection,
          )
        else
          HideMediaTile(media: payload.media),
        ShareMediaTile(media: payload.media),
      ],
    );
  }
}
