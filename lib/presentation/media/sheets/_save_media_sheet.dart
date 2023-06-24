part of '../media_screen.dart';

class _SaveMediaSheet extends StatelessWidget {
  const _SaveMediaSheet({required this.media});

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
