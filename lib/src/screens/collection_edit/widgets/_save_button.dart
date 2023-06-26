part of '../edit_collection_screen.dart';

class _EditCollectionSaveButton extends ConsumerWidget {
  const _EditCollectionSaveButton(this.provider);
  final EditCollectionControllerProvider provider;

  void handleSubmit(BuildContext context, WidgetRef ref) {
    FocusScope.of(context).unfocus();
    ref.read(provider.notifier).submit();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEdited = ref.watch(provider.select((state) => state.isEdited));

    return TextButton(
      onPressed: isEdited ? () => handleSubmit(context, ref) : null,
      child: const Text("저장하기"),
    );
  }
}
