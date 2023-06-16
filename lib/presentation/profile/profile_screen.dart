import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/features/collection/application/get_collections_list_service.dart';
import 'package:serendy/features/collection/data/collection_repository_remote.dart';
import 'package:serendy/features/collection/domain/collection.dart';
import 'package:serendy/presentation/@widgets/widgets.dart';
import 'package:serendy/presentation/profile/bloc/profile_bloc.dart';

part 'widgets/_watched_media_indicator.dart';
part 'widgets/_my_collections_list.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(
        getCollectionsListUseCase:
            GetCollectionsListService(CollectionRepositoryRemote()),
      )..add(const ProfileMyCollectionsListFetched()),
      child: const _ProfileView(),
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();

  @override
  Widget build(BuildContext context) {
    return _ProfileTemplate(
      actions: [
        IconButton(
          icon: const Icon(RemixIcon.settings_3_fill),
          onPressed: () => context.pushRoute(const SettingsRoute()),
        ),
      ],
      watchedMediaIndicator: const _WatchedMediaIndicator(),
      collectionsList: const _ProfileMyCollectionsList(),
    );
  }
}

class _ProfileTemplate extends StatelessWidget {
  const _ProfileTemplate({
    required this.watchedMediaIndicator,
    required this.collectionsList,
    required this.actions,
  });

  final _WatchedMediaIndicator watchedMediaIndicator;
  final _ProfileMyCollectionsList collectionsList;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(slivers: [
        SliverAppBar(
          pinned: true,
          title: const Text("내 라이브러리"),
          actions: actions,
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          sliver: SliverToBoxAdapter(child: watchedMediaIndicator),
        ),
        collectionsList,
      ]),
    );
  }
}
