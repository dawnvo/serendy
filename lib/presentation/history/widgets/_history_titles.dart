part of 'package:serendy/presentation/history/history_screen.dart';

class _HistoryTitles extends StatelessWidget {
  const _HistoryTitles();

  @override
  Widget build(BuildContext context) {
    final evaluationsCount = context.select<HistoryBloc, int>(
      (bloc) => bloc.state.evaluations.length,
    );

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
