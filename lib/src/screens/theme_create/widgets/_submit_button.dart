part of '../create_theme_screen.dart';

class _CreateThemeSubmitButton extends ConsumerWidget {
  const _CreateThemeSubmitButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton(
      style: FilledButton.styleFrom(
        minimumSize: const Size(double.infinity, 56),
        textStyle: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () =>
          ref.read(createThemeControllerProvider.notifier).createTheme(),
      child: const Text("만들기"),
    );
  }
}
