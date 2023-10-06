import 'package:serendy/src/core/domain/assert.dart';
import 'package:serendy/src/core/domain/usecase.dart';
import 'package:serendy/src/core/exceptions/core_exception.dart';
import 'package:serendy/src/features/media/media.dart';

typedef GetMediaPayload = ({
  MediaID mediaId,
});

final class GetMediaUsecase implements UseCase<GetMediaPayload, Media> {
  const GetMediaUsecase(this._mediaRepository);
  final MediaRepository _mediaRepository;

  @override
  Future<Media> execute(GetMediaPayload payload) async {
    final media = CoreAssert.notEmpty<Media>(
      await _mediaRepository.fetchMedia(id: payload.mediaId),
      const EntityNotFoundException(overrideMessage: "작품을 찾을 수 없어요."),
    );

    return media;
  }
}
