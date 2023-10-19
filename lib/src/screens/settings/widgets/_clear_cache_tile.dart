part of '../settings_screen.dart';

class _ClearCacheTile extends StatelessWidget {
  const _ClearCacheTile();

  @override
  Widget build(BuildContext context) {
    return _SettingsListTile(
      onTap: () async {
        // * 캐시를 정리해요.
        final manager = DefaultCacheManager();
        await manager.emptyCache();
        // * 위젯이 폐기된 경우 작업을 끝내요.
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
