import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/screens/media_evaluate/controller/evaluate_media_controller.dart';
import 'package:serendy/src/widgets/widgets.dart';

class EvaluateMediaTile extends ConsumerWidget {
  const EvaluateMediaTile({required this.media, super.key});

  final Media media;

  void handleTap(BuildContext context) {
    context.pop();
    context.pushNamed(
      AppRoutes.evaluateMedia,
      extra: media,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final evaluation = ref.watch(evaluateMediaControllerProvider(media.id)
        .select((state) => state.evaluation));

    // 평가한 감정이 존재하면 감정을 표시해요.
    if (evaluation != null) {
      return MenuListTile(
        onTap: () => handleTap(context),
        icon: SvgPicture.asset(
          evaluation.emotion.filePath,
          height: Sizes.p24,
        ),
        title: evaluation.emotion.label,
      );
    }
    // 평가한 감정이 없으면 아이콘을 표시해요.
    else {
      return MenuListTile(
        onTap: () => handleTap(context),
        icon: const Icon(RemixIcon.emotion_fill),
        title: "평가하기",
      );
    }
  }
}
