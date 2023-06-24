part of 'package:serendy/presentation/profile/profile_screen.dart';

class _ProfileMyCollectionsList extends StatelessWidget {
  const _ProfileMyCollectionsList();

  @override
  Widget build(BuildContext context) {
    final collections = context.select<MyCollectionsBloc, List<Collection?>>(
      (bloc) => bloc.state.collections,
    );

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
