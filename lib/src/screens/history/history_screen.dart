import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:serendy/src/_mock.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/screens/screens.dart';
import 'package:serendy/src/widgets/history_card.dart';

part 'widgets/history_titles.dart';
part 'widgets/history_cards_list.dart';

@RoutePage()
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HistoryTemplate(
      titles: _HistoryTitles(
        title: "감상한",
        subtitle: "작품 12",
      ),
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
