import 'package:flutter/cupertino.dart';
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
    final scrollController = usePagination(
      ref.read(homeControllerProvider.notifier).fetchMore,
      ref.read(homeControllerProvider.notifier).canLoadMore,
    );

    return _HomeTemplate(
      controller: scrollController,
      mediaFiltersTabBar: const _HomeMediaFiltersTabBar(),
      mediasGrid: const _HomeMediasGrid(),
    );
  }
}

//template
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
      body: NestedScrollView(
        controller: controller,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: context.colorScheme.surface,
            surfaceTintColor: Colors.transparent,
            centerTitle: true,
            floating: false,
            pinned: false,

            //title
            title: Image.asset(
              Assets.appIcon,
              height: Sizes.p48,
            ),

            //tab
            // bottom: PreferredSize(
            //   preferredSize: const Size.fromHeight(kTextTabBarHeight),
            //   child: mediaFiltersTabBar,
            // ),
          ),
        ],
        //grid
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kContentPadding,
          ),
          child: mediasGrid,
        ),
      ),
    );
  }
}
