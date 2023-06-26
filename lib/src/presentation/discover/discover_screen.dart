import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/presentation/@widgets/widgets.dart';

import 'controller/discover_controller.dart';

part 'widgets/_collections_grid.dart';
part 'widgets/_search_bar.dart';

class DiscoverScreen extends StatelessWidget {
  static const String routeName = 'discover';
  static const String routeLocation = '/$routeName';
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _DiscoverTemplate(
      searchBar: _DiscoverSearchBar(),
      collectionsGrid: _DiscoverCollectionsGrid(),
    );
  }
}

class _DiscoverTemplate extends StatelessWidget {
  const _DiscoverTemplate({
    required this.searchBar,
    required this.collectionsGrid,
  });

  final _DiscoverSearchBar searchBar;
  final _DiscoverCollectionsGrid collectionsGrid;

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
            collectionsGrid,
          ]),
        ),
      ),
    );
  }
}
