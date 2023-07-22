import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/widgets/widgets.dart';

import 'widgets/f_themes_grid.dart';

part 'widgets/_search_bar.dart';
part 'widgets/_themes_grid.dart';

class DiscoverScreen extends StatelessWidget {
  static const String routeName = 'discover';
  static const String routeLocation = '/$routeName';
  const DiscoverScreen();

  @override
  Widget build(BuildContext context) {
    return const _DiscoverTemplate(
      searchBar: _DiscoverSearchBar(),
      themesGrid: Firestore$DiscoverThemesGrid(),
    );
  }
}

//Template
class _DiscoverTemplate extends StatelessWidget {
  const _DiscoverTemplate({
    required this.searchBar,
    required this.themesGrid,
  });

  final _DiscoverSearchBar searchBar;
  final Firestore$DiscoverThemesGrid themesGrid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorScheme.surface,
        surfaceTintColor: context.colorScheme.surface,
        toolbarHeight: kToolbarHeight + kContentPadding * 2, // margin top+down
        title: searchBar,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kContentPadding),
        child: themesGrid,
      ),
    );
  }
}
