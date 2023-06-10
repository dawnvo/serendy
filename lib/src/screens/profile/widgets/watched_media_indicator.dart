part of '../profile_screen.dart';

class _WatchedMediaIndicator extends StatelessWidget {
  const _WatchedMediaIndicator({
    required this.total,
    required this.count,
    this.onTap,
  }) : assert(count < total);

  final int total;
  final int count;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    const indicatorColor = AppColors.brand;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque, // 빈 영역 터치
      child: Column(children: [
        MultiLineProgressIndicator([
          ProgressBar(value: count / total, color: indicatorColor),
        ]),
        Gap.h12,
        _buildBottom(context),
      ]),
    );
  }

  Widget _buildBottom(BuildContext context) {
    return Row(children: [
      // Count text
      Row(children: [
        Text("$count"),
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
          color: context.colorScheme.outlineVariant,
        ),
      ]),
    ]);
  }
}
