import 'package:flutter/cupertino.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/widgets/widgets.dart';

import 'controller/account_controller.dart';

part 'widgets/_delete_account_tile.dart';
part 'widgets/_email_tile.dart';
part 'widgets/_user_name_tile.dart';

class AccountScreen extends ConsumerWidget {
  static const String routeName = 'account';
  static const String routeLocation = routeName;
  const AccountScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountValue = ref.watch(accountControllerProvider);

    ref.listen(accountControllerProvider, (previous, next) {
      //success
      if (previous != next && next.requireValue.isSubmitted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("프로필을 수정했어요."),
        ));
      }
      //failure
      else if (next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(next.error.toString()),
        ));
      }
    });

    return accountValue.when(
      data: (state) => _AccountTemplate(options: [
        _AccountUserNameTile(username: state.name),
        _AccountEmailTile(email: state.email),
        const _AccountDeleteTile(),
        // const _AccountGenderTile(gender: '남자'),
        // const _AccountBirthTile(birth: 2000),
      ]),
      loading: () => Scaffold(
        appBar: AppBar(),
        body: const Center(child: LoadingIndicator()),
      ),
      error: (err, stack) => ErrorTemplate(
        message: err.toString(),
        backButton: true,
      ),
    );
  }
}

//Template
class _AccountTemplate extends StatelessWidget {
  const _AccountTemplate({
    required this.options,
  });

  final List<Widget> options;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: context.colorScheme.background,
          title: const Text("내 계정"),
        ),
        SliverList.list(children: options),
      ]),
    );
  }
}

//ListTile
class _AccountListTile extends StatelessWidget {
  const _AccountListTile({
    required this.onTap,
    required this.title,
    this.subtitle,
    this.isDestructiveAction = false,
  });

  final VoidCallback onTap;
  final String title;
  final String? subtitle;
  final bool isDestructiveAction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //style
      visualDensity: VisualDensity.compact,
      titleTextStyle: context.textTheme.bodyLarge?.copyWith(
        color: !isDestructiveAction //
            ? context.colorScheme.onSurface
            : CupertinoColors.systemRed,
      ),
      subtitleTextStyle: context.textTheme.bodyLarge?.copyWith(
        color: context.colorScheme.outline,
      ),

      //content
      onTap: onTap,
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
    );
  }
}
