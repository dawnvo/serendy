import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/core/enums.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/screens/screens.dart';

import 'bottom_navigation_bar.dart';
import 'go_router_transition_page.dart';

part 'app_routes.dart';

// Navigator keys
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final __shellNavigatorHomeKey = GlobalKey<NavigatorState>();
final __shellNavigatorDiscoverKey = GlobalKey<NavigatorState>();
final __shellNavigatorProfileKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  // 🔒 로그인이 필요한 화면
  final privateLocation = [
    AppRoutes._homeLocation,
    AppRoutes._profileLocation,
    AppRoutes._accountLocation,
  ];

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoggedIn = ''.isEmpty;

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
      ..._shellNavigator,
      ..._modalRoutes,
      ..._mediaRoutes,
      ..._themeRoutes,
      GoRoute(
        name: AppRoutes.signIn,
        path: AppRoutes._signInLocation,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const SignInScreen(),
      ),
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
          ),
        ],
      ),
    ],
  );
});

/// ----------Media routes
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
  ),
  GoRoute(
    name: AppRoutes.evaluateMedia,
    path: AppRoutes._evaluateMediaLocation,
    parentNavigatorKey: _rootNavigatorKey,
    pageBuilder: (context, state) {
      final media = state.extra as Media;
      return GoRouterTransitionPage.verticalAxis(
        fullscreenDialog: true,
        child: EvaluateMediaScreen(media: media),
      );
    },
  ),
];

/// ----------Theme routes
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
  ),
  GoRoute(
    name: AppRoutes.editTheme,
    path: AppRoutes._editThemeLocation,
    parentNavigatorKey: _rootNavigatorKey,
    pageBuilder: (context, state) {
      final theme = state.extra as Theme;
      return GoRouterTransitionPage.verticalAxis(
        fullscreenDialog: true,
        child: EditThemeScreen(theme: theme),
      );
    },
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

/// ----------Modal routes
final _modalRoutes = [
  GoRoute(
    name: AppRoutes.rankUp,
    path: AppRoutes._rankUpLocation,
    parentNavigatorKey: _rootNavigatorKey,
    pageBuilder: (context, state) {
      final rank = state.extra as Rank;
      return GoRouterTransitionPage.verticalAxis(
        fullscreenDialog: true,
        child: RankUpModal(rank: rank),
      );
    },
  ),
];

/// ----------Shell navigator
final _shellNavigator = [
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
            name: AppRoutes.profile,
            path: AppRoutes._profileLocation,
            builder: (context, state) => const ProfileScreen(),
            routes: [
              GoRoute(
                name: AppRoutes.history,
                path: AppRoutes._historyLocation,
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) => const HistoryScreen(),
              ),
              GoRoute(
                name: AppRoutes.profileCard,
                path: AppRoutes._profileCardLocation,
                parentNavigatorKey: _rootNavigatorKey,
                pageBuilder: (context, state) {
                  final count = state.extra as int;
                  return GoRouterTransitionPage.verticalAxis(
                    fullscreenDialog: true,
                    child: ProfileCardScreen(evaluationCount: count),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
