part of 'package:serendy/presentation/sign_in/sign_in_screen.dart';

class _SignInTitle extends StatelessWidget {
  const _SignInTitle();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Serendy",
          style: context.textTheme.headlineMedium,
        ),
        const SizedBox(height: 12),
        Text(
          "로그인하고 나의 수준을 확인해보세요.",
          style: context.textTheme.titleMedium,
        ),
      ],
    );
  }
}
