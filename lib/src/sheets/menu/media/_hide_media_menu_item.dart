import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/widgets/widgets.dart';

class HideMediaMenuItem extends ConsumerWidget {
  const HideMediaMenuItem({required this.media});
  final Media media;

  Future<void> handleTap(BuildContext context, WidgetRef ref) async {
    try {
      // * TODO 관심없는 미디어에 추가해요.

      // * 위젯이 폐기된 경우 작업을 끝내요.
      if (!context.mounted) return;

      // * 숨기기 취소 로직
      void cancelAction() {}

      // * success
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        action: SnackBarAction(onPressed: cancelAction, label: "취소"),
        content: const Text('앞으로 이 작품은 보이지 않습니다.'),
      ));

      // * failure
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(err.toString()),
      ));

      // * 메뉴를 닫아요.
    } finally {
      context.pop();
    }
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
