import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/widgets/widgets.dart';

import '../../../screens/theme/controller/theme_controller.dart';

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
      await ref.read(deleteThemeItemProvider(
        id: theme.id,
        mediaId: media.id,
      ).future);

      // * [EVENT] 테마 화면의 상태를 갱신해요.
      ref //
          .read(themeControllerProvider(theme.id, theme).notifier)
          .onThemeItemsUpdated();

      // * 나의 테마 목록을 새로고침(초기화)해요.
      ref.invalidate(getMyThemesProvider);

      // * 위젯이 폐기된 경우 작업을 끝내요.
      if (!context.mounted) return;

      // * success
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: kSnackBarDisplayDurationShort,
        content: Text("${theme.title}에서 삭제했어요."),
      ));

      // * failure
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(err.toString()),
      ));

      // * 메뉴를 닫아요.
    } finally {
      context.pop();
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
