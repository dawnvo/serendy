import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/user/user.dart';
import 'package:serendy/src/sheets/sheets.dart';
import 'package:serendy/src/widgets/widgets.dart';

import 'controller/search_controller.dart';

part 'widgets/_search_bar.dart';
part 'widgets/_search_results.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = 'search';
  static const String routeLocation = routeName;
  const SearchScreen();

  @override
  Widget build(BuildContext context) {
    return const _SearchTemplate(
      searchBar: _SearchBar(),
      searchResults: _SearchResults(),
    );
  }
}

//template
class _SearchTemplate extends StatelessWidget {
  const _SearchTemplate({
    required this.searchBar,
    required this.searchResults,
  });

  final _SearchBar searchBar;
  final _SearchResults searchResults;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: [
            SliverAppBar(
              pinned: true,
              toolbarHeight: _SearchBar._height,
              backgroundColor: context.colorScheme.surface,
              surfaceTintColor: Colors.transparent,
              title: searchBar,
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(0.5),
                child: Divider(),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: kContentPadding),
              sliver: searchResults,
            ),
          ],
        ),
      ),
    );
  }
}
