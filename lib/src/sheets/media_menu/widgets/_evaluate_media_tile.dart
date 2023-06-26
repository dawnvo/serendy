part of '../media_menu_sheet.dart';

class _EvaluateMediaTile extends ConsumerWidget {
  const _EvaluateMediaTile(this.provider);
  final MediaMenuControllerProvider provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _MediaMenuListTile(
      onTap: () => ref.read(provider.notifier).onEvaluateMediaTapped(context),
      icon: const Icon(RemixIcon.emotion_fill),
      title: "감상했어요",
    );
  }
}
