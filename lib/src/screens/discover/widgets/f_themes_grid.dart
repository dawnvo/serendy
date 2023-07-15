import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/core/persistence/firestore_path.dart';
import 'package:serendy/src/features/auth/auth.dart';
import 'package:serendy/src/features/theme/infrastructure/theme_entity.dart';
import 'package:serendy/src/features/theme/infrastructure/theme_mapper.dart';
import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/widgets/widgets.dart';

class Firestore$DiscoverThemesGrid extends ConsumerWidget {
  const Firestore$DiscoverThemesGrid();

  // ignore: prefer_function_declarations_over_variables
  static final query = (String userId) => FirebaseFirestore.instance
      .collection(FirestorePath.theme)
      .where('removed_at', isNull: true)
      .where('owner.id', isEqualTo: userId)
      .orderBy('updated_at', descending: true);

  static const pageSize = 20;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(requireUserIdProvider);

    return CustomScrollView(slivers: [
      FirestoreQueryBuilder(
        query: query(userId),
        pageSize: pageSize,
        builder: (context, snapshot, _) {
          if (snapshot.isFetching) {
            return SliverThemesGrid(
              childCount: 8,
              addAutomaticKeepAlives: false,
              builder: (context, index) => const Placeholder$ThemeCard(),
            );
          }

          if (snapshot.hasError) {
            return const SliverToBoxAdapter(
              child: Center(child: Text("테마를 불러오지 못했어요.")),
            );
          }

          return SliverThemesGrid(
            childCount: snapshot.docs.length,
            builder: (context, index) {
              final isLastItem = index + 1 == snapshot.docs.length;
              if (isLastItem && snapshot.hasMore) snapshot.fetchMore();

              final data = snapshot.docs[index].data();
              final theme = ThemeMapper.toDomainModel(
                ThemeEntity.fromJson(data),
              );

              return _buildThemeCard(context, theme);
            },
          );
        },
      ),
    ]);
  }

  Widget _buildThemeCard(BuildContext context, Theme theme) {
    return ThemeCard(
      onTap: () => context.pushNamed(
        AppRoutes.theme,
        pathParameters: {'id': theme.id},
        extra: theme,
      ),
      theme: theme,
    );
  }
}
