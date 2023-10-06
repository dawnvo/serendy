part of '../history_screen.dart';

class _HistoryEvaluationCardsList extends StatelessWidget {
  const _HistoryEvaluationCardsList({required this.evaluations});

  final List<Evaluation?> evaluations;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: evaluations.length,
      itemBuilder: (BuildContext context, int index) {
        final evaluation = evaluations[index]!;
        return Padding(
          padding: const EdgeInsets.only(bottom: Sizes.p16),
          child: _buildEvaluationCard(context, evaluation),
        );
      },
    );
  }

  Widget _buildEvaluationCard(BuildContext context, Evaluation evaluation) {
    return EvaluationCard(
      onTap: () => context.pushNamed(
        AppRoutes.media,
        pathParameters: {'id': evaluation.media.id},
        extra: evaluation.media.convertEntity,
      ),
      onMoreTap: () => EvaluationMenuSheet.show(context, evaluation),
      evaluation: evaluation,
    );
  }
}
