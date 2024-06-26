import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';

typedef GetMediasPayload = ({
  int? page,
});

final class GetMediasUsecase implements UseCase<GetMediasPayload, List<Media?>> {
  const GetMediasUsecase(this._mediaRepository);
  final MediaRepository _mediaRepository;

  @override
  Future<List<Media?>> execute(GetMediasPayload payload) async {
    final medias = await _mediaRepository.fetchMedias(
      page: payload.page,
      perPage: 20,
    );
    return medias;
  }
}
