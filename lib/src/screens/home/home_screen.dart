import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serendy/src/_mock.dart';
import 'package:serendy/src/models/models.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/widgets/media_card.dart';

part 'widgets/media_filters_tab_bar.dart';
part 'widgets/medias_grid.dart';

final tabsProvider = Provider((ref) => [
      "실시간 인기",
      "애니",
      "만화",
      "소설",
      "판타지",
      "드라마",
    ]);

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(tabsProvider);

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
