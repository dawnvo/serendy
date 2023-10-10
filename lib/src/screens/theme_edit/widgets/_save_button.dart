part of '../theme_edit_screen.dart';

class _EditThemeSaveButton extends ConsumerWidget {
  const _EditThemeSaveButton(this.provider);
  final EditThemeControllerProvider provider;

  void handleSubmit(BuildContext context, WidgetRef ref) {
    FocusScope.of(context).unfocus();
    ref.read(provider.notifier).submit();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEdited = ref.watch(provider.select(
      (state) => state.isEdited,
    ));

    return TextButton(
      onPressed: isEdited //
          ? () => handleSubmit(context, ref)
          : null,
      child: const Text("저장하기"),
    );
  }
}
