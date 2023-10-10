part of '../theme_edit_screen.dart';

class _EditThemeTitleTextField extends ConsumerWidget {
  const _EditThemeTitleTextField(this.provider);
  final EditThemeControllerProvider provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final debouncer = ref.watch(debouncerProvider);
    final title = ref.watch(provider.select(
      (state) => state.title,
    ));

    return TitleTextField(
      onChanged: (value) => debouncer.run(() {
        ref.watch(provider.notifier).changeTitle(value);
      }),
      value: title,
      hintText: "테마 이름",
    );
  }
}
