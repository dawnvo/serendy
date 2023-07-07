import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/core/enums.dart';
import 'package:serendy/src/features/collection/collection.dart'
    hide CollectionItem;
import 'package:serendy/src/features/user/user.dart';
import 'package:serendy/src/widgets/widgets.dart';

import 'controller/profile_controller.dart';

part 'widgets/_my_collections_list.dart';
part 'widgets/_profile_card.dart';

class ProfileScreen extends ConsumerWidget {
  static const String routeName = 'profile';
  static const String routeLocation = '/$routeName';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileValue = ref.watch(profileControllerProvider);

    return profileValue.when(
      skipLoadingOnReload: true,
      data: (state) => _ProfileTemplate(
        actions: [
          IconButton(
            icon: const Icon(RemixIcon.menu_3_line),
            onPressed: () => context.pushNamed(AppRoutes.settingsName),
          ),
        ],
        profileCard: _ProfileCard(
          user: state.user,
          evaluationCount: state.evaluationsCount,
        ),
        collectionsList: _ProfileMyCollectionsList(
          collections: state.myCollections,
        ),
      ),
      loading: () => const _Placeholder$ProfileScreen(),
      error: (err, stack) => Scaffold(
        body: Center(child: Text(err.toString())),
      ),
    );
  }
}

class _ProfileTemplate extends StatelessWidget {
  const _ProfileTemplate({
    required this.actions,
    required this.profileCard,
    required this.collectionsList,
  });

  final List<IconButton> actions;
  final _ProfileCard profileCard;
  final _ProfileMyCollectionsList collectionsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          title: const Text("내 라이브러리"),
          actions: actions,
        ),
        SliverPadding(
          padding: const EdgeInsets.only(bottom: kContentPadding),
          sliver: SliverToBoxAdapter(child: profileCard),
        ),
        collectionsList,
      ]),
    );
  }
}

//Placeholder
class _Placeholder$ProfileScreen extends StatelessWidget {
  const _Placeholder$ProfileScreen();

  @override
  Widget build(BuildContext context) {
    final color = context.colorScheme.surfaceVariant;
    //widgets
    final profileCard = Container(
      color: color,
      height: 160,
    );
    final collectionsList = SliverMyCollectionsList(
      childCount: 4,
      showCreateTile: false,
      addAutomaticKeepAlives: false,
      builder: (context, index) => const Placeholder$CollectionItem(),
    );
    //template
    return Scaffold(
      body: CustomScrollView(slivers: [
        const SliverAppBar(title: Text("내 라이브러리")),
        SliverPadding(
          padding: const EdgeInsets.only(bottom: kContentPadding),
          sliver: SliverToBoxAdapter(
            child: profileCard,
          ),
        ),
        collectionsList,
      ]),
    );
  }
}
