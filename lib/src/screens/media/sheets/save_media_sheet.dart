import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/theme/theme.dart' hide ThemeItem;
import 'package:serendy/src/widgets/widgets.dart';

import '../../profile/controller/profile_controller.dart';

class SaveMediaSheet extends ConsumerWidget {
  const SaveMediaSheet(this.media);
  final Media media;

  /// 하단 시트를 열어요.
  static void show(BuildContext context, Media media) {
    context.showCustomBottomSheet((_) => SaveMediaSheet(media));
  }

  /// 미디어를 저장할 곳(테마)을 선택해요.
  void handleSelect(BuildContext context, WidgetRef ref, Theme theme) {
    // * 테마에 작품을 추가해요.
    ref.read(addThemeItemProvider(
      id: theme.id,
      mediaId: media.id,
    ));

    // * [EVENT] 나의 테마 목록을 갱신해요.
    ref //
        .read(profileControllerProvider.notifier)
        .onMyThemesUpdated();

    // * 메뉴를 닫고 메시지로 안내해요.
    context.pop();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: kSnackBarDisplayDurationShort,
      content: Text("${theme.title}에 작품을 추가했어요."),
    ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myThemesValue = ref.watch(getThemesProvider());

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
