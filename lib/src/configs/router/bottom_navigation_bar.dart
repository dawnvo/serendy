import 'package:serendy/src/configs/configs.dart';

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  Future<bool> handleWillPop() async {
    final currentIndex = navigationShell.currentIndex;
    const homeIndex = 0;

    // * 홈에서 [뒤로가기] 누르면 앱을 종료해요.
    if (currentIndex == homeIndex) {
      return true;
    }
    // * 다른 화면이면 홈으로 이동해요.
    navigationShell.goBranch(homeIndex);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: handleWillPop,
      child: Scaffold(
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
      ),
    );
  }
}
