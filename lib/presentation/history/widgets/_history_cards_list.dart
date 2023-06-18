part of 'package:serendy/presentation/history/history_screen.dart';

class _HistoryCardsList extends StatelessWidget {
  const _HistoryCardsList();

  @override
  Widget build(BuildContext context) {
    final evaluations = List.filled(5, evaluationMock);

    return SliverList.builder(
      itemCount: evaluations.length,
      itemBuilder: (BuildContext context, int index) {
        final evaluation = evaluations[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: Sizes.p16),
          child: HistoryCard(
            evaluation: evaluation,
            onTap: () => context.pushRoute(MediaRoute(id: evaluation.media.id)),
            onMoreTap: () => context.showCustomModalBottomSheet(
              (context) => MediaMenuSheet(media: evaluation.media),
            ),
          ),
        );
      },
    );
  }
}
