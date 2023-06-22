import 'package:serendy/core/domain/assert.dart';
import 'package:serendy/core/domain/usecase.dart';
import 'package:serendy/core/exceptions/core_exception.dart';
import 'package:serendy/features/media/media.dart';

typedef GetMediaPort = ({
  String mediaId,
});

final class GetMediaUsecase implements UseCase<GetMediaPort, Media> {
  const GetMediaUsecase(this._mediaRepository);
  final MediaRepository _mediaRepository;

  @override
  Future<Media> execute(GetMediaPort payload) async {
    final media = CoreAssert.notEmpty<Media>(
      await _mediaRepository.findOne(payload.mediaId),
      const EntityNotFoundException(overrideMessage: "미디어를 찾을 수 없어요."),
    );

    return media;
  }
}
