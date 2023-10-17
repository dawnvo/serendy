import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';

typedef GetMediaPayload = ({
  MediaID mediaId,
});

final class GetMediaUsecase implements UseCase<GetMediaPayload, Media> {
  const GetMediaUsecase(this._mediaRepository);
  final MediaRepository _mediaRepository;

  @override
  Future<Media> execute(GetMediaPayload payload) async {
    // * 작품을 불러와요.
    final media = CoreAssert.notEmpty<Media>(
      await _mediaRepository.fetchMedia(id: payload.mediaId),
      const EntityNotFoundException(overrideMessage: "작품을 찾을 수 없어요."),
    );

    // TODO: 중복 조회 방지하기. (ip/cookie/session)

    // * 작품 조회수를 올려요.
    await _mediaRepository.incrementHits(media);

    return media;
  }
}
