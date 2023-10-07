part of '../account_screen.dart';

class _AccountControls extends ConsumerWidget {
  const _AccountControls();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return __ControlsBar(controls: [
      TextButton(
        onPressed: () => ref //
            .read(accountControllerProvider.notifier)
            .signOut(),
        child: const Text('로그아웃'),
      ),
      TextButton(
        onPressed: () => context.goNamed(AppRoutes.home),
        child: const Text('회원탈퇴'),
      ),
    ]);
  }
}

class __ControlsBar extends StatelessWidget {
  const __ControlsBar({required this.controls});

  final List<TextButton> controls;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: context.theme.copyWith(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: context.colorScheme.onSurface.withOpacity(0.4),
          ),
        ),
      ),
      child: ButtonBar(
        alignment: MainAxisAlignment.center,
        children: controls,
      ),
    );
  }
}
