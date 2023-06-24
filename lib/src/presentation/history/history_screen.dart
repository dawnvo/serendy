import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/core/_mock.dart';
import 'package:serendy/src/presentation/@sheets/sheets.dart';
import 'package:serendy/src/presentation/@widgets/widgets.dart';

part 'widgets/_history_cards_list.dart';
part 'widgets/_history_titles.dart';

class HistoryScreen extends StatelessWidget {
  static const String routeName = 'history';
  static const String routeLocation = routeName;
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HistoryTemplate(
      titles: _HistoryTitles(),
      historiesList: _HistoryCardsList(),
    );
  }
}

class _HistoryTemplate extends StatelessWidget {
  const _HistoryTemplate({
    required this.titles,
    required this.historiesList,
  });

  final _HistoryTitles titles;
  final _HistoryCardsList historiesList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        const SliverAppBar(),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: kContentPadding,
          ),
          sliver: SliverToBoxAdapter(child: titles),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: kContentPadding,
            vertical: Sizes.p24,
          ),
          sliver: historiesList,
        ),
      ]),
    );
  }
}
