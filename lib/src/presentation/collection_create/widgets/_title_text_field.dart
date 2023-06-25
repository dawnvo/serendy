part of '../create_collection_screen.dart';

class _CreateCollectionTitleTextField extends ConsumerWidget {
  const _CreateCollectionTitleTextField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(createCollectionControllerProvider);

    return TitleTextField(
      onChanged: (value) => ref
          .read(createCollectionControllerProvider.notifier)
          .changeTitle(value),
      value: state.title,
      hintText: state.hintText,
      autofocus: true,
    );
  }
}
