part of '../account_screen.dart';

class _AccountEmailTile extends ConsumerWidget {
  const _AccountEmailTile({required this.email});
  final String email;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _AccountListTile(
      onTap: () {},
      title: "이메일",
      subtitle: email,
    );
  }
}
