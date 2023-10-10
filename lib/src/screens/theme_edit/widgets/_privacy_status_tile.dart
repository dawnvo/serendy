part of '../theme_edit_screen.dart';

class _EditThemePrivacyStatusTile extends ConsumerWidget {
  const _EditThemePrivacyStatusTile(this.provider);
  final EditThemeControllerProvider provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final privacyStatus = ref.watch(provider.select(
      (state) => state.private,
    ));

    return SwitchListTile(
      onChanged: (status) => ref //
          .read(provider.notifier)
          .changePrivacyStatus(status),
      value: privacyStatus,
      title: const Text("나만 보기"),
    );
  }
}
