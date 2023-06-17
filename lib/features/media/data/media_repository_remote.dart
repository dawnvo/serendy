import 'package:graphql/client.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/configs/mixin/graphql_error_handler_mixin.dart';
import 'package:serendy/features/media/data/mapper/media_mapper.dart';
import 'package:serendy/features/media/data/media_repository.dart';
import 'package:serendy/features/media/domain/media.dart';

final class MediaRepositoryRemote extends MediaRepository
    with GraphqlErrorHandlerMixin {
  MediaRepositoryRemote(this._client);
  final GraphQLClient _client;

  @override
  Future<List<Media?>> fetchMediasList() async {
    throw UnimplementedError();
  }

  @override
  Future<Media> fetchMedia({required String mediaId}) async {
    final result = await guard(
      () => _client.query$GetMedia(Options$Query$GetMedia(
        variables: Variables$Query$GetMedia(mediaId: mediaId),
      )),
    );

    final data = result.parsedData!.GetMedia;
    return MediaMapper.toDomain(data);
  }
}
