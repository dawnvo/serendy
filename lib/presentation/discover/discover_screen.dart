import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/features/collection/application/collection_bloc.dart';
import 'package:serendy/features/collection/data/collection_repository_fake.dart';
import 'package:serendy/features/collection/domain/collection.dart';
import 'package:serendy/presentation/@widgets/widgets.dart';

part 'widgets/_collections_grid.dart';
part 'widgets/_search_bar.dart';

@RoutePage()
class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CollectionBloc(
        collectionRepository: CollectionRepositoryFake(),
      )..add(const CollectionsListFetched()),
      child: const _DiscoverView(),
    );
  }
}

class _DiscoverView extends StatelessWidget {
  const _DiscoverView();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CollectionBloc>().state;

    return switch (state) {
      CollectionsListLoaded() => _DiscoverTemplate(
          searchBar: const _DiscoverSearchBar(),
          collectionsGrid: _DiscoverCollectionsGrid(
            collections: state.collections,
          ),
        ),
      CollectionLoading() => const Center(child: CircularProgressIndicator()),
      CollectionError() => Text(state.message),
      CollectionLoaded() => const SizedBox(),
    };
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
