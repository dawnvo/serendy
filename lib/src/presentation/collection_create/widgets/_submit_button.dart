part of '../create_collection_screen.dart';

class _CreateCollectionSubmitButton extends ConsumerWidget {
  const _CreateCollectionSubmitButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton(
      style: FilledButton.styleFrom(
        minimumSize: const Size(double.infinity, 56),
        textStyle: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () => ref
          .read(createCollectionControllerProvider.notifier)
          .createCollection(),
      child: const Text("만들기"),
    );
  }
}
