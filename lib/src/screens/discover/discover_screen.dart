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

//Template
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
      body: CustomScrollView(
        controller: controller,
        slivers: [
          SliverAppBar(
            backgroundColor: context.colorScheme.surface,
            surfaceTintColor: Colors.transparent,
            toolbarHeight: kTextTabBarHeight,
            floating: true,
            pinned: true,

            //titles
            title: const Text("검색"),

            //searchBar
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(
                // sum: bottom height + padding ( top + bottom )
                kTextTabBarHeight + (kContentPadding * 2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(kContentPadding),
                child: searchBar,
              ),
            ),
          ),

          //grid
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: kContentPadding,
            ),
            sliver: themesGrid,
          ),
        ],
      ),
    );
  }
}
