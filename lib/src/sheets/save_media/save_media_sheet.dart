import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/theme/theme.dart' hide ThemeItem;
import 'package:serendy/src/widgets/widgets.dart';

typedef SaveMediaSheetPayload = ({
  Media media,
});

class SaveMediaSheet extends ConsumerWidget {
  const SaveMediaSheet(this.payload, {super.key});
  final SaveMediaSheetPayload payload;

  static void show(BuildContext context, SaveMediaSheetPayload payload) {
    context.showCustomBottomSheet((_) => SaveMediaSheet(payload));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myThemesValue = ref.watch(watchMyThemesListProvider);

    void handleSelect(Theme theme) {
      ref.read(addThemeItemProvider(
        id: theme.id,
        mediaId: payload.media.id,
      ));
      context.pop();
    }

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
                  onTap: () => handleSelect(theme),
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
            error: (err, stack) => SliverToBoxAdapter(
              child: Center(child: Text(err.toString())),
            ),
          ),
        ],
      ),
    );
  }
}
