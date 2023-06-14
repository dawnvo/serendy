part of 'package:serendy/presentation/collection/collection_screen.dart';

class _CollectionTitles extends StatelessWidget {
  const _CollectionTitles({
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
          style: context.textTheme.headlineMedium,
        ),
        Gap.h8,
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
