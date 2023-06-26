part of '../history_screen.dart';

class _HistoryCardsList extends StatelessWidget {
  const _HistoryCardsList({required this.evaluations});

  final List<Evaluation?> evaluations;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: evaluations.length,
      itemBuilder: (BuildContext context, int index) {
        final evaluation = evaluations[index]!;

        return Padding(
          padding: const EdgeInsets.only(bottom: Sizes.p16),
          child: HistoryCard(
            onTap: () => context.pushNamed(
              AppRoutes.mediaName,
              pathParameters: {'id': evaluation.media.id},
            ),
            onMoreTap: () => context.showCustomModalBottomSheet(
              (context) => HistoryMenuSheet(evaluation: evaluation),
            ),
            evaluation: evaluation,
          ),
        );
      },
    );
  }
}
