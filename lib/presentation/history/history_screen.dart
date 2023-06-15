import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:serendy/_mock.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/presentation/@sheets/sheets.dart';
import 'package:serendy/presentation/@widgets/widgets.dart';

part 'widgets/_history_titles.dart';
part 'widgets/_history_cards_list.dart';

@RoutePage()
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HistoryView();
  }
}

class _HistoryView extends StatelessWidget {
  const _HistoryView();

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
    return Material(
      child: CustomScrollView(slivers: [
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
