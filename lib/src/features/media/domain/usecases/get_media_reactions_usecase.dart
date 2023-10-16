import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';

typedef GetMediaReactionsPayload = ({
  MediaID mediaId,
});

final class GetMediaReactionsUsecase
    implements UseCase<GetMediaReactionsPayload, List<MediaReaction?>> {
  const GetMediaReactionsUsecase(this._mediaRepository);
  final MediaRepository _mediaRepository;

  @override
  Future<List<MediaReaction?>> execute(GetMediaReactionsPayload payload) async {
    final mediaReactions = await _mediaRepository.fetchReactions(id: payload.mediaId);
    // * count 많은 순으로 정렬해요.
    mediaReactions.sort((b, a) => a!.count.compareTo(b!.count));
    return mediaReactions;
  }
}
