import 'package:serendy/src/configs/configs.dart';

class Tag extends StatelessWidget {
  const Tag(
    this.label, {
    super.key,
    this.labelColor,
  });

  final String label;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.p4,
        horizontal: Sizes.p8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kBorderRadius),
        color: context.colorScheme.surfaceVariant,
      ),
      child: Text(
        label,
        style: context.textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: labelColor,
        ),
      ),
    );
  }
}
