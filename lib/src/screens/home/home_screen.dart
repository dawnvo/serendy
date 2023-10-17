// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/sheets/sheets.dart';
import 'package:serendy/src/widgets/widgets.dart';

import 'controller/home_controller.dart';

part 'widgets/_media_filters_tab_bar.dart';
part 'widgets/_medias_grid.dart';

class HomeScreen extends HookConsumerWidget {
  static const String routeName = 'home';
  static const String routeLocation = '/';
  const HomeScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();

    // * 맨 아래로 스크롤하면 작품을 더 불러와요.
    void fetchMoreListener() {
      if (scrollController.offset >= //ReachMaxExtent
          scrollController.position.maxScrollExtent) {
        ref.read(homeControllerProvider.notifier).fetchMore();
      }
    }

    // * Infinite scroll listener
    useEffect(() {
      scrollController.addListener(fetchMoreListener);
      return () => scrollController.removeListener(fetchMoreListener);
    }, [scrollController]);

    return _HomeTemplate(
      controller: scrollController,
      mediaFiltersTabBar: const _HomeMediaFiltersTabBar(),
      mediasGrid: const _HomeMediasGrid(),
    );
  }
}

//Template
class _HomeTemplate extends StatelessWidget {
  const _HomeTemplate({
    required this.controller,
    required this.mediaFiltersTabBar,
    required this.mediasGrid,
  });

  final ScrollController controller;
  final _HomeMediaFiltersTabBar mediaFiltersTabBar;
  final _HomeMediasGrid mediasGrid;

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
            centerTitle: true,
            floating: true,
            pinned: true,

            //title
            title: Image.asset(
              Assets.appIcon,
              height: Sizes.p48,
            ),

            //tab
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kTextTabBarHeight),
              child: mediaFiltersTabBar,
            ),
          ),

          //grid
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
