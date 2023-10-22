part of '../settings_screen.dart';

class _ReportProblemTile extends ConsumerWidget {
  const _ReportProblemTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsState = ref.watch(settingsControllerProvider);

    return _SettingsListTile(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => WebView(url: settingsState.reportProblemUrl),
      )),
      icon: RemixIcon.error_warning_line,
      title: "문제 신고",
    );
  }
}

class _RequestUpdateTile extends ConsumerWidget {
  const _RequestUpdateTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsState = ref.watch(settingsControllerProvider);

    return _SettingsListTile(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => WebView(url: settingsState.requestUpdateUrl),
      )),
      icon: RemixIcon.upload_cloud_line,
      title: "DB 수정/추가",
      subtitle: "잘못된 정보나 빠뜨린 작품을 문의해요.",
    );
  }
}
