part of '../theme_create_screen.dart';

class _CreateThemeTitleTextField extends ConsumerWidget {
  const _CreateThemeTitleTextField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(createThemeControllerProvider);

    return TitleTextField(
      onChanged: (value) => ref //
          .read(createThemeControllerProvider.notifier)
          .changeTitle(value),
      value: state.title,
      hintText: state.hintText,
      autofocus: true,
    );
  }
}
