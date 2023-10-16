import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/dislike/application/dislike_service.dart';
import 'package:serendy/src/widgets/widgets.dart';

part 'widgets/clear_dislikes_tile.dart';

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
          title: "내 계정",
        ),
        const _ClearDislikesTile(),
        _SettingsListTile(
          onTap: () {},
          title: "DB 수정/추가",
        ),
        _SettingsListTile(
          onTap: () {},
          title: "문제 신고",
        ),
        _SettingsListTile(
          onTap: () {},
          title: "서비스 약관",
        ),
      ],
    );
  }
}

//Template
class _SettingsTemplate extends StatelessWidget {
  const _SettingsTemplate({required this.options});

  final List<Widget> options;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("설정")),
      body: SingleChildScrollView(
        child: Column(children: options),
      ),
    );
  }
}

//ListTile
class _SettingsListTile extends StatelessWidget {
  const _SettingsListTile({
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      onTap: onTap,
      title: Text(title),
    );
  }
}
