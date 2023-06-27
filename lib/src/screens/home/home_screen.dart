import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/sheets/menu/media_menu_sheet.dart';
import 'package:serendy/src/widgets/widgets.dart';

import 'controller/home_controller.dart';

part 'widgets/_media_filters_tab_bar.dart';
part 'widgets/_medias_grid.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';
  static const String routeLocation = '/';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final filters = ["실시간 인기", "애니", "만화", "소설", "판타지", "드라마"];

    return _HomeTemplate(
      mediaFiltersTabBar: _HomeMediaFiltersTabBar(
        filters: filters,
        onSelect: (item) {},
      ),
      mediasGrid: const _HomeMediasGrid(),
    );
  }
}

class _HomeTemplate extends StatelessWidget {
  const _HomeTemplate({
    required this.mediaFiltersTabBar,
    required this.mediasGrid,
  });

  final _HomeMediaFiltersTabBar mediaFiltersTabBar;
  final _HomeMediasGrid mediasGrid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text("Serendy"),
            pinned: true,
            floating: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kTextTabBarHeight),
              child: mediaFiltersTabBar,
            ),
            surfaceTintColor: context.colorScheme.surface,
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
