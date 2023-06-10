import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:serendy/src/_mock.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/models/models.dart' show Collection;
import 'package:serendy/src/widgets/collection_item.dart';
import 'package:serendy/src/widgets/multi_line_progress_indicator.dart';

part 'widgets/watched_media_indicator.dart';
part 'widgets/my_collections_list.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _ProfileTemplate(
      actions: [
        IconButton(
          icon: const Icon(RemixIcon.settings_3_fill),
          onPressed: () {},
          // onPressed: () => context.pushRoute(const SettingsRoute()),
        ),
      ],
      watchedMediaIndicator: _WatchedMediaIndicator(
        total: 10,
        count: 9,
        onTap: () {},
        // onTap: () => context.pushRoute(const HistoryRoute()),
      ),
      collectionsList: _MyCollectionsList(collectionsMock),
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
  final _MyCollectionsList collectionsList;
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
