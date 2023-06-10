import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:serendy/src/_mock.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/models/models.dart';
import 'package:serendy/src/widgets/collection_card.dart';

part 'widgets/collections_grid.dart';
part 'widgets/search_bar.dart';

@RoutePage()
class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _DiscoverTemplate(
      searchBar: const _DiscoverSearchBar(),
      collectionsGrid: _DiscoverCollectionsGrid(collectionsMock),
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
      child: Padding(
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
    );
  }
}
