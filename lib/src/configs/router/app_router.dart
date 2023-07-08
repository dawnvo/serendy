import 'package:animations/animations.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/configs/router/bottom_navigation_bar.dart';
import 'package:serendy/src/features/auth/auth.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/screens/screens.dart';

import 'go_router_refresh_stream.dart';

part 'app_routes.dart';

// Navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>();
final _shellNavigatorDiscoverKey = GlobalKey<NavigatorState>();
final _shellNavigatorProfileKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  final authService = ref.watch(authServiceProvider);

  // 🔒 로그인이 필요한 화면
  final privateLocation = [
    AppRoutes._homeLocation,
    AppRoutes._profileLocation,
    AppRoutes._accountLocation,
  ];

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    refreshListenable: GoRouterRefreshStream(authService.authStateChanges),
    redirect: (context, state) {
      final isLoggedIn = authService.currentUserId != null;

      // 로그인에 성공한 경우
      if (isLoggedIn) {
        if (state.location == AppRoutes._signInLocation) {
          return AppRoutes._homeLocation;
        }
      }
      // 로그인에 실패한 경우
      else {
        if (privateLocation.contains(state.location)) {
          return AppRoutes._signInLocation;
        }
      }

      return null;
    },
    initialLocation: AppRoutes._homeLocation,
    routes: [
      GoRoute(
        name: AppRoutes.signIn,
        path: AppRoutes._signInLocation,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        name: AppRoutes.search,
        path: AppRoutes._searchLocation,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        name: AppRoutes.admin,
        path: AppRoutes._adminLocation,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const AdminScreen(),
      ),

      /// MEDIA
      GoRoute(
        name: AppRoutes.media,
        path: AppRoutes._mediaLocation,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => MediaScreen(
          id: state.pathParameters['id']!,
          media: state.extra as Media?,
        ),
      ),
      GoRoute(
        name: AppRoutes.evaluateMedia,
        path: AppRoutes._evaluateMediaLocation,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => ModalPage(
          child: EvaluateMediaScreen(
            media: state.extra as Media,
          ),
        ),
      ),

      /// THEME
      GoRoute(
        name: AppRoutes.theme,
        path: AppRoutes._themeLocation,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => ThemeScreen(
          id: state.pathParameters['id']!,
          theme: state.extra as Theme?,
        ),
      ),
      GoRoute(
        name: AppRoutes.createTheme,
        path: AppRoutes._createThemeLocation,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => ModalPage(
          child: const CreateThemeScreen(),
        ),
      ),
      GoRoute(
        name: AppRoutes.editTheme,
        path: AppRoutes._editThemeLocation,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => ModalPage(
          child: EditThemeScreen(theme: state.extra as Theme),
        ),
      ),

      /// SETTINGS
      GoRoute(
        name: AppRoutes.settings,
        path: AppRoutes._settingsLocation,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const SettingsScreen(),
        routes: [
          GoRoute(
            name: AppRoutes.account,
            path: AppRoutes._accountLocation,
            parentNavigatorKey: _rootNavigatorKey,
            builder: (context, state) => const AccountScreen(),
          )
        ],
      ),

      /// SHELL NAVIGATOR
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavigationBar(
            navigationShell: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHomeKey,
            routes: [
              GoRoute(
                name: AppRoutes.home,
                path: AppRoutes._homeLocation,
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorDiscoverKey,
            routes: [
              GoRoute(
                name: AppRoutes.discover,
                path: AppRoutes._discoverLocation,
                builder: (context, state) => const DiscoverScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorProfileKey,
            routes: [
              GoRoute(
                name: AppRoutes.profile,
                path: AppRoutes._profileLocation,
                builder: (context, state) => const ProfileScreen(),
                routes: [
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    name: AppRoutes.history,
                    path: AppRoutes._historyLocation,
                    builder: (context, state) => const HistoryScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
});

class ModalPage extends CustomTransitionPage {
  ModalPage({required super.child, super.key})
      : super(
          fullscreenDialog: true,
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.vertical,
              child: child,
            );
          },
        );
}
