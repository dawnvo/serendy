import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/sheets/menu_items/menu_items.dart';
import 'package:serendy/src/widgets/widgets.dart';

part 'sheets/_history_menu_sheet.dart';
part 'widgets/_history_cards_list.dart';
part 'widgets/_history_titles.dart';

class HistoryScreen extends ConsumerWidget {
  static const String routeName = 'history';
  static const String routeLocation = routeName;
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final evaluationsValue = ref.watch(watchMyEvaluationsListProvider);

    return evaluationsValue.when(
      skipLoadingOnReload: true,
      data: (evaluations) => _HistoryTemplate(
        titles: _HistoryTitles(evaluationsCount: evaluations.length),
        historiesList: _HistoryCardsList(evaluations: evaluations),
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
