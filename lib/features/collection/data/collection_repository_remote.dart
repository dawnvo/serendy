import 'package:graphql/client.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/features/collection/data/collection_mapper.dart';
import 'package:serendy/features/collection/data/collection_repository.dart';
import 'package:serendy/features/collection/domain/collection.dart';

final class CollectionRepositoryRemote extends CollectionRepository {
  CollectionRepositoryRemote(this._client);
  final GraphQLClient _client;

  @override
  Future<List<Collection?>> fetchCollectionsList([String? ownerId]) async {
    final results = await _client.query$GetThemeList(Options$Query$GetThemeList(
      variables: Variables$Query$GetThemeList(ownerId: ownerId),
    ));

    if (results.hasException) {
      final message = results.exception!.graphqlErrors.first.message;
      throw GraphQLError(message: message);
    }

    final datas = results.parsedData!.GetThemeList;
    return CollectionMapper.toDomains(datas);
  }

  @override
  Stream<List<Collection?>> watchCollectionsList() async* {}

  @override
  Future<Collection> fetchCollection(String collectionId) async {
    final result = await _client.query$GetTheme(Options$Query$GetTheme(
      variables: Variables$Query$GetTheme(themeId: collectionId),
    ));

    if (result.hasException) {
      final message = result.exception!.graphqlErrors.first.message;
      throw GraphQLError(message: message);
    }

    final data = result.parsedData!.GetTheme;
    return CollectionMapper.toDomain(data);
  }

  @override
  Stream<Collection?> watchCollection(String collectionId) {
    return watchCollectionsList().map((collections) => collections[0]);
  }

  @override
  Future<Collection> createCollection(String title) async {
    final result =
        await _client.mutate$CreateTheme(Options$Mutation$CreateTheme(
      variables: Variables$Mutation$CreateTheme(title: title),
    ));

    if (result.hasException) {
      final message = result.exception!.graphqlErrors.first.message;
      throw GraphQLError(message: message);
    }

    final data = result.parsedData!.CreateTheme;
    return CollectionMapper.toDomain(data);
  }

  @override
  Future<void> updateCollection(Collection collection) async {}

  @override
  Future<void> removeCollection(Collection collection) async {}
}
