part of '../sign_up_screen.dart';

class _SignUpSubmitButton extends HookConsumerWidget {
  const _SignUpSubmitButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpValue = ref.watch(signUpControllerProvider);

    final onPressed = useCallback(() async {
      try {
        // * 계정을 만들어요.
        await ref //
            .read(signUpControllerProvider.notifier)
            .submit();

        // * 위젯이 폐기된 경우 작업을 끝내요.
        if (!context.mounted) return;

        // * 홈으로 이동해요.
        context.goNamed(AppRoutes.home);

        // * failure
      } catch (err) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(err.toString()),
        ));
      }
    }, []);

    final hasError = signUpValue.value?.errorText != null;
    final isLoading = signUpValue.isLoading;
    final isEmpty = signUpValue.value?.username == null || //
        signUpValue.value!.username.isEmpty;

    return FilledButton(
      style: FilledButton.styleFrom(
        minimumSize: const Size(double.infinity, Sizes.p56),
        textStyle: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: !hasError && !isLoading && !isEmpty ? onPressed : null,
      child: const Text('계정 만들기'),
    );
  }
}
