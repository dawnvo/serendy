part of '../history_screen.dart';

class _HistoryTitles extends StatelessWidget {
  const _HistoryTitles({required this.evaluationsCount});

  final int evaluationsCount;

  @override
  Widget build(BuildContext context) {
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
          "작품 $evaluationsCount",
          style: context.textTheme.bodyLarge?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
