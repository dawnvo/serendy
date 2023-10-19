import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/theme/theme.dart' hide ThemeItem;
import 'package:serendy/src/widgets/widgets.dart';

import '../profile_card/profile_card_modal.dart';
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
        indicator: _WatchedMediaIndicator(count: state.evaluationsCount),
        themesList: _ProfileMyThemesList(themes: state.themes),
      ),
      loading: () => const _Placeholder$ProfileScreen(),
      error: (err, stack) => const ErrorTemplate(
        message: "라이브러리를 불러오지 못했어요.",
      ),
    );
  }
}

//template
class _ProfileTemplate extends StatelessWidget {
  const _ProfileTemplate({
    required this.indicator,
    required this.themesList,
  });

  final _WatchedMediaIndicator indicator;
  final _ProfileMyThemesList themesList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: context.colorScheme.surface,
          surfaceTintColor: Colors.transparent,
          toolbarHeight: kTextTabBarHeight,
          pinned: true,

          //title
          title: const Text("내 라이브러리"),
          actions: [
            IconButton(
              icon: const Icon(RemixIcon.menu_3_line),
              onPressed: () => context.pushNamed(AppRoutes.settings),
            ),
          ],

          //indicator
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(
              // sum: indicator + text + padding
              10 + 20 + kContentPadding * 3,
            ),
            child: Padding(
              padding: const EdgeInsets.all(kContentPadding),
              child: indicator,
            ),
          ),
        ),

        //list
        themesList,
      ]),
    );
  }
}

//placeholder
class _Placeholder$ProfileScreen extends StatelessWidget {
  const _Placeholder$ProfileScreen();

  @override
  Widget build(BuildContext context) {
    final color = context.colorScheme.surfaceVariant;
    final decoration = BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(Sizes.p4)),
      color: color,
    );
    //widgets
    final Column indicator = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 14,
          decoration: decoration,
        ),
        Gap.h12,
        Container(
          height: 16,
          width: 80,
          decoration: decoration,
        ),
      ],
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
          toolbarHeight: kTextTabBarHeight,
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
