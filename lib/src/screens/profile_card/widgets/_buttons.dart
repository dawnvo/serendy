part of '../profile_card_modal.dart';

class _ProfileCardButtons extends StatelessWidget {
  const _ProfileCardButtons();

  final Size _buttonSize = const Size(280, 48);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _buildMainButton(context),
      Gap.h8,
      _buildCloseButton(context),
    ]);
  }

  FilledButton _buildMainButton(BuildContext context) {
    return FilledButton(
      onPressed: () => context.pushNamed(AppRoutes.history),
      style: FilledButton.styleFrom(
          fixedSize: _buttonSize,
          backgroundColor: context.colorScheme.surfaceVariant,
          foregroundColor: context.colorScheme.onSurface),
      child: const Text("감상한 작품 보기"),
    );
  }

  OutlinedButton _buildCloseButton(BuildContext context) {
    return OutlinedButton(
      onPressed: () => context.pop(),
      style: OutlinedButton.styleFrom(
          fixedSize: _buttonSize,
          foregroundColor: context.colorScheme.onSurfaceVariant,
          side: BorderSide(color: context.colorScheme.outlineVariant)),
      child: const Text("닫기"),
    );
  }
}
