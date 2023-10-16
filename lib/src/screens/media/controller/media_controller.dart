import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';

part 'media_controller.g.dart';
part 'media_state.dart';

@riverpod
class MediaController extends _$MediaController {
  @override
  FutureOr<MediaState> build(MediaID id, [Media? media]) async {
    // * 이미 작품을 불러온 경우 재사용해요.
    // * 특수 경로로 유입한 경우 새로 불러와요.
    media ??= await ref.watch(getMediaProvider(id: id).future);

    // * 작품 반응을 불러와요.
    final reactions = await ref.watch(getMediaReactionsProvider(id: id).future);

    // * loaded
    return MediaState(
      media: media!,
      reactions: reactions,
    );
  }

  /// [EVENT] 반응 목록을 갱신해요.
  Future<void> onMediaReactionsUpdated() async {
    // * 컨트롤러가 폐기된 경우 작업을 끝내요.
    if (!state.hasValue) return;
    // * 관련 공급자를 새로고침(초기화)해요.
    ref.invalidate(getMediaReactionsProvider(id: id));
  }
}
