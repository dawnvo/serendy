import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/core/_mock.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/sheets/sheets.dart';
import 'package:serendy/src/widgets/widgets.dart';

part 'widgets/_evaluation_cards_list.dart';
part 'widgets/_history_titles.dart';

class HistoryScreen extends StatelessWidget {
  static const String routeName = 'history';
  static const String routeLocation = routeName;
  const HistoryScreen();

  @override
  Widget build(BuildContext context) {
    final evaluations = List.filled(12, evaluationMock);

    return _HistoryTemplate(
      titles: const _HistoryTitles(),
      evaluationsList: _HistoryEvaluationCardsList(
        evaluations: evaluations,
      ),
    );
  }
}

//Template
class _HistoryTemplate extends StatelessWidget {
  const _HistoryTemplate({
    required this.titles,
    required this.evaluationsList,
  });

  final _HistoryTitles titles;
  final _HistoryEvaluationCardsList evaluationsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        const SliverAppBar(pinned: true),
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
          sliver: evaluationsList,
        ),
      ]),
    );
  }
}
