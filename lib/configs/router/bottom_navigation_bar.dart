import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:go_router/go_router.dart';
import 'package:serendy/configs/configs.dart';

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kContentPadding),
        child: NavigationBar(
          destinations: const [
            NavigationDestination(
              tooltip: '',
              label: '홈',
              icon: Icon(RemixIcon.home_2_line),
              selectedIcon: Icon(RemixIcon.home_2_fill),
            ),
            NavigationDestination(
              tooltip: '',
              label: '발견',
              icon: Icon(RemixIcon.search_line),
              selectedIcon: Icon(RemixIcon.search_fill),
            ),
            NavigationDestination(
              tooltip: '',
              label: '프로필',
              icon: Icon(RemixIcon.user_line),
              selectedIcon: Icon(RemixIcon.user_fill),
            ),
          ],
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: (index) => navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          ),
        ),
      ),
    );
  }
}
