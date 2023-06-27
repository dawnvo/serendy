part of '../edit_collection_screen.dart';

class _EditCollectionPrivacyStatusTile extends ConsumerWidget {
  const _EditCollectionPrivacyStatusTile(this.provider);
  final EditCollectionControllerProvider provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final privacyStatus = ref.watch(provider.select((state) => state.private));
    final debouncer = ref.watch(debouncerProvider);

    return SwitchListTile(
      onChanged: (status) => debouncer.run(() {
        ref.read(provider.notifier).changePrivacyStatus(status);
      }),
      value: privacyStatus,
      title: const Text("나만 보기"),
    );
  }
}
