import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/theme/theme.dart' hide ThemeItem;
import 'package:serendy/src/widgets/widgets.dart';

import 'controller/profile_controller.dart';

part 'widgets/_my_themes_list.dart';
part 'widgets/_watched_media_indicator.dart';

class ProfileScreen extends ConsumerWidget {
  static const String routeName = 'profile';
  static const String routeLocation = '/$routeName';
  const ProfileScreen();

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
        indicator: _WatchedMediaIndicator(count: state.evaluationsCount),
        themesList: _ProfileMyThemesList(themes: state.myThemes),
      ),
      loading: () => const _Placeholder$ProfileScreen(),
      error: (err, stack) => const Scaffold(
        body: Center(child: Text("내 라이브러리를 불러오지 못했어요.")),
      ),
    );
  }
}

//Template
class _ProfileTemplate extends StatelessWidget {
  const _ProfileTemplate({
    required this.actions,
    required this.indicator,
    required this.themesList,
  });

  final List<IconButton> actions;
  final _WatchedMediaIndicator indicator;
  final _ProfileMyThemesList themesList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: context.colorScheme.background,
          title: const Text("내 라이브러리"),
          actions: actions,
        ),
        SliverPadding(
          padding: const EdgeInsets.all(kContentPadding),
          sliver: SliverToBoxAdapter(child: indicator),
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
    final indicator = Container(
      color: color,
      height: 40,
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
        const SliverAppBar(
          title: Text("내 라이브러리"),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(kContentPadding),
          sliver: SliverToBoxAdapter(child: indicator),
        ),
        themesList,
      ]),
    );
  }
}
