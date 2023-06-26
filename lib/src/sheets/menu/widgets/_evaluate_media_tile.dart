import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/remixicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/screens/media_evaluate/controller/evaluate_media_controller.dart';
import 'package:serendy/src/widgets/widgets.dart';

class EvaluateMediaTile extends ConsumerWidget {
  const EvaluateMediaTile({required this.media, super.key});

  final Media media;

  void handleTap(BuildContext context) {
    context.pushNamed(
      AppRoutes.evaluateMediaName,
      extra: media,
    );
    context.pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final evaluation = ref.watch(evaluateMediaControllerProvider(media.id)
        .select((state) => state.evaluation));

    return MenuListTile(
      onTap: () => handleTap(context),
      icon: switch (evaluation) {
        // 평가한 감정을 표시해요.
        Evaluation() => SvgPicture.asset(
            evaluation.emotion.filePath,
            height: Sizes.p24,
          ),
        // 평가한 감정이 없으면 아이콘을 표시해요.
        null => const Icon(RemixIcon.emotion_fill),
      },
      title: "감상했어요",
    );
  }
}
