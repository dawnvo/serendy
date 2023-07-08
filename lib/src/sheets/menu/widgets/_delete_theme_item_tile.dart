import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/screens/theme/controller/theme_controller.dart';
import 'package:serendy/src/widgets/widgets.dart';

class DeleteThemeItemTile extends ConsumerWidget {
  const DeleteThemeItemTile({
    required this.theme,
    required this.media,
  });

  final Theme theme;
  final Media media;

  Future<void> handleTap(BuildContext context, WidgetRef ref) async {
    try {
      // * 해당 테마 항목을 삭제해요.
      final itemDeleted = await ref.read(deleteThemeItemProvider(
        id: theme.id,
        mediaId: media.id,
      ).future);

      // * 테마 화면 상태를 갱신해요.
      ref
          .read(themeControllerProvider(theme.id).notifier)
          .themeUpdated(itemDeleted);

      // * 위젯이 폐기되지 않은 경우에만 실행을 계속해요.
      if (!context.mounted) return;

      // * 삭제에 성공하면 메뉴를 닫고 메시지로 안내해요.
      context.pop();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: kSnackBarDisplayDurationShort,
        content: Text("${theme.title}에서 삭제했어요."),
      ));
    } catch (err) {
      // * 삭제에 실패하면 메시지로 안내해요.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(err.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MenuListTile(
      onTap: () => handleTap(context, ref),
      icon: const Icon(RemixIcon.indeterminate_circle_fill),
      title: "이 테마에서 삭제하기",
    );
  }
}
