import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/core/persistence/firestore_path.dart';
import 'package:serendy/src/features/media/infrastructure/media_entity.dart';
import 'package:serendy/src/features/media/infrastructure/media_mapper.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/sheets/sheets.dart';
import 'package:serendy/src/widgets/widgets.dart';

class Firestore$HomeMediasGrid extends StatelessWidget {
  const Firestore$HomeMediasGrid();

  static final query = FirebaseFirestore.instance
      .collection(FirestorePath.media)
      .orderBy('created_at', descending: true);

  static const pageSize = 20;

  @override
  Widget build(BuildContext context) {
    return FirestoreQueryBuilder(
      query: query,
      pageSize: pageSize,
      builder: (context, snapshot, _) {
        if (snapshot.isFetching) {
          return SliverMediasGrid(
            childCount: 8,
            addAutomaticKeepAlives: false,
            builder: (context, index) => const Placeholder$MediaCard(),
          );
        }

        if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Center(child: Text("작품을 불러오지 못했어요.")),
          );
        }

        return SliverMediasGrid(
          childCount: snapshot.docs.length,
          builder: (context, index) {
            final isLastItem = index + 1 == snapshot.docs.length;
            if (isLastItem && snapshot.hasMore) snapshot.fetchMore();

            final data = snapshot.docs[index].data();
            final media = MediaMapper.toDomainModel(
              MediaEntity.fromJson(data),
            );

            return _buildMediaCard(context, media);
          },
        );
      },
    );
  }

  Widget _buildMediaCard(BuildContext context, Media media) {
    return MediaCard(
      onTap: () => context.pushNamed(
        AppRoutes.media,
        pathParameters: {'id': media.id},
        extra: media,
      ),
      onLongPress: () => MediaMenuSheet.show(context, media),
      media: media,
    );
  }
}
