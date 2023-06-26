import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/collection/collection.dart';
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

    return myCollectionsValue.when(
      data: (collections) => Padding(
        padding: const EdgeInsets.symmetric(vertical: Sizes.p12),
        child: CustomScrollView(shrinkWrap: true, slivers: [
          MyCollectionsList(
            onSelect: (collection) {
              ref.read(addCollectionItemProvider(
                id: collection.id,
                mediaId: media.id,
              ));
              context.pop();
            },
            collections: collections,
          ),
        ]),
      ),
      error: (err, stack) => Text(err.toString()),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
