part of '../settings_screen.dart';

class _ReportProblemTile extends ConsumerWidget {
  const _ReportProblemTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsState = ref.watch(settingsControllerProvider);

    return _SettingsListTile(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => WillPopScope(
          onWillPop: () async {
            _ReportWarningDialog.show(context);
            return false;
          },
          child: WebView(url: settingsState.reportProblemUrl),
        ),
      )),
      icon: RemixIcon.error_warning_line,
      title: "문제 신고",
      subtitle: "발생한 문제 또는 아쉬운 점을 알려요.",
    );
  }
}

class _RequestUpdateTile extends ConsumerWidget {
  const _RequestUpdateTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsState = ref.watch(settingsControllerProvider);

    return _SettingsListTile(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => WillPopScope(
          onWillPop: () async {
            _ReportWarningDialog.show(context);
            return false;
          },
          child: WebView(url: settingsState.requestUpdateUrl),
        ),
      )),
      icon: RemixIcon.upload_cloud_line,
      title: "DB 수정/추가",
      subtitle: "잘못된 정보나 빠뜨린 작품을 문의해요.",
    );
  }
}

class _ReportWarningDialog extends StatelessWidget {
  const _ReportWarningDialog();

  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const _ReportWarningDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: "문의를 종료할까요?",
      actions: [
        CustomDialogAction(
          onPressed: () {
            // * 대화창을 닫아요.
            context.pop(false);
          },
          child: const Text("취소"),
        ),
        CustomDialogAction(
          onPressed: () {
            // * 대화창을 닫아요.
            context.pop();
            // * 이전 페이지로 이동해요.
            context.pop(true);
          },
          isDestructiveAction: true,
          child: const Text("종료"),
        ),
      ],
    );
  }
}
