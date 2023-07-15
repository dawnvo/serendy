import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/core/persistence/firestore_path.dart';
import 'package:serendy/src/features/auth/auth.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/evaluation/infrastructure/evaluation_entity.dart';
import 'package:serendy/src/features/evaluation/infrastructure/evaluation_mapper.dart';
import 'package:serendy/src/sheets/sheets.dart';
import 'package:serendy/src/widgets/widgets.dart';

class Firestore$HistoryEvaluationCardsList extends ConsumerWidget {
  const Firestore$HistoryEvaluationCardsList();

  // ignore: prefer_function_declarations_over_variables
  static final query = (String userId) => FirebaseFirestore.instance
      .collection(FirestorePath.evaluation)
      .where('user_id', isEqualTo: userId)
      .where('removed_at', isNull: true)
      .orderBy('updated_at', descending: true);

  static const pageSize = 20;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(requireUserIdProvider);

    return FirestoreQueryBuilder(
      query: query(userId),
      pageSize: pageSize,
      builder: (context, snapshot, _) {
        if (snapshot.isFetching) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Center(child: Text("평가를 불러오지 못했어요.")),
          );
        }

        return SliverList.builder(
          itemCount: snapshot.docs.length,
          itemBuilder: (context, index) {
            final isLastItem = index + 1 == snapshot.docs.length;
            if (isLastItem && snapshot.hasMore) snapshot.fetchMore();

            final data = snapshot.docs[index].data();
            final evaluation = EvaluationMapper.toDomainModel(
              EvaluationEntity.fromJson(data),
            );

            return Padding(
              padding: const EdgeInsets.only(bottom: Sizes.p16),
              child: _buildEvaluationCard(context, evaluation),
            );
          },
        );
      },
    );
  }

  Widget _buildEvaluationCard(BuildContext context, Evaluation evaluation) {
    return EvaluationCard(
      onTap: () => context.pushNamed(
        AppRoutes.media,
        pathParameters: {'id': evaluation.media.id},
        extra: evaluation.media.convertEntity,
      ),
      onMoreTap: () => EvaluationMenuSheet.show(context, evaluation),
      evaluation: evaluation,
    );
  }
}
