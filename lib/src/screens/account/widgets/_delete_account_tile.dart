part of '../account_screen.dart';

class _AccountDeleteTile extends ConsumerWidget {
  const _AccountDeleteTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _AccountListTile(
      onTap: () {},
      title: "탈퇴하기",
      isDestructiveAction: true,
    );
  }
}
