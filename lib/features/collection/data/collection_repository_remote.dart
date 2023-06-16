import 'package:graphql/client.dart';
import 'package:serendy/_mock.dart';
import 'package:serendy/bootstrap.dart';
import 'package:serendy/features/collection/data/collection_mapper.dart';
import 'package:serendy/features/collection/data/collection_repository.dart';
import 'package:serendy/features/collection/domain/collection.dart';

import '__generated__/theme.gql.dart';

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
  Future<Collection> fetchCollection(String collectionId) async {
    final result = await client.query$GetTheme(Options$Query$GetTheme(
      variables: Variables$Query$GetTheme(themeId: collectionId),
    ));

    if (result.hasException) {
      logger.w(result.exception);
      final message = result.exception!.graphqlErrors.first.message;
      throw GraphQLError(message: message);
    }

    final data = result.parsedData!.GetTheme;
    return CollectionMapper.toDomain(data);
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
