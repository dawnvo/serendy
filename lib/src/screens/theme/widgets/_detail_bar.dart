part of '../theme_screen.dart';

class _ThemeDetailBar extends ConsumerWidget {
  const _ThemeDetailBar({
    required this.theme,
  });

  final Theme theme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserId = ref.watch(currentUserIdProvider);
    final isOwner = theme.owner.id == currentUserId;
    final isDefaultTheme = theme.id == currentUserId;

    return SizedBox(
      height: Sizes.p48,
      child: Row(children: [
        // * 소유자 정보
        _buildOwnerProfile(context),
        Gap.w12,

        // * 소유자에게만 상태 여부를 표시해요.
        if (isOwner) _buildPrivacyStatus(context),
        const Spacer(),

        // * 기본 테마라면 - 아무것도 표시하지 않아요.
        // * 사용자 테마라면 - 액션 버튼을 표시해요.
        if (!isDefaultTheme)
          __ActionIconButtons(
            theme: theme,
            isOwner: isOwner,
          ),
      ]),
    );
  }

  Widget _buildOwnerProfile(BuildContext context) {
    return Row(children: [
      CircleAvatar(
        radius: Sizes.p12,
        backgroundImage: theme.owner.avatar != null //
            ? NetworkImage(theme.owner.avatar!)
            : null,
      ),
      Gap.w8,
      Text(
        theme.owner.name,
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

//Action icon buttons
class __ActionIconButtons extends StatelessWidget {
  const __ActionIconButtons({
    required this.theme,
    required this.isOwner,
  });

  final Theme theme;
  final bool isOwner;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      // * 주인에게는 [편집] 아이콘을 표시해요.
      if (isOwner)
        IconButton(
          onPressed: () => context.pushNamed(
            AppRoutes.editTheme,
            pathParameters: {'id': theme.id},
            extra: theme,
          ),
          icon: const Icon(RemixIcon.pencil_fill),
        )

      // * 다른 사람에게는 [좋아요] 아이콘을 표시해요.
      else
        IconButton(
          onPressed: () {},
          color: context.colorScheme.onSurfaceVariant,
          icon: const Icon(RemixIcon.heart_fill),
        ),

      //share button
      IconButton(
        onPressed: () {},
        icon: const Icon(RemixIcon.share_forward_fill),
      ),
    ]);
  }
}
