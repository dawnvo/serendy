part of '../sign_in_screen.dart';

class _SignInTitle extends StatelessWidget {
  const _SignInTitle();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "내가 찾던 모든 애니",
          style: context.textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Gap.h12,
        Text(
          "세렌디에서 알아보세요",
          style: context.textTheme.headlineSmall,
        ),
      ],
    );
  }
}
