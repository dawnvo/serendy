part of '../profile_screen.dart';

class _ProfileMyCollectionsList extends StatelessWidget {
  const _ProfileMyCollectionsList({required this.collections});

  final List<Collection?> collections;

  @override
  Widget build(BuildContext context) {
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
