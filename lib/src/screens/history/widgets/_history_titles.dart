part of '../history_screen.dart';

class _HistoryTitles extends ConsumerWidget {
  const _HistoryTitles();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final evaluationsCountValue = ref.watch(countEvaluationsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "감상한",
          style: context.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        Gap.h4,
        Text(
          evaluationsCountValue.maybeWhen(
            data: (count) => "작품 $count",
            orElse: () => "작품 0",
          ),
          style: context.textTheme.bodyLarge?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
