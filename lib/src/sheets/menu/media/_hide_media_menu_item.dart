import 'dart:async';

import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/dislike/dislike.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/widgets/widgets.dart';

/// [addDislike] 호출을 30초 연기해요.
/// 실수로 누른 경우 실행을 취소할 수 있어요.
final delayedDislikeProvider = //
    Provider.autoDispose.family<Timer, MediaID>((ref, mediaId) {
  final timer = Timer(
    const Duration(seconds: 30),
    () => ref.read(addDislikeProvider(mediaId: mediaId)),
  );
  ref.onDispose(timer.cancel);
  return timer;
});

class HideMediaMenuItem extends ConsumerWidget {
  const HideMediaMenuItem({required this.media});
  final Media media;

  void handleTap(BuildContext context, WidgetRef ref) {
    // * 관심없는 목록에 추가해요.
    final delayedDislike = ref.read(delayedDislikeProvider(media.id));

    // * 위젯이 폐기된 경우 작업을 끝내요.
    if (!context.mounted) return;

    // * 메뉴를 닫아요.
    context.pop();

    // * 숨기기 취소 액션
    void cancelAction() => delayedDislike.cancel();

    // * 메시지로 안내해요.
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      action: SnackBarAction(onPressed: cancelAction, label: "취소"),
      content: const Text('앞으로 이 작품은 보이지 않습니다.'),
    ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MenuListTile(
      onTap: () => handleTap(context, ref),
      icon: const Icon(RemixIcon.indeterminate_circle_fill),
      title: "이 작품 숨기기",
    );
  }
}
