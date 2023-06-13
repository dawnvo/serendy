import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/models/models.dart';
import 'package:serendy/src/repositories/repositories.dart';
import 'media_detail_state.dart';

part 'media_detail_provider.g.dart';

@riverpod
class MediaDetail extends _$MediaDetail {
  @override
  FutureOr<Media?> build() {
    return fetchMedia('test');
  }

  Future<Media?> fetchMedia(String id) async {
    final mediasRepository = ref.read(mediasRepositoryProvider);
    state = const AsyncValue.loading();

    try {
      final media = await mediasRepository.fetchMedia(id);

      state = AsyncValue.data(media);
      return media;
    } catch (err, stack) {
      state = AsyncValue.error(err, stack);
      return null;
    }
  }

  void fetchReactions() {}
}
