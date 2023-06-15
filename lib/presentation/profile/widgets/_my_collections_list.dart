part of 'package:serendy/presentation/profile/profile_screen.dart';

class _ProfileMyCollectionsList extends StatelessWidget {
  const _ProfileMyCollectionsList();

  @override
  Widget build(BuildContext context) {
    List<Collection?> collections = collectionsMock;

    return MyCollectionsList(
      collections: collections,
      onSelect: (collection) {
        context.pushRoute(CollectionRoute(id: collection.id));
      },
    );
  }
}
