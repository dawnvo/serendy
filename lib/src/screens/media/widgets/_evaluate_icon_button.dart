part of '../media_screen.dart';

class _MediaEvaluateIconButton extends ConsumerWidget {
  const _MediaEvaluateIconButton({required this.media});

  final Media media;

  void handlePressed(BuildContext context) {
    context.pushNamed(
      AppRoutes.evaluateMedia,
      pathParameters: {'id': media.id},
      extra: media,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final evaluation = ref.watch(evaluateMediaControllerProvider(media.id) //
        .select((state) => state.evaluation));

    return GestureDetector(
      onTap: () => handlePressed(context),
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.all(kContentPadding),
        child: Row(children: [
          __EmotionLabel(evaluation?.emotion),
          Gap.w8,
          __EmotionIcon(evaluation?.emotion),
        ]),
      ),
    );
  }
}

///Emotion icon
class __EmotionIcon extends StatelessWidget {
  const __EmotionIcon(this.emotion);

  final Emotion? emotion;

  @override
  Widget build(BuildContext context) {
    if (emotion != null) {
      return SvgPicture.asset(
        emotion!.filePath,
        height: Sizes.p28,
      );
    } else {
      return Icon(
        RemixIcon.emotion_fill,
        size: Sizes.p28,
        color: context.colorScheme.onSurfaceVariant,
      );
    }
  }
}

///Emotion label
class __EmotionLabel extends StatelessWidget {
  const __EmotionLabel(this.emotion);

  final Emotion? emotion;

  @override
  Widget build(BuildContext context) {
    final color = emotion?.color ?? context.colorScheme.outline;
    final label = emotion?.label ?? '평가하기';

    return Chip(
      shape: const StadiumBorder(),
      side: BorderSide(color: color),
      visualDensity: VisualDensity.compact,
      labelPadding: EdgeInsets.zero,
      labelStyle: context.textTheme.labelMedium?.copyWith(color: color),
      label: Text(label),
    );
  }
}
