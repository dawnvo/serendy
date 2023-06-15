import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:serendy/configs/configs.dart';

part 'widgets/_settings_list_tile.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SettingsView();
  }
}

class _SettingsView extends StatelessWidget {
  const _SettingsView();

  @override
  Widget build(BuildContext context) {
    return _SettingsTemplate(
      options: [
        _SettingsListTile(
          onTap: () => context.pushRoute(const AccountRoute()),
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
