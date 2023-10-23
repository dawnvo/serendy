part of '../sign_up_screen.dart';

class _SignUpUsernameTextField extends HookConsumerWidget {
  const _SignUpUsernameTextField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(text: null);

    final debouncer = ref.watch(debouncerProvider);
    final errorText = ref.watch(signUpControllerProvider.select(
      (_) => _.value?.errorText,
    ));

    final onChange = useCallback((String value) {
      debouncer.run(() {
        ref //
            .read(signUpControllerProvider.notifier)
            .validateUsername(value);
      });
    }, []);

    final baseStyle = context.textTheme.titleLarge;
    return TextField(
      controller: controller,
      onChanged: onChange,
      autofocus: true,
      maxLength: Assets.usernameMaxLength,
      inputFormatters: [LowerCaseTextFormatter()],
      style: baseStyle,
      decoration: InputDecoration(
        hintStyle: baseStyle?.copyWith(
          color: context.colorScheme.outline,
        ),
        prefixText: "@",
        hintText: "아이디",
        counterText: "",
        errorText: errorText,
      ),
    );
  }
}
