import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/core/locator.dart';
import 'package:serendy/features/media/media.dart';
import 'package:serendy/presentation/@sheets/media_menu_sheet.dart';
import 'package:serendy/presentation/@widgets/widgets.dart';
import 'package:serendy/presentation/home/bloc/home_bloc.dart';

part 'widgets/_media_filters_tab_bar.dart';
part 'widgets/_medias_grid.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';
  static const String routeLocation = '/';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        mediaService: sl(),
      )..add(const Home$MediasListFetched()),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeBloc>().state;

    final filters = [
      "실시간 인기",
      "애니",
      "만화",
      "소설",
      "판타지",
      "드라마",
    ];

    return switch (state) {
      HomeLoaded() => _HomeTemplate(
          mediaFiltersTabBar: _HomeMediaFiltersTabBar(
            filters: filters,
            onSelect: (item) {},
          ),
          mediasGrid: _HomeMediasGrid(medias: state.medias),
        ),
      HomeInitial() => const SizedBox(),
      HomeLoading() => const SizedBox(),
      HomeError() => const SizedBox(),
    };
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
