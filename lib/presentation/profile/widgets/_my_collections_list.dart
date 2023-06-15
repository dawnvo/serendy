part of 'package:serendy/presentation/profile/profile_screen.dart';

class _ProfileMyCollectionsList extends StatelessWidget {
  const _ProfileMyCollectionsList();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CollectionBloc>().state;
    List<Collection?> collections = [];

    if (state is CollectionsListLoaded) {
      collections = state.collections;
    }

    return MyCollectionsList(
      collections: collections,
      onSelect: (collection) {
        context.pushRoute(CollectionRoute(id: collection.id));
      },
    );
  }
}
