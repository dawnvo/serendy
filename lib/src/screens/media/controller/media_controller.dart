import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/media.dart';

part 'media_controller.g.dart';
part 'media_state.dart';

@riverpod
class MediaController extends _$MediaController {
  @override
  FutureOr<MediaState> build(MediaID id) async {
    final media = await ref.watch(fetchMediaProvider(id: id).future);
    final reactions =
        await ref.watch(fetchReactionsListProvider(mediaId: id).future);

    return MediaState(
      media: media,
      reactions: reactions,
    );
  }
}
