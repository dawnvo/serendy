import 'dart:ui';

import 'package:share_plus/share_plus.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/auth/auth.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/sheets/sheets.dart';
import 'package:serendy/src/widgets/widgets.dart';

import 'controller/theme_controller.dart';

part 'widgets/_detail_bar.dart';
part 'widgets/_theme_background.dart';
part 'widgets/_theme_items_grid.dart';
part 'widgets/_theme_titles.dart';

class ThemeScreen extends ConsumerWidget {
  static const String routeName = 'themes';
  static const String routeLocation = '$routeName/:id';
  const ThemeScreen({
    required this.id,
    this.theme,
  });

  final ThemeID id;
  final Theme? theme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeValue = ref.watch(themeControllerProvider(id, theme));

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
        ),
        itemsGrid: _ThemeItemsGrid(
          theme: state.theme,
          medias: state.theme.items //
              .map((item) => item!.convertEntity)
              .toList(),
        ),
      ),
      loading: () => _Placeholder$ThemeScreen(theme),
      error: (err, stack) => const ErrorTemplate(
        message: "테마 정보를 불러오지 못했어요.",
        backButton: true,
      ),
    );
  }
}

//template
class _ThemeTemplate extends StatelessWidget {
  const _ThemeTemplate({
    required this.background,
    required this.titles,
    required this.detailBar,
    required this.itemsGrid,
  });

  final _ThemeBackground background;
  final _ThemeTitles titles;
  final _ThemeDetailBar detailBar;
  final Widget itemsGrid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          height: 320,
          width: double.infinity,
          child: background,
        ),
        NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const SliverAppBar(pinned: true),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kContentPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titles,
                    detailBar,
                  ],
                ),
              ),
            ),
          ],
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kContentPadding,
              vertical: Sizes.p24,
            ),
            child: itemsGrid,
          ),
        ),
      ]),
    );
  }
}

//placeholder
class _Placeholder$ThemeScreen extends StatelessWidget {
  const _Placeholder$ThemeScreen(this.theme);
  final Theme? theme;

  @override
  Widget build(BuildContext context) {
    final data = theme;
    if (data == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: LoadingIndicator()),
      );
    }
    return _ThemeTemplate(
      background: _ThemeBackground(image: data.image),
      titles: _ThemeTitles(
        title: data.title,
        subtitle: data.description,
      ),
      detailBar: _ThemeDetailBar(
        theme: data,
      ),
      itemsGrid: const Column(children: [
        LoadingIndicator(),
      ]),
    );
  }
}
