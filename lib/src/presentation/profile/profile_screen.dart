import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/collection/collection.dart';
import 'package:serendy/src/presentation/@widgets/widgets.dart';
import 'package:serendy/src/presentation/profile/profile_controller.dart';

part 'widgets/_my_collections_list.dart';
part 'widgets/_watched_media_indicator.dart';

class ProfileScreen extends ConsumerWidget {
  static const String routeName = 'profile';
  static const String routeLocation = '/$routeName';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileValue = ref.watch(profileControllerProvider);

    return profileValue.when(
      data: (state) => _ProfileTemplate(
        actions: [
          IconButton(
            icon: const Icon(RemixIcon.settings_3_fill),
            onPressed: () => context.pushNamed(AppRoutes.settingsName),
          ),
        ],
        watchedMediaIndicator: _ProfileWatchedMediaIndicator(
          count: state.evaluationsCount,
        ),
        collectionsList: _ProfileMyCollectionsList(
          collections: state.myCollections,
        ),
      ),
      error: (err, stack) => Scaffold(
        body: Center(child: Text(err.toString())),
      ),
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
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
