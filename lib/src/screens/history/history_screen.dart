import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/widgets/widgets.dart';
import 'package:serendy/src/sheets/sheets.dart';

import 'controller/history_controller.dart';

part 'widgets/_history_cards_list.dart';
part 'widgets/_history_titles.dart';

class HistoryScreen extends ConsumerWidget {
  static const String routeName = 'history';
  static const String routeLocation = routeName;
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final evaluationsValue = ref.watch(historyControllerProvider);

    return evaluationsValue.when(
      skipLoadingOnReload: true,
      data: (state) => _HistoryTemplate(
        titles: _HistoryTitles(evaluationsCount: state.evaluations.length),
        historiesList: _HistoryCardsList(evaluations: state.evaluations),
      ),
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (err, stack) => Scaffold(
        body: Center(child: Text(err.toString())),
      ),
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
