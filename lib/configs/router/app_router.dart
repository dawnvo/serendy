import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:serendy/configs/router/app_guards.dart';
import 'package:serendy/features/collection/collection.dart';
import 'package:serendy/presentation/app.dart';
import 'package:serendy/presentation/admin/admin_screen.dart';
import 'package:serendy/presentation/account/account_screen.dart';
import 'package:serendy/presentation/collection/collection_screen.dart';
import 'package:serendy/presentation/create_collection/create_collection_screen.dart';
import 'package:serendy/presentation/discover/discover_screen.dart';
import 'package:serendy/presentation/edit_collection/edit_collection_screen.dart';
import 'package:serendy/presentation/history/history_screen.dart';
import 'package:serendy/presentation/home/home_screen.dart';
import 'package:serendy/presentation/media/media_screen.dart';
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
          path: '/media/:id',
          page: MediaRoute.page,
        ),
        AutoRoute(
          path: '/collection/:id',
          page: CollectionRoute.page,
        ),
        AutoRoute(
          path: '/search/:query',
          page: SearchRoute.page,
        ),
        AutoRoute(
          path: '/history',
          page: HistoryRoute.page,
        ),
        AutoRoute(
          path: '/settings',
          page: SettingsRoute.page,
        ),
        AutoRoute(
          path: '/settings/account',
          page: AccountRoute.page,
        ),
        AutoRoute(
          path: '/signIn',
          page: SignInRoute.page,
        ),

        /// Modals
        AutoRoute(
          path: '/create-collection',
          fullscreenDialog: true,
          page: CreateCollectionRoute.page,
        ),
        AutoRoute(
          path: '/edit-collection',
          fullscreenDialog: true,
          page: EditCollectionRoute.page,
        ),

        /// Admin
        AutoRoute(
          fullscreenDialog: true,
          page: AdminRoute.page,
        ),
      ];
}
