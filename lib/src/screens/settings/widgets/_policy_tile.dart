part of '../settings_screen.dart';

class _PrivacyPolicyTile extends ConsumerWidget {
  const _PrivacyPolicyTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsState = ref.watch(settingsControllerProvider);

    return _SettingsListTile(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => WebView(url: settingsState.privacyPolicyUrl),
      )),
      icon: RemixIcon.file_list_line,
      title: "개인정보 처리방침",
    );
  }
}

class _TermsOfServiceTile extends ConsumerWidget {
  const _TermsOfServiceTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsState = ref.watch(settingsControllerProvider);

    return _SettingsListTile(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => WebView(url: settingsState.termsOfServiceUrl),
      )),
      icon: RemixIcon.file_copy_2_line,
      title: "서비스 약관",
    );
  }
}
