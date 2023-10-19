part of '../account_screen.dart';

class _AccountUserNameTile extends ConsumerWidget {
  const _AccountUserNameTile({required this.username});
  final String username;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final debouncer = ref.watch(debouncerProvider);
    // onChanged: (value) => debouncer.run(() {
    //   ref.read(accountControllerProvider.notifier).changeName(value);
    // })

    return _AccountListTile(
      onTap: () {},
      title: "아이디",
      subtitle: '@$username'.toLowerCase(),
    );
  }
}
