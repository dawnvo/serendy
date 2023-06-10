import 'package:auto_route/auto_route.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:serendy/src/configs/constants/size_constant.dart';
import 'package:serendy/src/configs/router/app_router.dart';
import 'package:serendy/src/configs/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        final themeData = AppThemeData.fillWith(
          light: lightDynamic,
          dark: darkDynamic,
        );

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,

          title: "Serendy",
          routerConfig: appRouter.config(),

          // themes
          themeMode: ThemeMode.dark,
          theme: themeData.day,
          darkTheme: themeData.night,

          // 글자 크기 설정을 제한해요.
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          ),
        );
      },
    );
  }
}

/// [AppScreen]
///
/// * Root level에서 네비게이션을 도와요.
@RoutePage()
class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  final destinations = const [
    RouteDestination(
      route: HomeRoute(),
      label: '홈',
      icon: RemixIcon.home_2_line,
      selectedIcon: RemixIcon.home_2_fill,
    ),
    RouteDestination(
      route: DiscoverRoute(),
      label: '발견',
      icon: RemixIcon.search_line,
      selectedIcon: RemixIcon.search_fill,
    ),
    RouteDestination(
      route: ProfileRoute(),
      label: '내정보',
      icon: RemixIcon.user_line,
      selectedIcon: RemixIcon.user_fill,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: destinations.map((d) => d.route).toList(),
      bottomNavigationBuilder: (context, tabsRouter) {
        return _BottomNavigationBar(
          destinations: destinations,
          selectedIndex: tabsRouter.activeIndex,
          onDestinationSelected: tabsRouter.setActiveIndex,
        );
      },
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({
    required this.destinations,
    required this.selectedIndex,
    this.onDestinationSelected,
  });

  final List<RouteDestination> destinations;
  final int selectedIndex;
  final void Function(int)? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kContentPadding),
      child: NavigationBar(
        destinations: [
          for (final d in destinations)
            NavigationDestination(
              tooltip: '',
              label: d.label,
              icon: Icon(d.icon),
              selectedIcon: Icon(d.selectedIcon),
            ),
        ],
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}

final class RouteDestination {
  final PageRouteInfo route;
  final String label;
  final IconData icon;
  final IconData selectedIcon;

  const RouteDestination({
    required this.route,
    required this.label,
    required this.icon,
    required this.selectedIcon,
  });
}
