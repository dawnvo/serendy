import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/widgets/widgets.dart';

class HideMediaMenuItem extends ConsumerWidget {
  const HideMediaMenuItem({required this.media, super.key});

  final Media media;

  Future<void> handleTap(BuildContext context) async {
    try {
      // * 숨기기 로직

      // * 위젯이 폐기되지 않은 경우에만 실행을 계속해요.
      if (!context.mounted) return;

      // * 숨기기 취소 로직
      void cancelAction() {}

      // * 숨기기에 성공하면 메뉴를 닫고 메시지로 안내해요.
      context.pop();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        action: SnackBarAction(onPressed: cancelAction, label: "취소"),
        content: const Text('앞으로 이 작품은 보이지 않습니다.'),
      ));
    } catch (err) {
      // * 숨기기에 실패하면 메시지로 안내해요.
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(err.toString()),
      ));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MenuListTile(
      onTap: () => handleTap(context),
      icon: const Icon(RemixIcon.indeterminate_circle_fill),
      title: "이 작품 숨기기",
    );
  }
}
