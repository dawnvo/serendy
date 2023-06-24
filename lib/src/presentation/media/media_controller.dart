import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/media.dart';

part 'media_controller.g.dart';

class _MediaState extends Equatable {
  const _MediaState({
    required this.media,
    required this.reactions,
  });

  final Media media;
  final List<Evaluation?> reactions;

  @override
  List<Object?> get props => [
        media,
        reactions,
      ];
}

@riverpod
class MediaController extends _$MediaController {
  @override
  FutureOr<_MediaState> build(MediaID id) async {
    final media = await ref.watch(fetchMediaProvider(id: id).future);
    final reactions =
        await ref.watch(fetchReactionsListProvider(mediaId: id).future);

    return _MediaState(
      media: media,
      reactions: reactions,
    );
  }
}
