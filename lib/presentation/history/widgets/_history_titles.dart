part of 'package:serendy/presentation/history/history_screen.dart';

class _HistoryTitles extends StatelessWidget {
  const _HistoryTitles({
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        Gap.h4,
        if (subtitle != null)
          Text(
            subtitle!,
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
      ],
    );
  }
}
