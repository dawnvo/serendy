part of '../profile_screen.dart';

class _ProfileMyCollectionsList extends StatelessWidget {
  const _ProfileMyCollectionsList({required this.collections});

  final List<Collection?> collections;

  @override
  Widget build(BuildContext context) {
    return SliverMyCollectionsList(
      childCount: collections.length,
      builder: (context, index) {
        final collection = collections[index]!;
        return _buildCollectionItem(context, collection);
      },
    );
  }

  Widget _buildCollectionItem(BuildContext context, Collection collection) {
    return CollectionItem(
      onTap: () => context.pushNamed(
        AppRoutes.collectionName,
        pathParameters: {'id': collection.id},
      ),
      collection: collection,
    );
  }
}
