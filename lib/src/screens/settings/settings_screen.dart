import 'package:serendy/src/configs/configs.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = 'settings';
  static const String routeLocation = '/$routeName';
  const SettingsScreen();

  @override
  Widget build(BuildContext context) {
    return _SettingsTemplate(
      options: [
        _SettingsListTile(
          onTap: () => context.pushNamed(AppRoutes.account),
          icon: RemixIcon.user_line,
          title: "내 계정",
        ),
        _SettingsListTile(
          onTap: () {},
          icon: RemixIcon.eye_off_line,
          title: "관심없음",
        ),
        _SettingsListTile(
          onTap: () {},
          icon: RemixIcon.notification_3_line,
          title: "알림",
        ),
        _SettingsListTile(
          onTap: () {},
          icon: RemixIcon.error_warning_line,
          title: "문의하기",
        ),
        _SettingsListTile(
          onTap: () {},
          icon: RemixIcon.file_list_2_line,
          title: "서비스 약관",
        ),
      ],
    );
  }
}

//Template
class _SettingsTemplate extends StatelessWidget {
  const _SettingsTemplate({required this.options});

  final List<_SettingsListTile> options;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("설정")),
      body: Column(children: options),
    );
  }
}

//ListTile
class _SettingsListTile extends StatelessWidget {
  const _SettingsListTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

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
