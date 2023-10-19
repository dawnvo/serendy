part of '../settings_screen.dart';

class _PrivacyPolicyTile extends StatelessWidget {
  const _PrivacyPolicyTile();

  @override
  Widget build(BuildContext context) {
    return _SettingsListTile(
      onTap: () {},
      icon: RemixIcon.file_list_line,
      title: "개인정보 처리방침",
    );
  }
}

class _TermsOfServiceTile extends StatelessWidget {
  const _TermsOfServiceTile();

  @override
  Widget build(BuildContext context) {
    return _SettingsListTile(
      onTap: () {},
      icon: RemixIcon.file_copy_2_line,
      title: "서비스 약관",
    );
  }
}
