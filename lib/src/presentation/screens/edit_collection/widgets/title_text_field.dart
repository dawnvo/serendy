part of '../edit_collection_screen.dart';

class _EditCollectionTitleTextField extends ConsumerWidget {
  const _EditCollectionTitleTextField(this.provider);
  final EditCollectionProvider provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(provider.select((_) => _.title));

    return TitleTextField(
      onChanged: (value) => ref.watch(provider.notifier).changeTitle(value),
      value: title,
      placeholder: "컬렉션 이름",
    );
  }
}
