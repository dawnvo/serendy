part of 'package:serendy/presentation/profile/profile_screen.dart';

class _ProfileMyCollectionsList extends StatelessWidget {
  const _ProfileMyCollectionsList();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ProfileBloc>().state;
    List<Collection?> collections = [];

    if (state is ProfileLoaded) {
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
