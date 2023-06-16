import 'package:graphql/client.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/core/core.dart';
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
  Future<void> createCollection(String title) async {
    final result =
        await _client.mutate$CreateTheme(Options$Mutation$CreateTheme(
      variables: Variables$Mutation$CreateTheme(title: title),
    ));

    if (result.hasException) {
      final message = result.exception!.graphqlErrors.first.message;
      throw GraphQLError(message: message);
    }
  }

  @override
  Future<void> editCollection({
    required String collectionId,
    String? title,
    String? image,
    bool? private,
    String? description,
  }) async {
    final result = await _client.mutate$EditTheme(Options$Mutation$EditTheme(
      variables: Variables$Mutation$EditTheme(
        themeId: collectionId,
        title: title,
        image: image,
        private: private,
      ),
    ));

    if (result.hasException) {
      logger.w(result.exception);
      final message = result.exception!.graphqlErrors.first.message;
      throw GraphQLError(message: message);
    }
  }

  @override
  Future<void> removeCollection(Collection collection) async {}
}
