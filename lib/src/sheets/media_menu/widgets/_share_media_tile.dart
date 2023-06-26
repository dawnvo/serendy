part of '../media_menu_sheet.dart';

class _ShareMediaTile extends ConsumerWidget {
  const _ShareMediaTile(this.provider);
  final MediaMenuControllerProvider provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _MediaMenuListTile(
      onTap: () => ref.read(provider.notifier).onShareMediaTapped(context),
      icon: const Icon(RemixIcon.share_fill),
      title: "공유하기",
    );
  }
}
