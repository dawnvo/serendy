part of '../settings_screen.dart';

class _ClearCacheTile extends ConsumerWidget {
  const _ClearCacheTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _SettingsListTile(
      onTap: () async {
        final manager = DefaultCacheManager();
        await manager.emptyCache();

        if (!context.mounted) return;

        // * success
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: kSnackBarDisplayDurationShort,
          content: Text("이미지 캐시를 정리했어요."),
        ));
      },
      icon: RemixIcon.delete_bin_7_line,
      title: "이미지 캐시 정리",
      subtitle: "불필요한 이미지 데이터를 정리해요.",
    );
  }
}
