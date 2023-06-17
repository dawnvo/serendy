import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:serendy/features/collection/domain/collection.dart';
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
          page: AppRoute.page,
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: DiscoverRoute.page),
            AutoRoute(page: ProfileRoute.page),
          ],
        ),
        AutoRoute(path: '/collection/:id', page: CollectionRoute.page),
        AutoRoute(path: '/media/:id', page: MediaRoute.page),
        AutoRoute(path: '/history', page: HistoryRoute.page),
        AutoRoute(path: '/search/:query', page: SearchRoute.page),
        AutoRoute(path: '/settings', page: SettingsRoute.page),
        AutoRoute(path: '/settings/account', page: AccountRoute.page),

        /// Modals
        AutoRoute(
          fullscreenDialog: true,
          path: '/signIn',
          page: SignInRoute.page,
        ),
        AutoRoute(
          fullscreenDialog: true,
          path: '/create-collection',
          page: CreateCollectionRoute.page,
        ),
        AutoRoute(
          fullscreenDialog: true,
          path: '/edit-collection',
          page: EditCollectionRoute.page,
        ),

        /// Admin
        AutoRoute(
          initial: true,
          fullscreenDialog: true,
          page: AdminRoute.page,
        ),
      ];
}
