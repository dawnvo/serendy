part of '../library_screen.dart';

class _LibraryWatchedIndicator extends StatelessWidget {
  const _LibraryWatchedIndicator({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final rank = findRankByCount(count);
    final min = rank.range.min;
    final max = rank.range.max;

    return GestureDetector(
      onTap: () => ProfileCardModal.show(context, count),
      behavior: HitTestBehavior.opaque,
      child: Column(children: [
        MultiLineProgressIndicator([
          // * 최대 레벨이 아닐 경우 수치를 계산해요.
          if (max != 0)
            ProgressBar(
              value: (count - min) / (max - min),
              color: rank.color,
            )
          // * 최대 레벨일 경우 한계를 없애요.
          else
            ProgressBar(
              value: count.toDouble(),
              color: rank.color,
            )
        ]),
        Gap.h12,
        Row(children: [
          _buildCountText(context, max),
          const Spacer(),
          _buildMoreText(context),
        ])
      ]),
    );
  }

  //count-text
  Widget _buildCountText(BuildContext context, int max) {
    final textStyle = context.textTheme.bodyMedium;
    return Row(children: [
      Text(
        "$count",
        style: textStyle?.copyWith(
          color: context.colorScheme.onSurface,
        ),
      ),
      if (max != 0)
        Text(
          "/$max개",
          style: textStyle?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        )
      else
        Text(
          "/max",
          style: textStyle?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        )
    ]);
  }

  //more-text
  Widget _buildMoreText(BuildContext context) {
    final textStyle = context.textTheme.bodyMedium;
    return Row(children: [
      Text(
        "자세히",
        style: textStyle?.copyWith(
          color: context.colorScheme.onSurfaceVariant,
        ),
      ),
      Icon(
        RemixIcon.arrow_right_s_line,
        size: Sizes.p20,
        color: context.colorScheme.onSurfaceVariant,
      ),
    ]);
  }
}
