import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/screens/profile/controller/profile_controller.dart';
import 'package:serendy/src/widgets/widgets.dart';

class DeleteEvaluationMenuItem extends ConsumerWidget {
  const DeleteEvaluationMenuItem({required this.media});
  final Media media;

  Future<void> handleTap(BuildContext context, WidgetRef ref) async {
    try {
      // * 해당 평가를 삭제해요.
      await ref.read(removeEvaluationProvider(mediaId: media.id).future);

      // * 삭제에 성공하면 평가 개수를 갱신해요.
      ref.read(profileControllerProvider.notifier).evaluationsCountUpdated();

      // * 위젯이 폐기되지 않은 경우에만 실행을 계속해요.
      if (!context.mounted) return;

      // * 삭제에 성공하면 메뉴를 닫아요.
      context.pop();
    } catch (err) {
      // * 삭제에 실패하면 메시지로 안내해요.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(err.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MenuListTile(
      onTap: () => handleTap(context, ref),
      icon: const Icon(RemixIcon.indeterminate_circle_fill),
      title: "감상한 작품에서 삭제하기",
    );
  }
}
