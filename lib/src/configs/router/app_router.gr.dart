// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AppRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AppScreen(),
      );
    },
    CollectionRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CollectionRouteArgs>(
          orElse: () => CollectionRouteArgs(id: pathParams.getString('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CollectionScreen(
          id: args.id,
          key: args.key,
        ),
      );
    },
    CreateCollectionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateCollectionScreen(),
      );
    },
    DiscoverRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DiscoverScreen(),
      );
    },
    EditCollectionRoute.name: (routeData) {
      final args = routeData.argsAs<EditCollectionRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditCollectionScreen(
          collection: args.collection,
          key: args.key,
        ),
      );
    },
    HistoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HistoryScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    MediaRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MediaRouteArgs>(
          orElse: () => MediaRouteArgs(id: pathParams.getString('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MediaScreen(
          id: args.id,
          key: args.key,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    AccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountScreen(),
      );
    },
  };
}

/// generated route for
/// [AppScreen]
class AppRoute extends PageRouteInfo<void> {
  const AppRoute({List<PageRouteInfo>? children})
      : super(
          AppRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CollectionScreen]
class CollectionRoute extends PageRouteInfo<CollectionRouteArgs> {
  CollectionRoute({
    required String id,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CollectionRoute.name,
          args: CollectionRouteArgs(
            id: id,
            key: key,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'CollectionRoute';

  static const PageInfo<CollectionRouteArgs> page =
      PageInfo<CollectionRouteArgs>(name);
}

class CollectionRouteArgs {
  const CollectionRouteArgs({
    required this.id,
    this.key,
  });

  final String id;

  final Key? key;

  @override
  String toString() {
    return 'CollectionRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [CreateCollectionScreen]
class CreateCollectionRoute extends PageRouteInfo<void> {
  const CreateCollectionRoute({List<PageRouteInfo>? children})
      : super(
          CreateCollectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateCollectionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DiscoverScreen]
class DiscoverRoute extends PageRouteInfo<void> {
  const DiscoverRoute({List<PageRouteInfo>? children})
      : super(
          DiscoverRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiscoverRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditCollectionScreen]
class EditCollectionRoute extends PageRouteInfo<EditCollectionRouteArgs> {
  EditCollectionRoute({
    required Collection collection,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EditCollectionRoute.name,
          args: EditCollectionRouteArgs(
            collection: collection,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditCollectionRoute';

  static const PageInfo<EditCollectionRouteArgs> page =
      PageInfo<EditCollectionRouteArgs>(name);
}

class EditCollectionRouteArgs {
  const EditCollectionRouteArgs({
    required this.collection,
    this.key,
  });

  final Collection collection;

  final Key? key;

  @override
  String toString() {
    return 'EditCollectionRouteArgs{collection: $collection, key: $key}';
  }
}

/// generated route for
/// [HistoryScreen]
class HistoryRoute extends PageRouteInfo<void> {
  const HistoryRoute({List<PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MediaScreen]
class MediaRoute extends PageRouteInfo<MediaRouteArgs> {
  MediaRoute({
    required String id,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          MediaRoute.name,
          args: MediaRouteArgs(
            id: id,
            key: key,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'MediaRoute';

  static const PageInfo<MediaRouteArgs> page = PageInfo<MediaRouteArgs>(name);
}

class MediaRouteArgs {
  const MediaRouteArgs({
    required this.id,
    this.key,
  });

  final String id;

  final Key? key;

  @override
  String toString() {
    return 'MediaRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AccountScreen]
class AccountRoute extends PageRouteInfo<void> {
  const AccountRoute({List<PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
