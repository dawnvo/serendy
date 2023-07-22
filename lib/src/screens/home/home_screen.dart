import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/sheets/sheets.dart';
import 'package:serendy/src/widgets/widgets.dart';

import 'controller/home_controller.dart';

import 'widgets/f_medias_grid.dart';

part 'widgets/_media_filters_tab_bar.dart';
part 'widgets/_medias_grid.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';
  static const String routeLocation = '/';
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    final filters = ["최신 애니", "실시간 인기", "완결 애니"];

    return _HomeTemplate(
      mediaFiltersTabBar: _HomeMediaFiltersTabBar(
        filters: filters,
        onSelect: (item) {},
      ),
      mediasGrid: const Firestore$HomeMediasGrid(),
    );
  }
}

//Template
class _HomeTemplate extends StatelessWidget {
  const _HomeTemplate({
    required this.mediaFiltersTabBar,
    required this.mediasGrid,
  });

  final _HomeMediaFiltersTabBar mediaFiltersTabBar;
  final Firestore$HomeMediasGrid mediasGrid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: context.colorScheme.surface,
            surfaceTintColor: context.colorScheme.surface,
            centerTitle: true,
            pinned: true,
            floating: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kTextTabBarHeight),
              child: mediaFiltersTabBar,
            ),
            title: Image.asset(
              Assets.appIcon,
              height: Sizes.p48,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: kContentPadding,
            ),
            sliver: mediasGrid,
          ),
        ],
      ),
    );
  }
}
