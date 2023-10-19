part of '../settings_screen.dart';

class _ClearDislikesTile extends ConsumerWidget {
  const _ClearDislikesTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _SettingsListTile(
      onTap: () => showDialog(
        context: context,
        builder: (_) => __ClearDislikesDialog(onClear: () {
          // * 메뉴를 닫아요.
          context.pop();
          // * 초기화를 진행해요.
          ref.read(clearDislikesProvider);
          // * success
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            duration: kSnackBarDisplayDurationShort,
            content: Text("숨기기를 초기화했어요."),
          ));
        }),
      ),
      icon: RemixIcon.refresh_line,
      title: "숨기기 초기화",
      subtitle: "숨겼던 모든 작품을 다시 표시해요.",
    );
  }
}

//Dialog
class __ClearDislikesDialog extends StatelessWidget {
  const __ClearDislikesDialog({required this.onClear});
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: "숨겼던 작품을 다시 표시할까요?",
      actions: [
        CustomDialogAction(
          onPressed: () => context.pop(),
          child: const Text("취소"),
        ),
        CustomDialogAction(
          isDestructiveAction: true,
          onPressed: onClear,
          child: const Text("확인"),
        ),
      ],
    );
  }
}
