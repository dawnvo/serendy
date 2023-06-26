part of '../account_screen.dart';

class _AccountGenderTile extends ConsumerWidget {
  const _AccountGenderTile({required this.gender});
  final String gender;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _AccountListTile(
      onTap: () {},
      label: "성별",
      value: gender,
    );
  }
}
