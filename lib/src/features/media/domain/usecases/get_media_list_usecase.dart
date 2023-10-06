import 'package:serendy/src/core/domain/usecase.dart';
import 'package:serendy/src/features/media/media.dart';

typedef GetMediaListPayload = ();

final class GetMediaListUsecase implements UseCase<GetMediaListPayload, List<Media?>> {
  const GetMediaListUsecase(this._mediaRepository);
  final MediaRepository _mediaRepository;

  @override
  Future<List<Media?>> execute(GetMediaListPayload payload) async {
    final medias = await _mediaRepository.fetchMediasList();
    return medias;
  }
}
