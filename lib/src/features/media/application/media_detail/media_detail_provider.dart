import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/features/evaluation/data/evaluation_repository.dart';
import 'package:serendy/src/features/media/data/media_repository.dart';
import 'media_detail_state.dart';

part 'media_detail_provider.g.dart';

@riverpod
class MediaDetail extends _$MediaDetail {
  @override
  FutureOr<MediaDetailState> build() async {
    return fetchMediaDetail('test');
  }

  Future<MediaDetailState> fetchMediaDetail(String id) async {
    final mediaRepository = ref.read(mediaRepositoryProvider);
    final evaluationRepository = ref.read(evaluationRepositoryProvider);
    state = const AsyncValue.loading();

    try {
      final mediaDetailState = MediaDetailState(
        media: await mediaRepository.fetchMedia(id),
        reactions: await evaluationRepository.fetchEvaluationList(),
      );

      state = AsyncValue.data(mediaDetailState);
      return mediaDetailState;
    } catch (err, stack) {
      state = AsyncValue.error(err, stack);
      throw Exception(err.toString());
    }
  }

  void fetchReactions() {}
}
