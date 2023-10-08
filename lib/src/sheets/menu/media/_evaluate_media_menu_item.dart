import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/screens/media_evaluate/controller/evaluate_media_controller.dart';
import 'package:serendy/src/widgets/widgets.dart';

class EvaluateMediaMenuItem extends ConsumerWidget {
  const EvaluateMediaMenuItem({required this.media});
  final Media media;

  void handleTap(BuildContext context, WidgetRef ref) {
    // * 메뉴를 닫아요.
    context.pop();
    // * 평가 화면으로 이동해요.
    context.pushNamed(
      AppRoutes.evaluateMedia,
      extra: media,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final evaluation = ref.watch(
      evaluateMediaControllerProvider(media.id).select((_) => _.evaluation),
    );

    // * 평가가 존재하면 표시해요.
    if (evaluation != null) {
      return MenuListTile(
        onTap: () => handleTap(context, ref),
        icon: SvgPicture.asset(
          evaluation.emotion.filePath,
          height: Sizes.p24,
        ),
        title: evaluation.emotion.label,
      );
    }
    // * 없으면 아이콘을 표시해요.
    else {
      return MenuListTile(
        onTap: () => handleTap(context, ref),
        icon: const Icon(RemixIcon.emotion_fill),
        title: "평가하기",
      );
    }
  }
}
