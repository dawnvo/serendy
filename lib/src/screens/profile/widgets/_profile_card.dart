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
    const color = Color(0xFF0F042F);

    return ProfileCardContainer(
      color: color,
      height: 160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          __ProfileCardTitles(username: user.name),
          __WatchedMediaIndicator(count: evaluationCount),
        ],
      ),
    );
  }
}

class __ProfileCardTitles extends StatelessWidget {
  const __ProfileCardTitles({required this.username});

  final String username;

  @override
  Widget build(BuildContext context) {
    const color = Color(0xCCFFFFFF); // opacity 80%
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap.h8,
        Text(
          username,
          maxLines: 1,
          overflow: TextOverflow.clip,
          style: context.textTheme.headlineLarge?.copyWith(
            color: color,
          ),
        ),
        Text(
          "아이언 등급",
          style: context.textTheme.bodyMedium?.copyWith(
            color: color,
          ),
        ),
      ],
    );
  }
}

class __WatchedMediaIndicator extends StatelessWidget {
  const __WatchedMediaIndicator({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    const total = 10;
    final color = context.colorScheme.secondary;

    return GestureDetector(
      onTap: () => context.pushNamed(AppRoutes.historyName),
      behavior: HitTestBehavior.opaque,
      child: Column(children: [
        MultiLineProgressIndicator([
          ProgressBar(
            value: count / total,
            color: color,
          ),
        ]),
        Gap.h12,
        _buildBottom(
          context,
          total: total,
          count: count,
        ),
      ]),
    );
  }

  Widget _buildBottom(
    BuildContext context, {
    required int total,
    required int count,
  }) {
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
        Text(
          "/$total개",
          style: textStyle?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
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
