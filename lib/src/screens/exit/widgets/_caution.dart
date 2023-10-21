part of '../exit_screen.dart';

class _ExitCaution extends ConsumerWidget {
  const _ExitCaution();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(exitControllerProvider);

    final title = '${state.username}님과 이별인가요?';
    final message = '계정을 삭제하면 '
        '${state.username}님의 (아이디, 이메일) 정보는 바로 삭제되며, '
        '게시한 콘텐츠의 접근 권한이 손실돼요. '
        '삭제를 원하는 콘텐츠가 있다면 탈퇴 전 비공개 처리하거나 삭제하시길 바라요.';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        Gap.h8,
        Text(message),
      ],
    );
  }
}
