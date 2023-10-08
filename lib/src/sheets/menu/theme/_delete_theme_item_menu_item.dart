import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/screens/theme/controller/theme_controller.dart';
import 'package:serendy/src/widgets/widgets.dart';

class DeleteThemeItemMenuItem extends ConsumerWidget {
  const DeleteThemeItemMenuItem({
    required this.theme,
    required this.media,
  });

  final Theme theme;
  final Media media;

  Future<void> handleTap(BuildContext context, WidgetRef ref) async {
    try {
      // * 해당 항목을 삭제해요.
      final itemDeleted = await ref.read(deleteThemeItemProvider(
        id: theme.id,
        mediaId: media.id,
      ).future);

      // * [EVENT] 테마 화면의 상태를 갱신해요.
      ref.read(themeControllerProvider(theme.id).notifier).themeUpdated(itemDeleted);

      // * 위젯이 폐기된 경우 작업을 끝내요.
      if (!context.mounted) return;

      // * 메뉴를 닫아요.
      context.pop();

      // * success
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: kSnackBarDisplayDurationShort,
        content: Text("${theme.title}에서 삭제했어요."),
      ));

      // * failure
    } catch (err) {
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
