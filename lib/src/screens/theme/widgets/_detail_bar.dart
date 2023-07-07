part of '../theme_screen.dart';

class _ThemeDetailBar extends ConsumerWidget {
  const _ThemeDetailBar({
    required this.theme,
    required this.owner,
  });

  final Theme theme;
  final User owner;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loggedInUserId = ref.watch(userIdProvider);
    final isOwner = owner.id == loggedInUserId;

    return Row(children: [
      _buildOwnerProfile(context),
      Gap.w12,

      // * 테마 주인에게만 비공개 상태를 표시해요.
      if (isOwner) _buildPrivacyStatus(context),
      const Spacer(),

      // * 기본 테마라면 아무것도 표시하지 않아요.
      if (theme.id == loggedInUserId)
        const SizedBox()
      // * 커스텀 테마라면 액션 버튼을 표시해요.
      else
        _buildActionIconButtons(context, isOwner),
    ]);
  }

  Widget _buildActionIconButtons(BuildContext context, bool isOwner) {
    return Row(children: [
      // * 주인에게는 [편집] 아이콘을 표시해요.
      if (isOwner)
        IconButton(
          onPressed: () => context.pushNamed(
            AppRoutes.editThemeName,
            extra: theme,
          ),
          icon: const Icon(RemixIcon.pencil_fill),
        )

      // * 다른 사람에게는 [좋아요] 아이콘을 표시해요.
      else
        IconButton(
          onPressed: () {},
          icon: const Icon(RemixIcon.heart_fill),
        ),

      //share button
      IconButton(
        onPressed: () {},
        icon: const Icon(RemixIcon.share_forward_fill),
      ),
    ]);
  }

  Widget _buildOwnerProfile(BuildContext context) {
    return Row(children: [
      CircleAvatar(
        radius: Sizes.p12,
        backgroundImage: owner.avatar != null //
            ? NetworkImage(owner.avatar!)
            : null,
      ),
      Gap.w8,
      Text(
        owner.name,
        style: context.textTheme.bodyMedium,
      ),
    ]);
  }

  Widget _buildPrivacyStatus(BuildContext context) {
    final color = context.colorScheme.outline;
    final textStyle = context.textTheme.bodyMedium;
    const iconSize = Sizes.p16;

    if (theme.private) {
      return Row(children: [
        Icon(RemixIcon.lock_line, color: color, size: iconSize),
        Gap.w4,
        Text("비공개", style: textStyle?.copyWith(color: color)),
      ]);
    } else {
      return Row(children: [
        Icon(RemixIcon.global_line, color: color, size: iconSize),
        Gap.w4,
        Text("공개", style: textStyle?.copyWith(color: color)),
      ]);
    }
  }
}
