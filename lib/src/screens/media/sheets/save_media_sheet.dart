import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/theme/theme.dart' hide ThemeItem;
import 'package:serendy/src/widgets/widgets.dart';

class SaveMediaSheet extends ConsumerWidget {
  const SaveMediaSheet(this.media);
  final Media media;

  /// 하단 시트를 열어요.
  static void show(BuildContext context, Media media) {
    context.showCustomBottomSheet((_) => SaveMediaSheet(media));
  }

  /// 미디어를 저장할 곳(테마)을 선택해요.
  Future<void> handleSelect(BuildContext context, WidgetRef ref, Theme theme) async {
    try {
      // * 테마에 작품을 추가해요.
      await ref.read(addThemeItemProvider(
        id: theme.id,
        mediaId: media.id,
      ).future);

      // * 나의 테마 목록을 새로고침(초기화)해요.
      ref.invalidate(getMyThemesProvider);

      // * 위젯이 폐기된 경우 작업을 끝내요.
      if (!context.mounted) return;

      // * success
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: kSnackBarDisplayDurationShort,
        content: Text("${theme.title}에 작품을 추가했어요."),
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
    final myThemesValue = ref.watch(getMyThemesProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Sizes.p12),
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          myThemesValue.when(
            data: (themes) => SliverMyThemesList(
              childCount: themes.length,
              builder: (context, index) {
                final theme = themes[index]!;

                return ThemeItem(
                  onTap: () => handleSelect(context, ref, theme),
                  theme: theme,
                );
              },
            ),
            loading: () => SliverMyThemesList(
              childCount: 4,
              showCreateTile: false,
              addAutomaticKeepAlives: false,
              builder: (context, index) => const Placeholder$ThemeItem(),
            ),
            error: (err, stack) => const ErrorTemplate(
              message: "나의 테마를 불러오지 못했어요.",
              sliver: true,
            ),
          ),
        ],
      ),
    );
  }
}
