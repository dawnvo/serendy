part of '../settings_screen.dart';

class _SettingsListTile extends StatelessWidget {
  const _SettingsListTile({
    required this.icon,
    required this.title,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      iconColor: context.colorScheme.outline,
      leading: Icon(icon),
      title: Text(title),
    );
  }
}
