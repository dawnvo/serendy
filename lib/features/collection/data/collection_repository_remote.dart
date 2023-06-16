import 'package:graphql/client.dart';
import 'package:serendy/_mock.dart';
import 'package:serendy/bootstrap.dart';
import 'package:serendy/features/collection/data/collection_repository.dart';
import 'package:serendy/features/collection/domain/collection.dart';
import 'package:serendy/features/media/domain/media.dart';

final class CollectionRepositoryRemote extends CollectionRepository {
  final List<Collection?> _collections = collectionsMock;

  @override
  Future<List<Collection?>> fetchCollectionList() async {
    return _collections;
  }

  @override
  Stream<List<Collection?>> watchCollectionList() async* {
    yield _collections;
  }

  @override
  Future<Collection> fetchCollection(String id) async {
    const getThemeQuery = r'''
    query {
      GetTheme(themeId: "01GYYXS8Z0VSRKYSC6EXYT1A64") {
        owner {
          id
          name
        }
        items {
          id
          title
          image
          addedAt
        }
        id
        title
        image
        private
        total
      }
    }
    ''';

    final options = QueryOptions(document: gql(getThemeQuery));
    final result = await client.query(options);

    if (result.hasException) {
      throw Exception(
          result.exception?.graphqlErrors[0].message ?? "서버에 문제가 발생했어요.");
    }

    final data = result.data?['GetTheme'];

    return Collection(
      owner: CollectionOwner(
        id: data['owner']['id'],
        name: data['owner']['name'],
      ),
      id: data['id'],
      title: data['title'],
      image: data['image'],
      private: data['private'],
      itemCount: data['total'],
      items: (data['items'] as List)
          .map((item) => CollectionItem(
                media: Media(
                  id: item['id'],
                  title: item['title'],
                  image: item['image'],
                  keywords: const ['코미디'],
                  type: MediaType.anime,
                  status: MediaStatus.finished,
                ),
                addedAt: DateTime.parse(item['addedAt']),
              ))
          .toList(),
    );
  }

  @override
  Stream<Collection?> watchCollection(String id) {
    return watchCollectionList().map((collections) => collections[0]);
  }

  @override
  Future<void> createCollection(Collection collection) async {
    _collections.add(collection);
  }

  @override
  Future<void> updateCollection(Collection collection) async {
    final index = _collections.indexWhere((e) => e?.id == collection.id);
    if (index == -1) return;

    _collections[index] = collection;
  }

  @override
  Future<void> removeCollection(Collection collection) async {
    _collections.removeWhere((e) => e?.id == collection.id);
  }
}
