part of 'package:serendy/presentation/media/media_screen.dart';

class _SaveMediaSheet extends StatelessWidget {
  const _SaveMediaSheet({required this.media});

  final Media media;

  @override
  Widget build(BuildContext context) {
    final collections = context.select<MyCollectionsBloc, List<Collection?>>(
      (bloc) => bloc.state.collections,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Sizes.p12),
      child: CustomScrollView(shrinkWrap: true, slivers: [
        MyCollectionsList(
          collections: collections,
          onSelect: (collection) {
            context.read<MyCollectionsBloc>().add(MyCollections$ItemAdded(
                  collectionId: collection.id,
                  mediaId: media.id,
                ));
            context.popRoute();
          },
        ),
      ]),
    );
  }
}
