import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/models/models.dart';
import 'package:serendy/src/providers/providers.dart';
import 'media_reaction_state.dart';

part 'media_reaction_provider.g.dart';

@riverpod
class MediaReaction extends _$MediaReaction {
  @override
  FutureOr<MediaReactionState> build() async {
    return _fetchMyReaction();
  }

  Future<MediaReactionState> _fetchMyReaction() async {
    Evaluation? findMyReaction(List<Evaluation?> reactions, String userId) {
      return reactions.firstWhere((_) => _?.userId == userId);
    }

    final myReaction = await ref.watch(mediaDetailProvider.selectAsync(
      (_) => findMyReaction(_.reactions, 'test'),
    ));

    try {
      final mediaReactionState = MediaReactionState(
        reaction: myReaction,
      );

      state = AsyncValue.data(mediaReactionState);
      return mediaReactionState;
    } catch (err, stack) {
      state = AsyncValue.error(err, stack);
      throw Exception(err.toString());
    }
  }

  Future<void> changeEmotion(Emotion? emotion) async {
    state = state.whenData(
      (state) => MediaReactionState(
        reaction: state.reaction?.copyWith(emotion: emotion),
      ),
    );
  }
}
