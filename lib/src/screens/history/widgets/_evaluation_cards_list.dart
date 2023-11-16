part of '../history_screen.dart';

class _HistoryEvaluationCardsList extends StatelessWidget {
  const _HistoryEvaluationCardsList({required this.evaluations});

  final List<Evaluation?> evaluations;

  static const _aspectRatio = 1 / 1;
  static const _spacing = 3.0;

  @override
  Widget build(BuildContext context) {
    final columns = getValueForScreenType<int>(
      context: context,
      mobile: 3,
      tablet: 5,
    );

    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        mainAxisSpacing: _spacing,
        crossAxisSpacing: _spacing,
        childAspectRatio: _aspectRatio,
      ),
      itemCount: evaluations.length,
      itemBuilder: (BuildContext context, int index) {
        final evaluation = evaluations[index]!;
        return __EvaluationTile(evaluation: evaluation);
      },
    );
  }
}

class __EvaluationTile extends StatelessWidget {
  const __EvaluationTile({required this.evaluation});
  final Evaluation evaluation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        AppRoutes.media,
        pathParameters: {'id': evaluation.media.id},
        extra: evaluation.media.convertEntity,
      ),
      onLongPress: () => EvaluationMenuSheet.show(
        context,
        evaluation,
      ),
      child: GridTile(
        child: Stack(children: [
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: evaluation.media.image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: Sizes.p4,
            right: Sizes.p4,
            child: SvgPicture.asset(
              evaluation.emotion.filePath,
              width: Sizes.p16,
              height: Sizes.p16,
            ),
          ),
        ]),
      ),
    );
  }
}
