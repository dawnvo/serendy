import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';

typedef SearchMediasPayload = ({
  String query,
  int? pageKey,
});

final class SearchMediasUsecase implements UseCase<SearchMediasPayload, List<Media?>> {
  const SearchMediasUsecase(this._mediaRepository);
  final MediaRepository _mediaRepository;

  @override
  Future<List<Media?>> execute(SearchMediasPayload payload) async {
    final medias = await _mediaRepository.searchMedias(
      query: payload.query,
      pageKey: payload.pageKey,
    );
    return medias;
  }
}
