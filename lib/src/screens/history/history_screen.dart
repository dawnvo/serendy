import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/sheets/sheets.dart';
import 'package:serendy/src/widgets/widgets.dart';

import 'controller/history_controller.dart';

part 'widgets/_evaluation_cards_list.dart';
part 'widgets/_history_titles.dart';

class HistoryScreen extends HookConsumerWidget {
  static const String routeName = 'history';
  static const String routeLocation = routeName;
  const HistoryScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyValue = ref.watch(historyControllerProvider);
    final scrollController = useScrollController();

    // * 맨 아래로 스크롤하면 작품을 더 불러와요.
    void fetchMoreListener() {
      if (scrollController.offset >= //ReachMaxExtent
          scrollController.position.maxScrollExtent) {
        ref.read(historyControllerProvider.notifier).fetchMore();
      }
    }

    // * Infinite scroll listener
    useEffect(() {
      scrollController.addListener(fetchMoreListener);
      return () => scrollController.removeListener(fetchMoreListener);
    }, [scrollController]);

    return historyValue.when(
      skipLoadingOnReload: true,
      data: (state) => _HistoryTemplate(
        controller: scrollController,
        titles: _HistoryTitles(
          evaluationsCount: state.evaluationsCount,
        ),
        evaluationsList: _HistoryEvaluationCardsList(
          evaluations: state.evaluations,
        ),
      ),
      loading: () => Scaffold(
        appBar: AppBar(),
        body: const Center(child: LoadingIndicator()),
      ),
      error: (err, stack) => const ErrorTemplate(
        message: "기록을 불러오지 못했어요.",
        backButton: true,
      ),
    );
  }
}

//Template
class _HistoryTemplate extends StatelessWidget {
  const _HistoryTemplate({
    required this.controller,
    required this.titles,
    required this.evaluationsList,
  });

  final ScrollController controller;
  final _HistoryTitles titles;
  final _HistoryEvaluationCardsList evaluationsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: controller,
        slivers: [
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
        ],
      ),
    );
  }
}
