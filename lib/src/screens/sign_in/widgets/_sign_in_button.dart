part of '../sign_in_screen.dart';

class _SignInButton extends ConsumerWidget {
  const _SignInButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double iconSize = 24;

    return FilledButton(
      style: FilledButton.styleFrom(
        minimumSize: const Size.fromHeight(56),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        textStyle: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () =>
          ref.read(signInControllerProvider.notifier).signInWithGoogle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            Assets.googleIcon,
            height: iconSize,
          ),
          const Text("Google로 계속하기"),
          const SizedBox(width: iconSize),
        ],
      ),
    );
  }
}
