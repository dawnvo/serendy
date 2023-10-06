import 'package:serendy/src/core/domain/usecase.dart';
import 'package:serendy/src/features/media/media.dart';

typedef SearchMediaPayload = ({
  String title,
});

final class SearchMediaUsecase implements UseCase<SearchMediaPayload, List<Media?>> {
  const SearchMediaUsecase(this._mediaRepository);
  final MediaRepository _mediaRepository;

  @override
  Future<List<Media?>> execute(SearchMediaPayload payload) async {
    final medias = await _mediaRepository.searchMedias(query: payload.title);
    return medias;
  }
}
