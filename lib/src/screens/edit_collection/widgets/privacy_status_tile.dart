part of '../edit_collection_screen.dart';

final privacyStatusProvider = StateProvider((ref) => true);

class _EditCollectionPrivacyStatusTile extends ConsumerWidget {
  const _EditCollectionPrivacyStatusTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final privacyStatus = ref.watch(privacyStatusProvider);

    return SwitchListTile(
      onChanged: (status) =>
          ref.read(privacyStatusProvider.notifier).state = status,
      value: privacyStatus,
      title: const Text("나만 보기"),
    );
  }
}
