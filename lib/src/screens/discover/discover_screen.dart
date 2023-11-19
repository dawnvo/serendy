import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/widgets/widgets.dart';

import 'controller/discover_controller.dart';

part 'widgets/_search_bar.dart';
part 'widgets/_themes_grid.dart';

class DiscoverScreen extends HookConsumerWidget {
  static const String routeName = 'discover';
  static const String routeLocation = '/$routeName';
  const DiscoverScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = usePagination(
      ref.read(discoverControllerProvider.notifier).fetchMore,
      ref.read(discoverControllerProvider.notifier).canLoadMore,
    );

    return _DiscoverTemplate(
      controller: scrollController,
      searchBar: const _DiscoverSearchBar(),
      themesGrid: const _DiscoverThemesGrid(),
    );
  }
}

//template
class _DiscoverTemplate extends StatelessWidget {
  const _DiscoverTemplate({
    required this.controller,
    required this.searchBar,
    required this.themesGrid,
  });

  final ScrollController controller;
  final _DiscoverSearchBar searchBar;
  final _DiscoverThemesGrid themesGrid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: controller,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: context.colorScheme.surface,
            surfaceTintColor: Colors.transparent,
            toolbarHeight: kTextTabBarHeight,
            title: const Text("검색"),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: kContentPadding,
            ),
            sliver: SliverToBoxAdapter(
              child: searchBar,
            ),
          )
        ],
        //grid
        body: Padding(
          padding: const EdgeInsets.all(kContentPadding),
          child: themesGrid,
        ),
      ),
    );
  }
}
