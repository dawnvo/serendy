part of '../account_screen.dart';

class _AccountNameTextField extends ConsumerWidget {
  const _AccountNameTextField({required this.name});

  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final debouncer = ref.watch(debouncerProvider);

    return TitleTextField(
      onChanged: (value) => debouncer.run(() {
        ref.read(accountControllerProvider.notifier).changeName(value);
      }),
      value: name,
      hintText: "닉네임",
    );
  }
}
