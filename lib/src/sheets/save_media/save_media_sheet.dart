import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/collection/collection.dart'
    hide CollectionItem;
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/widgets/widgets.dart';

class SaveMediaSheet extends ConsumerWidget {
  const SaveMediaSheet({
    required this.media,
    super.key,
  });

  final Media media;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myCollectionsValue = ref.watch(watchMyCollectionsListProvider);

    void handleSelect(Collection collection) {
      ref.read(addCollectionItemProvider(
        id: collection.id,
        mediaId: media.id,
      ));
      context.pop();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Sizes.p12),
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          myCollectionsValue.when(
            data: (collections) => SliverMyCollectionsList(
              childCount: collections.length,
              builder: (context, index) {
                final collection = collections[index]!;

                return CollectionItem(
                  onTap: () => handleSelect(collection),
                  collection: collection,
                );
              },
            ),
            loading: () => SliverMyCollectionsList(
              childCount: 4,
              showCreateTile: false,
              addAutomaticKeepAlives: false,
              builder: (context, index) => const Placeholder$CollectionItem(),
            ),
            error: (err, stack) => SliverToBoxAdapter(
              child: Center(child: Text(err.toString())),
            ),
          ),
        ],
      ),
    );
  }
}
