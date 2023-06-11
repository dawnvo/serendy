part of '../sign_in_screen.dart';

class _SignInButton extends StatelessWidget {
  const _SignInButton({
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
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
      onPressed: onPressed,
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
