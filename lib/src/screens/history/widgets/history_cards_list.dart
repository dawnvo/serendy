part of '../history_screen.dart';

class _HistoryCardsList extends StatelessWidget {
  const _HistoryCardsList();

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: evaluationsMock.length,
      itemBuilder: (BuildContext context, int index) {
        final evaluation = evaluationsMock[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: Sizes.p16),
          child: HistoryCard(
            evaluation: evaluation,
            onTap: () => context.pushRoute(MediaRoute(id: 'mediaId')),
            onMore: () {},
          ),
        );
      },
    );
  }
}
