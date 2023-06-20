import 'package:serendy/core/domain/assert.dart';
import 'package:serendy/core/domain/usecase.dart';
import 'package:serendy/core/exceptions/core_exception.dart';
import 'package:serendy/features/media/media.dart';
import 'package:serendy/features/media/domain/ports/persistence/media_repository_port.dart';
import 'package:serendy/features/media/domain/ports/get_media_port.dart';

final class GetMediaUsecase implements UseCase<GetMediaPort, Media> {
  const GetMediaUsecase(this._mediaRepository);

  final MediaRepositoryPort _mediaRepository;

  @override
  Future<Media> execute(GetMediaPort payload) async {
    final media = CoreAssert.notEmpty<Media>(
      await _mediaRepository.getMedia(payload.mediaId),
      const EntityNotFoundException(overrideMessage: "미디어를 찾을 수 없어요."),
    );

    return media;
  }
}
