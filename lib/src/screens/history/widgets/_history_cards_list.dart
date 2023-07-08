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
          child: _buildHistoryCard(context, evaluation),
        );
      },
    );
  }

  Widget _buildHistoryCard(BuildContext context, Evaluation evaluation) {
    return HistoryCard(
      onTap: () => context.pushNamed(
        AppRoutes.media,
        pathParameters: {'id': evaluation.media.id},
        extra: evaluation.media.convertEntity,
      ),
      onMoreTap: () => context.showCustomBottomSheet(
        (_) => _HistoryMenuSheet(evaluation),
      ),
      evaluation: evaluation,
    );
  }
}
