import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/features/collection/domain/collection.dart';
import 'package:serendy/presentation/@widgets/widgets.dart';
import 'package:serendy/presentation/discover/bloc/discover_bloc.dart';

part 'widgets/_collections_grid.dart';
part 'widgets/_search_bar.dart';

@RoutePage()
class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DiscoverBloc(collectionRepository: sl())
        ..add(const Discover$CollectionsListFetched()),
      child: const _DiscoverView(),
    );
  }
}

class _DiscoverView extends StatelessWidget {
  const _DiscoverView();

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
    return Scaffold(
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
    );
  }
}
