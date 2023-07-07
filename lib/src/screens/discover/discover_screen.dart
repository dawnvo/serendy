import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/widgets/widgets.dart';

import 'controller/discover_controller.dart';

part 'widgets/_search_bar.dart';
part 'widgets/_themes_grid.dart';

class DiscoverScreen extends StatelessWidget {
  static const String routeName = 'discover';
  static const String routeLocation = '/$routeName';
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _DiscoverTemplate(
      searchBar: _DiscoverSearchBar(),
      themesGrid: _DiscoverThemesGrid(),
    );
  }
}

class _DiscoverTemplate extends StatelessWidget {
  const _DiscoverTemplate({
    required this.searchBar,
    required this.themesGrid,
  });

  final _DiscoverSearchBar searchBar;
  final _DiscoverThemesGrid themesGrid;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kContentPadding,
            vertical: Sizes.p24,
          ),
          child: CustomScrollView(slivers: [
            SliverToBoxAdapter(child: searchBar),
            const SliverToBoxAdapter(child: Gap.h24),
            themesGrid,
          ]),
        ),
      ),
    );
  }
}
