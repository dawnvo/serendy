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
  Future<List<Media?>> fetchMediasList({String? title}) async {
    final result = await guard(
      () => _client.query$GetMediaList(Options$Query$GetMediaList(
        variables: Variables$Query$GetMediaList(title: title),
      )),
    );

    final datas = result.parsedData!.GetMediaList;
    return MediaMapper.toDomains(datas);
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

  @override
  Future<void> addMedia({required Media media}) async {
    await guard(
      () => _client.mutate$AddMedia(Options$Mutation$AddMedia(
        variables: Variables$Mutation$AddMedia(
          type: Enum$MediaType.values.byName(media.type.name),
          status: Enum$MediaStatus.values.byName(media.status.name),
          title: media.title,
          image: media.image,
          genres: media.keywords,
          isAdult: media.isAdult,
          startDate: media.startDate,
          endDate: media.endDate,
        ),
      )),
    );
  }
}
