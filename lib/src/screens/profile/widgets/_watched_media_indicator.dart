part of '../profile_screen.dart';

class _ProfileWatchedMediaIndicator extends StatelessWidget {
  const _ProfileWatchedMediaIndicator({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    const total = 10;
    final color = context.colorScheme.tertiary;

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
    return Row(children: [
      // Count text
      Row(children: [
        Text(
          "$count",
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onSurface,
          ),
        ),
        Text(
          "/$total개",
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
      ]),
      const Spacer(),

      // More text
      Row(children: [
        Text(
          "자세히",
          style: context.textTheme.bodyMedium?.copyWith(
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
