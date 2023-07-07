part of '../edit_theme_screen.dart';

class _EditThemeTitleTextField extends ConsumerWidget {
  const _EditThemeTitleTextField(this.provider);
  final EditThemeControllerProvider provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(provider.select((state) => state.title));
    final debouncer = ref.watch(debouncerProvider);

    return TitleTextField(
      onChanged: (value) => debouncer.run(() {
        ref.watch(provider.notifier).changeTitle(value);
      }),
      value: title,
      hintText: "테마 이름",
    );
  }
}
