import 'package:serendy/core/domain/usecase.dart';
import 'package:serendy/features/media/domain/ports/persistence/media_repository_port.dart';
import 'package:serendy/features/media/domain/ports/get_media_list_port.dart';
import 'package:serendy/features/media/media.dart';

final class GetMediaListUsecase
    implements UseCase<GetMediaListPort, List<Media?>> {
  const GetMediaListUsecase(this._mediaRepository);

  final MediaRepositoryPort _mediaRepository;

  @override
  Future<List<Media?>> execute(GetMediaListPort payload) async {
    final medias = await _mediaRepository.search(MediaSearchQuery(
      title: payload.title,
    ));

    return medias;
  }
}
