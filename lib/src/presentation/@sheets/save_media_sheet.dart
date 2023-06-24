import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/core/_mock.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/presentation/@widgets/widgets.dart';

class SaveMediaSheet extends StatelessWidget {
  const SaveMediaSheet({
    required this.media,
    super.key,
  });

  final Media media;

  @override
  Widget build(BuildContext context) {
    final collections = collectionsMock;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Sizes.p12),
      child: CustomScrollView(shrinkWrap: true, slivers: [
        MyCollectionsList(
          collections: collections,
          onSelect: (collection) {
            context.pop();
          },
        ),
      ]),
    );
  }
}
