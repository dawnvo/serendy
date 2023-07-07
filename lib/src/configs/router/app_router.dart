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
    AppRoutes.homeLocation,
    AppRoutes.profileLocation,
    AppRoutes.accountLocation,
  ];

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    refreshListenable: GoRouterRefreshStream(authService.authStateChanges),
    redirect: (context, state) {
      final isLoggedIn = authService.currentUserId != null;

      // 로그인에 성공한 경우
      if (isLoggedIn) {
        if (state.location == AppRoutes.signInLocation) {
          return AppRoutes.homeLocation;
        }
      }
      // 로그인에 실패한 경우
      else {
        if (privateLocation.contains(state.location)) {
          return AppRoutes.signInLocation;
        }
      }

      return null;
    },
    initialLocation: AppRoutes.homeLocation,
    routes: [
      GoRoute(
        name: AppRoutes.signInName,
        path: AppRoutes.signInLocation,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        name: AppRoutes.searchName,
        path: AppRoutes.searchLocation,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        name: AppRoutes.adminName,
        path: AppRoutes.adminLocation,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const AdminScreen(),
      ),

      /// MEDIA
      GoRoute(
        name: AppRoutes.mediaName,
        path: AppRoutes.mediaLocation,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => MediaScreen(
          id: state.pathParameters['id']!,
        ),
      ),
      GoRoute(
        name: AppRoutes.evaluateMediaName,
        path: AppRoutes.evaluateMediaLocation,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => ModalPage(
          child: EvaluateMediaScreen(
            media: state.extra as Media,
          ),
        ),
      ),

      /// THEME
      GoRoute(
        name: AppRoutes.themeName,
        path: AppRoutes.themeLocation,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => ThemeScreen(
          id: state.pathParameters['id']!,
        ),
      ),
      GoRoute(
        name: AppRoutes.createThemeName,
        path: AppRoutes.createThemeLocation,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => ModalPage(
          child: const CreateThemeScreen(),
        ),
      ),
      GoRoute(
        name: AppRoutes.editThemeName,
        path: AppRoutes.editThemeLocation,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => ModalPage(
          child: EditThemeScreen(theme: state.extra as Theme),
        ),
      ),

      /// SETTINGS
      GoRoute(
        name: AppRoutes.settingsName,
        path: AppRoutes.settingsLocation,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const SettingsScreen(),
        routes: [
          GoRoute(
            name: AppRoutes.accountName,
            path: AppRoutes.accountLocation,
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
                name: AppRoutes.homeName,
                path: AppRoutes.homeLocation,
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorDiscoverKey,
            routes: [
              GoRoute(
                name: AppRoutes.discoverName,
                path: AppRoutes.discoverLocation,
                builder: (context, state) => const DiscoverScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorProfileKey,
            routes: [
              GoRoute(
                name: AppRoutes.profileName,
                path: AppRoutes.profileLocation,
                builder: (context, state) => const ProfileScreen(),
                routes: [
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    name: AppRoutes.historyName,
                    path: AppRoutes.historyLocation,
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
