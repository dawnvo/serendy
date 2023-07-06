part of '../profile_screen.dart';

class _ProfileCard extends StatelessWidget {
  const _ProfileCard({
    required this.user,
    required this.evaluationCount,
  });

  final User user;
  final int evaluationCount;

  @override
  Widget build(BuildContext context) {
    final count = evaluationCount;
    final rank = Rank.values.firstWhere((_) {
      // 최대 레벨일 경우
      if (_.range.max == 0) return true;
      // 사잇값에 충족하는 경우
      return count >= _.range.min && count <= _.range.max - 1;
    });

    return ProfileCardContainer(
      color: rank.color.back,
      height: 160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          __ProfileCardTitles(user: user, rank: rank),
          __WatchedMediaIndicator(
            color: rank.color.fore,
            min: rank.range.min,
            max: rank.range.max,
            count: count,
          ),
        ],
      ),
    );
  }
}

class __ProfileCardTitles extends StatelessWidget {
  const __ProfileCardTitles({
    required this.user,
    required this.rank,
  });

  final User user;
  final Rank rank;

  @override
  Widget build(BuildContext context) {
    const color = Color(0xCCFFFFFF); // opacity 80%
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap.h8,
        Text(
          user.name,
          maxLines: 1,
          overflow: TextOverflow.clip,
          style: context.textTheme.headlineLarge?.copyWith(
            color: color,
            height: 1.5,
          ),
        ),
        Text(
          "${rank.label} 등급",
          style: context.textTheme.bodyMedium?.copyWith(
            color: color,
          ),
        ),
      ],
    );
  }
}

class __WatchedMediaIndicator extends StatelessWidget {
  const __WatchedMediaIndicator({
    required this.min,
    required this.max,
    required this.count,
    required this.color,
  });

  final int min;
  final int max;
  final int count;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(AppRoutes.historyName),
      behavior: HitTestBehavior.opaque,
      child: Column(children: [
        MultiLineProgressIndicator([
          if (max != 0)
            ProgressBar(
              value: (count - min) / (max - min),
              color: color,
            )
          else
            ProgressBar(
              value: count.toDouble(),
              color: color,
            )
        ]),
        Gap.h12,
        _buildBottom(context),
      ]),
    );
  }

  Widget _buildBottom(BuildContext context) {
    final textStyle = context.textTheme.bodyMedium;
    return Row(children: [
      // Count text
      Row(children: [
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
      ]),
      const Spacer(),

      // More text
      Row(children: [
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
      ]),
    ]);
  }
}
