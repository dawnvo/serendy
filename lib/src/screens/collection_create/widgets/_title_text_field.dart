part of '../create_collection_screen.dart';

class _CreateCollectionTitleTextField extends ConsumerWidget {
  const _CreateCollectionTitleTextField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(createCollectionControllerProvider);
    final debouncer = ref.watch(debouncerProvider);

    return TitleTextField(
      onChanged: (value) => debouncer.run(() {
        ref
            .read(createCollectionControllerProvider.notifier)
            .changeTitle(value);
      }),
      value: state.title,
      hintText: state.hintText,
      autofocus: true,
    );
  }
}
