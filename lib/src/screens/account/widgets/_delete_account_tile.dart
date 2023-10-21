part of '../account_screen.dart';

class _AccountDeleteTile extends ConsumerWidget {
  const _AccountDeleteTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _AccountListTile(
      onTap: () => context.pushNamed(AppRoutes.exit),
      title: "탈퇴하기",
      isDestructiveAction: true,
    );
  }
}
