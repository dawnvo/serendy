part of '../create_collection_screen.dart';

class _CreateCollectionSubmitButton extends StatelessWidget {
  const _CreateCollectionSubmitButton({
    required this.title,
    this.onPressed,
    this.enabled = true,
  });

  final String title;
  final bool enabled;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        minimumSize: const Size(double.infinity, 56),
        textStyle: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: enabled ? onPressed : null,
      child: Text(title),
    );
  }
}
