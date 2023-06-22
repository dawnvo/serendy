import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/core/locator.dart';
import 'package:serendy/features/collection/collection.dart';
import 'package:serendy/presentation/@blocs/blocs.dart';
import 'package:serendy/presentation/@widgets/widgets.dart';
import 'package:serendy/presentation/profile/bloc/profile_bloc.dart';

part 'widgets/_my_collections_list.dart';
part 'widgets/_watched_media_indicator.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileBloc(
            evaluationService: sl(),
          )..add(const Profile$MyEvaluationsCounted()),
        ),
        BlocProvider(
          create: (context) => MyCollectionsBloc(
            collectionService: sl(),
          )..add(const MyCollections$Fetched()),
        ),
      ],
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
      watchedMediaIndicator: const _ProfileWatchedMediaIndicator(),
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

  final _ProfileWatchedMediaIndicator watchedMediaIndicator;
  final _ProfileMyCollectionsList collectionsList;
  final List<IconButton> actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
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
