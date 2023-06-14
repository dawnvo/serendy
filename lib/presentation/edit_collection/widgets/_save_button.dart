part of 'package:serendy/presentation/edit_collection/edit_collection_screen.dart';

class _EditCollectionSaveButton extends ConsumerWidget {
  const _EditCollectionSaveButton(this.provider);
  final EditCollectionProvider provider;

  void handleSubmit(ConsumerHandler handler) {
    FocusScope.of(handler.$1).unfocus();
    handler.$2.read(provider.notifier).submit();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEdited = ref.watch(provider.select((_) => _.isEdited));

    return TextButton(
      onPressed: isEdited ? () => handleSubmit((context, ref)) : null,
      child: const Text("저장하기"),
    );
  }
}
