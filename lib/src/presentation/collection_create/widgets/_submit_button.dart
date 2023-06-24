part of '../create_collection_screen.dart';

class _CreateCollectionSubmitButton extends StatelessWidget {
  const _CreateCollectionSubmitButton();

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        minimumSize: const Size(double.infinity, 56),
        textStyle: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {},
      child: const Text("만들기"),
    );
  }
}