part of '../profile_screen.dart';

class _ProfileMyCollectionsList extends StatelessWidget {
  const _ProfileMyCollectionsList();

  @override
  Widget build(BuildContext context) {
    final collections = collectionsMock;

    return MyCollectionsList(
      collections: collections,
      onSelect: (collection) {
        context.pushNamed(
          AppRoutes.collectionName,
          pathParameters: {'id': collection.id},
        );
      },
    );
  }
}
