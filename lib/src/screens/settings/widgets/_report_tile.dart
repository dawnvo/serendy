part of '../settings_screen.dart';

class _ReportProblemTile extends StatelessWidget {
  const _ReportProblemTile();

  @override
  Widget build(BuildContext context) {
    return _SettingsListTile(
      onTap: () {},
      icon: RemixIcon.error_warning_line,
      title: "문제 신고",
    );
  }
}

class _RequestUpdateTile extends StatelessWidget {
  const _RequestUpdateTile();

  @override
  Widget build(BuildContext context) {
    return _SettingsListTile(
      onTap: () {},
      icon: RemixIcon.upload_cloud_line,
      title: "DB 수정/추가",
      subtitle: "잘못된 정보나 빠뜨린 작품을 문의해요.",
    );
  }
}
