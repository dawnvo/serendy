import 'package:serendy/core/domain/usecase.dart';
import 'package:serendy/features/media/media.dart';

typedef SearchMediaPort = ({
  String? title,
});

final class SearchMediaUsecase
    implements UseCase<SearchMediaPort, List<Media?>> {
  const SearchMediaUsecase(this._mediaRepository);
  final MediaRepository _mediaRepository;

  @override
  Future<List<Media?>> execute(SearchMediaPort payload) async {
    final medias = await _mediaRepository.findMany(payload.title);
    return medias;
  }
}
