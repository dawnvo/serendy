import 'package:graphql/client.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/configs/mixin/graphql_error_handler_mixin.dart';
import 'package:serendy/features/collection/data/collection_repository.dart';
import 'package:serendy/features/collection/data/mapper/collection_mapper.dart';
import 'package:serendy/features/collection/domain/collection.dart';

final class CollectionRepositoryRemote extends CollectionRepository
    with GraphqlErrorHandlerMixin {
  CollectionRepositoryRemote(this._client);
  final GraphQLClient _client;

  @override
  Future<List<Collection?>> fetchCollectionsList({String? ownerId}) async {
    final result = await guard(
      () => _client.query$GetThemeList(Options$Query$GetThemeList(
        variables: Variables$Query$GetThemeList(ownerId: ownerId),
      )),
    );

    final datas = result.parsedData!.GetThemeList;
    return CollectionMapper.toDomains(datas);
  }

  @override
  Future<Collection> fetchCollection({required String collectionId}) async {
    final result = await guard(
      () => _client.query$GetTheme(Options$Query$GetTheme(
        variables: Variables$Query$GetTheme(themeId: collectionId),
      )),
    );

    final data = result.parsedData!.GetTheme;
    return CollectionMapper.toDomain(data);
  }

  @override
  Future<void> createCollection({required String title}) async {
    await guard(
      () => _client.mutate$CreateTheme(Options$Mutation$CreateTheme(
        variables: Variables$Mutation$CreateTheme(title: title),
      )),
    );
  }

  @override
  Future<void> editCollection({
    required String collectionId,
    String? title,
    String? description,
    String? image,
    bool? private,
  }) async {
    await guard(
      () => _client.mutate$EditTheme(Options$Mutation$EditTheme(
        variables: Variables$Mutation$EditTheme(
          themeId: collectionId,
          title: title,
          image: image,
          private: private,
        ),
      )),
    );
  }

  @override
  Future<void> removeCollection({required String collectionId}) async {
    await guard(
      () => _client.mutate$RemoveTheme(Options$Mutation$RemoveTheme(
        variables: Variables$Mutation$RemoveTheme(themeId: collectionId),
      )),
    );
  }
}
