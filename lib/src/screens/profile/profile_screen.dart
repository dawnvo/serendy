import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/core/enums.dart';
import 'package:serendy/src/features/theme/theme.dart' hide ThemeItem;
import 'package:serendy/src/features/user/user.dart';
import 'package:serendy/src/widgets/widgets.dart';
import 'package:serendy/src/screens/screens.dart';

import 'controller/profile_controller.dart';

part 'widgets/_my_themes_list.dart';
part 'widgets/_profile_card.dart';

class ProfileScreen extends ConsumerWidget {
  static const String routeName = 'profile';
  static const String routeLocation = '/$routeName';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileValue = ref.watch(profileControllerProvider);

    return profileValue.when(
      skipLoadingOnReload: true,
      data: (state) => _ProfileTemplate(
        actions: [
          IconButton(
            icon: const Icon(RemixIcon.menu_3_line),
            onPressed: () => context.pushNamed(AppRoutes.settings),
          ),
        ],
        profileCard: _ProfileCard(
          user: state.user,
          evaluationCount: state.evaluationsCount,
        ),
        themesList: _ProfileMyThemesList(
          themes: state.myThemes,
        ),
      ),
      loading: () => const _Placeholder$ProfileScreen(),
      error: (err, stack) => Scaffold(
        body: Center(child: Text(err.toString())),
      ),
    );
  }
}

class _ProfileTemplate extends StatelessWidget {
  const _ProfileTemplate({
    required this.actions,
    required this.profileCard,
    required this.themesList,
  });

  final List<IconButton> actions;
  final _ProfileCard profileCard;
  final _ProfileMyThemesList themesList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          title: const Text("내 라이브러리"),
          actions: actions,
        ),
        SliverPadding(
          padding: const EdgeInsets.only(bottom: kContentPadding),
          sliver: SliverToBoxAdapter(child: profileCard),
        ),
        themesList,
      ]),
    );
  }
}

//Placeholder
class _Placeholder$ProfileScreen extends StatelessWidget {
  const _Placeholder$ProfileScreen();

  @override
  Widget build(BuildContext context) {
    final color = context.colorScheme.surfaceVariant;
    //widgets
    final profileCard = Container(
      color: color,
      height: 160,
    );
    final themesList = SliverMyThemesList(
      childCount: 4,
      showCreateTile: false,
      addAutomaticKeepAlives: false,
      builder: (context, index) => const Placeholder$ThemeItem(),
    );
    //template
    return Scaffold(
      body: CustomScrollView(slivers: [
        const SliverAppBar(title: Text("내 라이브러리")),
        SliverPadding(
          padding: const EdgeInsets.only(bottom: kContentPadding),
          sliver: SliverToBoxAdapter(
            child: profileCard,
          ),
        ),
        themesList,
      ]),
    );
  }
}
