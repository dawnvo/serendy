part of '../edit_collection_screen.dart';

class _EditCollectionTitleTextField extends ConsumerWidget {
  const _EditCollectionTitleTextField(this.provider);
  final EditCollectionControllerProvider provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(provider.select((state) => state.title));
    final debouncer = ref.watch(debouncerProvider);

    return TitleTextField(
      onChanged: (value) => debouncer.run(() {
        ref.watch(provider.notifier).changeTitle(value);
      }),
      value: title,
      hintText: "컬렉션 이름",
    );
  }
}
