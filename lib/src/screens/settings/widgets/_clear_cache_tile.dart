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
        // * success -- 메시지 표시를 지연해 안정감을 주어요.
        await Future.delayed(const Duration(milliseconds: 600), () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            duration: kSnackBarDisplayDurationShort,
            content: Text("이미지 캐시를 정리했어요."),
          ));
        });
      },
      icon: RemixIcon.delete_bin_7_line,
      title: "이미지 캐시 정리",
      subtitle: "불필요한 이미지 데이터를 정리해요.",
    );
  }
}
