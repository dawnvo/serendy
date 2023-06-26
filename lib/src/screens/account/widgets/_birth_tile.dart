part of '../account_screen.dart';

class _AccountBirthTile extends ConsumerWidget {
  const _AccountBirthTile({required this.birth});
  final int birth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _AccountListTile(
      onTap: () {},
      label: "생일",
      value: birth.toString(),
    );
  }
}
