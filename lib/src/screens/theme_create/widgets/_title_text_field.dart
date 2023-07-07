part of '../create_theme_screen.dart';

class _CreateThemeTitleTextField extends ConsumerWidget {
  const _CreateThemeTitleTextField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(createThemeControllerProvider);
    final debouncer = ref.watch(debouncerProvider);

    return TitleTextField(
      onChanged: (value) => debouncer.run(() {
        ref.read(createThemeControllerProvider.notifier).changeTitle(value);
      }),
      value: state.title,
      hintText: state.hintText,
      autofocus: true,
    );
  }
}
