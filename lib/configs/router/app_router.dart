import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:serendy/configs/router/app_guards.dart';
import 'package:serendy/features/collection/collection.dart';
import 'package:serendy/features/evaluation/evaluation.dart';
import 'package:serendy/features/media/domain/models/media.dart';
import 'package:serendy/presentation/app.dart';
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

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
final class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: AppRoute.page,
          guards: [AuthGuard()],
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: DiscoverRoute.page),
            AutoRoute(page: ProfileRoute.page),
          ],
        ),
        AutoRoute(
          path: '/signIn',
          page: SignInRoute.page,
        ),
        AutoRoute(
          path: '/history',
          page: HistoryRoute.page,
        ),
        AutoRoute(
          path: '/search/:query',
          page: SearchRoute.page,
        ),

        /// Media
        AutoRoute(
          path: '/media/:id',
          page: MediaRoute.page,
        ),
        AutoRoute(
          path: '/evaluate-media',
          page: MediaEvaluateRoute.page,
          fullscreenDialog: true,
        ),

        /// Collection
        AutoRoute(
          path: '/collection/:id',
          page: CollectionRoute.page,
        ),
        AutoRoute(
          path: '/create-collection',
          page: CreateCollectionRoute.page,
          fullscreenDialog: true,
        ),
        AutoRoute(
          path: '/edit-collection',
          page: EditCollectionRoute.page,
          fullscreenDialog: true,
        ),

        /// Settings
        AutoRoute(
          path: '/settings',
          page: SettingsRoute.page,
        ),
        AutoRoute(
          path: '/settings/account',
          page: AccountRoute.page,
        ),

        /// Admin
        AutoRoute(
          page: AdminRoute.page,
          fullscreenDialog: true,
        ),
      ];
}
