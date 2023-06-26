part of '../media_menu_sheet.dart';

class _HideMediaTile extends ConsumerWidget {
  const _HideMediaTile(this.provider);
  final MediaMenuControllerProvider provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _MediaMenuListTile(
      onTap: () => ref.read(provider.notifier).onHideMediaTapped(context),
      icon: const Icon(RemixIcon.indeterminate_circle_fill),
      title: "이 작품 숨기기",
    );
  }
}
