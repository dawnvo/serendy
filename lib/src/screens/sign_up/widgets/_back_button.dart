part of '../sign_up_screen.dart';

class _SignUpBackButton extends HookConsumerWidget {
  const _SignUpBackButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onCancel = useCallback(() async {
      try {
        // * 계정을 삭제하고 로그아웃해요.
        await ref.read(deleteAuthUserProvider.future);
        await ref.read(signOutWithGoogleProvider.future);

        // * 위젯이 폐기된 경우 작업을 끝내요.
        if (!context.mounted) return;

        // * 로그인 화면으로 이동해요.
        context.goNamed(AppRoutes.signIn);

        // * failure
      } catch (err) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(err.toString()),
        ));
      }
    }, []);

    return BackButton(onPressed: () {
      showDialog(
        context: context,
        builder: (_) => _SignUpWarningDialog(onCancel: onCancel),
      );
    });
  }
}

class _SignUpWarningDialog extends StatelessWidget {
  const _SignUpWarningDialog({required this.onCancel});
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: '계정 만들기를 중단할까요?',
      actions: [
        CustomDialogAction(
          onPressed: () => context.pop(),
          child: const Text("취소"),
        ),
        CustomDialogAction(
          onPressed: onCancel,
          isDestructiveAction: true,
          child: const Text("중단하기"),
        ),
      ],
    );
  }
}
