import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/user/user.dart';
import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/screens/screens.dart';

import 'bottom_navigation_bar.dart';
import 'go_router_refresh_stream.dart';
import 'go_router_transition_page.dart';

part 'app_routes.dart';

//navigator-keys
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final __shellNavigatorHomeKey = GlobalKey<NavigatorState>();
final __shellNavigatorDiscoverKey = GlobalKey<NavigatorState>();
final __shellNavigatorProfileKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  final supabase = ref.watch(supabaseProvider);

  return GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    refreshListenable: GoRouterRefreshStream(
      supabase.auth.onAuthStateChange,
    ),
    redirect: (context, state) {
      final session = supabase.auth.currentSession;
      final currentLocation = state.matchedLocation;

      // * 로그인에 성공한 경우
      if (session != null) {
        if (currentLocation == AppRoutes._signInLocation) {
          return AppRoutes._homeLocation;
        }
      }
      // * 로그인에 실패한 경우
      else {
        return AppRoutes._signInLocation;
      }

      return null;
    },
    initialLocation: AppRoutes._homeLocation,
    routes: [
      //other-routes
      GoRoute(
        name: AppRoutes.signIn,
        path: AppRoutes._signInLocation,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const SignInScreen(),
      ),

      ///modal-routes
      GoRoute(
        name: AppRoutes.rank,
        path: AppRoutes._rankLocation,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          final rank = state.extra as Rank;
          return GoRouterTransitionPage.verticalAxis(
            fullscreenDialog: true,
            child: RankModal(rank: rank),
          );
        },
      ),

      ///shell-routes
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavigationBar(
            navigationShell: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: __shellNavigatorHomeKey,
            routes: [
              GoRoute(
                name: AppRoutes.home,
                path: AppRoutes._homeLocation,
                builder: (context, state) => const HomeScreen(),
                routes: [
                  ..._mediaRoutes,
                  ..._themeRoutes,
                  GoRoute(
                    name: AppRoutes.settings,
                    path: AppRoutes._settingsLocation,
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) => const SettingsScreen(),
                  ),
                  GoRoute(
                    name: AppRoutes.account,
                    path: AppRoutes._accountLocation,
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) => const AccountScreen(),
                    routes: [
                      GoRoute(
                        name: AppRoutes.exit,
                        path: AppRoutes._exitLocation,
                        parentNavigatorKey: _rootNavigatorKey,
                        builder: (context, state) => const ExitScreen(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: __shellNavigatorDiscoverKey,
            routes: [
              GoRoute(
                name: AppRoutes.discover,
                path: AppRoutes._discoverLocation,
                builder: (context, state) => const DiscoverScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: __shellNavigatorProfileKey,
            routes: [
              GoRoute(
                name: AppRoutes.library,
                path: AppRoutes._libraryLocation,
                builder: (context, state) => const LibraryScreen(),
                routes: [
                  GoRoute(
                    name: AppRoutes.history,
                    path: AppRoutes._historyLocation,
                    parentNavigatorKey: _rootNavigatorKey,
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

//media-routes
final _mediaRoutes = [
  GoRoute(
    name: AppRoutes.search,
    path: AppRoutes._searchLocation,
    parentNavigatorKey: _rootNavigatorKey,
    builder: (context, state) => const SearchScreen(),
  ),
  GoRoute(
    name: AppRoutes.media,
    path: AppRoutes._mediaLocation,
    parentNavigatorKey: _rootNavigatorKey,
    builder: (context, state) {
      final id = state.pathParameters['id']!;
      final media = state.extra as Media?;
      return MediaScreen(id: id, media: media);
    },
    routes: [
      GoRoute(
        name: AppRoutes.evaluateMedia,
        path: AppRoutes._evaluateMediaLocation,
        parentNavigatorKey: _rootNavigatorKey,
        redirect: (context, state) {
          // * 매개가 없으면 작품 화면으로 되돌아가요.
          if (state.extra is! Media) {
            final mediaId = state.pathParameters['id']!;
            return '/${AppRoutes.media}/$mediaId';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final media = state.extra as Media;
          return GoRouterTransitionPage.verticalAxis(
            fullscreenDialog: true,
            child: EvaluateMediaScreen(media: media),
          );
        },
      ),
    ],
  ),
];

//theme-routes
final _themeRoutes = [
  GoRoute(
    name: AppRoutes.theme,
    path: AppRoutes._themeLocation,
    parentNavigatorKey: _rootNavigatorKey,
    builder: (context, state) {
      final id = state.pathParameters['id']!;
      final theme = state.extra as Theme?;
      return ThemeScreen(id: id, theme: theme);
    },
    routes: [
      GoRoute(
        name: AppRoutes.editTheme,
        path: AppRoutes._editThemeLocation,
        parentNavigatorKey: _rootNavigatorKey,
        redirect: (context, state) {
          // * 매개가 없으면 테마 화면으로 되돌아가요.
          if (state.extra is! Theme) {
            final themeId = state.pathParameters['id']!;
            return '/${AppRoutes.theme}/$themeId';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final theme = state.extra as Theme;
          return GoRouterTransitionPage.verticalAxis(
            fullscreenDialog: true,
            child: EditThemeScreen(theme: theme),
          );
        },
      ),
    ],
  ),
  GoRoute(
    name: AppRoutes.createTheme,
    path: AppRoutes._createThemeLocation,
    parentNavigatorKey: _rootNavigatorKey,
    pageBuilder: (context, state) {
      return GoRouterTransitionPage.verticalAxis(
        fullscreenDialog: true,
        child: const CreateThemeScreen(),
      );
    },
  ),
];
