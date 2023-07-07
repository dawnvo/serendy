part of '../theme_screen.dart';

class _ThemeDetailBar extends StatelessWidget {
  const _ThemeDetailBar({
    required this.theme,
    required this.owner,
    required this.isOwner,
  });

  final Theme theme;
  final User owner;
  final bool isOwner;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      _buildOwnerProfile(context),
      const Spacer(),
      _buildActionIconButton(context),
      IconButton(
        onPressed: () {},
        icon: const Icon(RemixIcon.share_forward_fill),
      ),
    ]);
  }

  Widget _buildActionIconButton(BuildContext context) {
    // * 테마 주인일 경우 [편집] 아이콘을 표시해요.
    if (isOwner) {
      return IconButton(
        onPressed: () => context.pushNamed(
          AppRoutes.editThemeName,
          extra: theme,
        ),
        icon: const Icon(RemixIcon.pencil_fill),
      );
    }
    // * 아닐 경우 [좋아요] 아이콘을 표시해요.
    return IconButton(
      onPressed: () {},
      icon: const Icon(RemixIcon.heart_fill),
    );
  }

  Widget _buildOwnerProfile(BuildContext context) {
    return Row(children: [
      if (owner.avatar != null)
        CircleAvatar(
          backgroundImage: NetworkImage(owner.avatar!),
          radius: Sizes.p12,
        )
      else
        const CircleAvatar(radius: Sizes.p12),
      Gap.w12,
      Text(
        owner.name,
        style: context.textTheme.bodyMedium,
      ),
    ]);
  }
}
