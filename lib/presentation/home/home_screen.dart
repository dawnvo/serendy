import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:serendy/_mock.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/features/media/domain/media.dart';
import 'package:serendy/presentation/@widgets/widgets.dart';

part 'widgets/_media_filters_tab_bar.dart';
part 'widgets/_medias_grid.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final filters = [
      "실시간 인기",
      "애니",
      "만화",
      "소설",
      "판타지",
      "드라마",
    ];

    return _HomeTemplate(
      mediaFiltersTabBar: _HomeMediaFiltersTabBar(
        filters: filters,
        onSelect: (item) => print(item),
      ),
      mediasGrid: _HomeMediasGrid(
        medias: collectionsMock[0].items.map((e) => e!.media).toList(),
      ),
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
    return CustomScrollView(
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
    );
  }
}
