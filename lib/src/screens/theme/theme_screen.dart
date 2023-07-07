import 'dart:ui';

import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/features/user/user.dart';
import 'package:serendy/src/sheets/sheets.dart';
import 'package:serendy/src/widgets/widgets.dart';

import 'controller/theme_controller.dart';

part 'widgets/_detail_bar.dart';
part 'widgets/_medias_grid.dart';
part 'widgets/_theme_background.dart';
part 'widgets/_theme_titles.dart';

class ThemeScreen extends ConsumerWidget {
  static const String routeName = 'themes';
  static const String routeLocation = '/$routeName/:id';
  const ThemeScreen({
    required this.id,
    super.key,
  });

  final ThemeID id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeValue = ref.watch(themeControllerProvider(id));

    return themeValue.when(
      skipLoadingOnReload: true,
      data: (state) => _ThemeTemplate(
        background: _ThemeBackground(
          image: state.theme.image,
        ),
        titles: _ThemeTitles(
          title: state.theme.title,
          subtitle: state.theme.description,
        ),
        detailBar: _ThemeDetailBar(
          theme: state.theme,
          owner: state.owner,
          isOwner: state.isOwner,
        ),
        mediasGrid: _ThemeMediasGrid(
          theme: state.theme,
          medias: state.theme.items.map((e) => e!.media).toList(),
        ),
      ),
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (err, stack) => Scaffold(
        body: Center(child: Text(err.toString())),
      ),
    );
  }
}

class _ThemeTemplate extends StatelessWidget {
  const _ThemeTemplate({
    required this.background,
    required this.titles,
    required this.detailBar,
    required this.mediasGrid,
  });

  final _ThemeBackground background;
  final _ThemeTitles titles;
  final _ThemeDetailBar detailBar;
  final _ThemeMediasGrid mediasGrid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          height: 320,
          width: double.infinity,
          child: background,
        ),
        CustomScrollView(slivers: [
          const SliverAppBar(backgroundColor: Colors.transparent),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: kContentPadding,
            ),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titles,
                  detailBar,
                  Gap.h24,
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: kContentPadding,
            ),
            sliver: mediasGrid,
          ),
        ]),
      ]),
    );
  }
}
