import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:serendy/src/app.dart';
import 'package:serendy/src/screens/home/home_screen.dart';
import 'package:serendy/src/screens/discover/discover_screen.dart';
import 'package:serendy/src/screens/profile/profile_screen.dart';
import 'package:serendy/src/screens/collection/collection_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
final class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: AppRoute.page,
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: DiscoverRoute.page),
            AutoRoute(page: ProfileRoute.page),
          ],
        ),
        AutoRoute(path: '/collections/:id', page: CollectionRoute.page),
      ];
}
