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
    final filters = ["최신 애니", "실시간 인기", "완결 애니"];
    final scrollController = useScrollController();

    // * 맨 아래로 스크롤하면 작품을 더 불러와요.
    void fetchMoreListener() {
      if (scrollController.offset >= //ReachMaxExtent
          scrollController.position.maxScrollExtent - 80) {
        ref.read(homeControllerProvider.notifier).fetchMore();
      }
    }

    // * Infinite scroll listener
    useEffect(() {
      scrollController.addListener(fetchMoreListener);
      return null;
    }, [fetchMoreListener]);

    return _HomeTemplate(
      controller: scrollController,
      mediaFiltersTabBar: _HomeMediaFiltersTabBar(
        filters: filters,
        onSelect: (item) {},
      ),
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
            pinned: true,
            floating: true,
            centerTitle: true,
            backgroundColor: context.colorScheme.surface,
            surfaceTintColor: Colors.transparent,
            title: Image.asset(
              Assets.appIcon,
              height: Sizes.p48,
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kTextTabBarHeight),
              child: mediaFiltersTabBar,
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
