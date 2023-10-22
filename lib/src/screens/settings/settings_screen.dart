import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/auth/auth.dart';
import 'package:serendy/src/features/dislike/dislike.dart';
import 'package:serendy/src/widgets/widgets.dart';

import 'controller/settings_controller.dart';

part 'widgets/_clear_cache_tile.dart';
part 'widgets/_clear_dislikes_tile.dart';
part 'widgets/_report_tile.dart';
part 'widgets/_policy_tile.dart';

class SettingsScreen extends ConsumerWidget {
  static const String routeName = 'settings';
  static const String routeLocation = routeName;
  const SettingsScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _SettingsTemplate(options: [
      //account
      _SettingsListGroup([
        _SettingsListTile(
          onTap: () => context.pushNamed(AppRoutes.account),
          icon: RemixIcon.account_circle_line,
          title: "내 계정",
        ),
      ]),
      //clear
      const _SettingsListGroup([
        _ClearCacheTile(),
        _ClearDislikesTile(),
      ]),
      //report
      const _SettingsListGroup([
        _RequestUpdateTile(),
        _ReportProblemTile(),
      ]),
      //policy
      const _SettingsListGroup([
        _PrivacyPolicyTile(),
        _TermsOfServiceTile(),
      ]),
      //sign-out
      _SettingsListGroup([
        _SettingsListTile(
          onTap: () => ref.read(signOutWithGoogleProvider),
          icon: RemixIcon.logout_box_r_line,
          title: "로그아웃",
        ),
      ]),
    ]);
  }
}

//Template
class _SettingsTemplate extends StatelessWidget {
  const _SettingsTemplate({required this.options});

  final List<Widget> options;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: context.colorScheme.background,
            title: const Text("설정"),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: kContentPadding,
            ),
            sliver: SliverList.list(children: options),
          ),
        ],
      ),
    );
  }
}

//ListGroup
class _SettingsListGroup extends StatelessWidget {
  const _SettingsListGroup(this.children);
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: kContentPadding),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceVariant,
        borderRadius: const BorderRadius.all(
          Radius.circular(kBorderRadius),
        ),
      ),
      child: Column(children: children),
    );
  }
}

//ListTile
class _SettingsListTile extends StatelessWidget {
  const _SettingsListTile({
    required this.onTap,
    required this.icon,
    required this.title,
    this.subtitle,
  });

  final VoidCallback onTap;
  final IconData icon;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //style
      visualDensity: VisualDensity.compact,
      titleAlignment: ListTileTitleAlignment.titleHeight,
      subtitleTextStyle: context.textTheme.bodyMedium?.copyWith(
        color: context.colorScheme.outline,
      ),

      //content
      onTap: onTap,
      leading: Icon(icon),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
    );
  }
}
