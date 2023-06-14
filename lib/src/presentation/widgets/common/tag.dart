import 'package:flutter/material.dart';
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
    return Chip(
      label: Text(label),
      labelStyle: context.textTheme.labelLarge?.copyWith(
        fontWeight: FontWeight.bold,
        color: labelColor,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      side: BorderSide.none,
      padding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      backgroundColor: context.colorScheme.surfaceVariant,
    );
  }
}
