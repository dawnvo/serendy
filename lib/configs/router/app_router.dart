import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serendy/configs/router/bottom_navigation_bar.dart';
import 'package:serendy/core/locator.dart';
import 'package:serendy/features/auth/auth.dart';
import 'package:serendy/features/collection/collection.dart';
import 'package:serendy/features/media/media.dart';
import 'package:serendy/presentation/account/account_screen.dart';
import 'package:serendy/presentation/admin/admin_screen.dart';
import 'package:serendy/presentation/collection/collection_screen.dart';
import 'package:serendy/presentation/create_collection/create_collection_screen.dart';
import 'package:serendy/presentation/discover/discover_screen.dart';
import 'package:serendy/presentation/edit_collection/edit_collection_screen.dart';
import 'package:serendy/presentation/history/history_screen.dart';
import 'package:serendy/presentation/home/home_screen.dart';
import 'package:serendy/presentation/media/media_screen.dart';
import 'package:serendy/presentation/media_evaluate/media_evaluate_screen.dart';
import 'package:serendy/presentation/profile/profile_screen.dart';
import 'package:serendy/presentation/search/search_screen.dart';
import 'package:serendy/presentation/settings/settings_screen.dart';
import 'package:serendy/presentation/sign_in/sign_in_screen.dart';

import 'go_router_refresh_stream.dart';

part 'app_routes.dart';

// Navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>();
final _shellNavigatorDiscoverKey = GlobalKey<NavigatorState>();
final _shellNavigatorProfileKey = GlobalKey<NavigatorState>();

GoRouter goRouter() {
  final authService = sl<AuthService>();

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
        builder: (context, state) {
          return const SignInScreen();
        },
      ),
      GoRoute(
        name: AppRoutes.searchName,
        path: AppRoutes.searchLocation,
        builder: (context, state) {
          return const SearchScreen();
        },
      ),
      GoRoute(
        name: AppRoutes.adminName,
        path: AppRoutes.adminLocation,
        builder: (context, state) {
          return const AdminScreen();
        },
      ),

      /// MEDIA
      GoRoute(
        name: AppRoutes.mediaName,
        path: AppRoutes.mediaLocation,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return MediaScreen(id: id);
        },
      ),
      GoRoute(
        name: AppRoutes.mediaEvaluateName,
        path: AppRoutes.mediaEvaluateLocation,
        pageBuilder: (context, state) {
          final media = state.extra as Media;
          return _modalTransitionPage(
            MediaEvaluateScreen(media: media),
          );
        },
      ),

      /// COLLECTION
      GoRoute(
        name: AppRoutes.collectionName,
        path: AppRoutes.collectionLocation,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return CollectionScreen(id: id);
        },
      ),
      GoRoute(
        name: AppRoutes.createCollectionName,
        path: AppRoutes.createCollectionLocation,
        pageBuilder: (context, state) {
          return _modalTransitionPage(
            const CreateCollectionScreen(),
          );
        },
      ),
      GoRoute(
        name: AppRoutes.editCollectionName,
        path: AppRoutes.editCollectionLocation,
        pageBuilder: (context, state) {
          final collection = state.extra as Collection;
          return _modalTransitionPage(
            EditCollectionScreen(collection: collection),
          );
        },
      ),

      /// SETTINGS
      GoRoute(
        name: AppRoutes.settingsName,
        path: AppRoutes.settingsLocation,
        builder: (context, state) {
          return const SettingsScreen();
        },
        routes: [
          GoRoute(
            name: AppRoutes.accountName,
            path: AppRoutes.accountLocation,
            builder: (context, state) {
              return const AccountScreen();
            },
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
                builder: (context, state) {
                  return const HomeScreen();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorDiscoverKey,
            routes: [
              GoRoute(
                name: AppRoutes.discoverName,
                path: AppRoutes.discoverLocation,
                builder: (context, state) {
                  return const DiscoverScreen();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorProfileKey,
            routes: [
              GoRoute(
                name: AppRoutes.profileName,
                path: AppRoutes.profileLocation,
                builder: (context, state) {
                  return const ProfileScreen();
                },
                routes: [
                  GoRoute(
                    name: AppRoutes.historyName,
                    path: AppRoutes.historyLocation,
                    builder: (context, state) {
                      return const HistoryScreen();
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

Page _modalTransitionPage(Widget child) {
  return CustomTransitionPage(
    child: child,
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
