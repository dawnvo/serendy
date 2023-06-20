part of 'package:serendy/presentation/account/account_screen.dart';

class _AccountListTile extends StatelessWidget {
  const _AccountListTile({
    required this.label,
    required this.value,
    required this.onTap,
  });

  final String label;
  final String? value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kContentPadding,
          vertical: Sizes.p20,
        ),
        child: Row(children: [
          // Label
          Text(label, style: context.textTheme.bodyLarge),
          Gap.w16,

          // Value
          Expanded(
            child: Text(
              value ?? '',
              textAlign: TextAlign.right,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colorScheme.outline,
              ),
            ),
          ),

          // Icon
          Icon(
            RemixIcon.arrow_right_s_line,
            color: context.colorScheme.outline,
          ),
        ]),
      ),
    );
  }
}
