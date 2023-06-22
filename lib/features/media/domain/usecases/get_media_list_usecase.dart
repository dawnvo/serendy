import 'package:serendy/core/domain/usecase.dart';
import 'package:serendy/features/media/media.dart';

typedef GetMediaListPort = ({
  String? title,
});

final class GetMediaListUsecase
    implements UseCase<GetMediaListPort, List<Media?>> {
  const GetMediaListUsecase(this._mediaRepository);
  final MediaRepository _mediaRepository;

  @override
  Future<List<Media?>> execute(GetMediaListPort payload) async {
    final medias = await _mediaRepository.search(payload.title);
    return medias;
  }
}
