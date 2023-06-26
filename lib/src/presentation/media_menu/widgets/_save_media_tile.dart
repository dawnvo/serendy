part of '../media_menu_sheet.dart';

class _SaveMediaTile extends ConsumerWidget {
  const _SaveMediaTile(this.provider);
  final MediaMenuControllerProvider provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _MediaMenuListTile(
      onTap: () => ref.read(provider.notifier).onSaveMediaTapped(context),
      icon: const Icon(RemixIcon.add_box_fill),
      title: "테마에 추가하기",
    );
  }
}
