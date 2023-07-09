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
    final rank = findRankByCount(evaluationCount);

    return GestureDetector(
      onTap: () => context.pushNamed(
        AppRoutes.profileCard,
        extra: evaluationCount,
      ),
      child: ProfileCardContainer(
        color: rank.color.back,
        height: 160,
        child: Padding(
          padding: const EdgeInsets.all(kContentPadding),
          child: _buildContent(context, rank: rank),
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context, {
    required Rank rank,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        __ProfileCardTitles(user: user, rank: rank),
        __WatchedMediaIndicator(
          onTap: () => context.pushNamed(AppRoutes.history),
          color: rank.color.fore,
          min: rank.range.min,
          max: rank.range.max,
          count: evaluationCount,
        ),
      ],
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          user.name,
          maxLines: 1,
          overflow: TextOverflow.clip,
          style: context.textTheme.headlineMedium?.copyWith(
            height: 1.8,
          ),
        ),
        Text("${rank.label} 등급"),
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
    required this.onTap,
  });

  final int min;
  final int max;
  final int count;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
