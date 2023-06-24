part of 'package:serendy/presentation/sign_in/sign_in_screen.dart';

class _SignInErrorDialog extends StatelessWidget {
  const _SignInErrorDialog({required this.message});
  final String? message;

  static void show(BuildContext context, String? message) {
    showDialog(
      context: context,
      builder: (_) => _SignInErrorDialog(
        message: message,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: message ?? '로그인에 실패했어요.',
      actions: [
        CustomDialogAction(
          onPressed: () => context.pop(),
          child: const Text("확인"),
        ),
      ],
    );
  }
}
