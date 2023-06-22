import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:serendy/core/persistence/firestore_path.dart';
import 'package:serendy/features/evaluation/evaluation.dart';
import 'package:serendy/features/evaluation/infrastructure/evaluation_entity.dart';
import 'package:serendy/features/evaluation/infrastructure/evaluation_mapper.dart';
import 'package:serendy/features/media/media.dart';
import 'package:serendy/features/user/user.dart';

final class EvaluationRepositoryImpl extends EvaluationRepository {
  EvaluationRepositoryImpl(this.firestore)
      : _ref = firestore.collection(FirestorePath.evaluation);

  final FirebaseFirestore firestore;
  final CollectionReference<Map<String, dynamic>> _ref;

  /// Watch evaluations list
  @override
  Stream<List<Evaluation?>> watchMany({UserID? userId, MediaID? mediaId}) {
    Query<Map<String, dynamic>> query = _ref.where('removed_at', isNull: true);

    if (userId != null) {
      query = query.where('user_id', isEqualTo: userId);
    } else if (mediaId != null) {
      query = query.where('media.id', isEqualTo: mediaId);
    }

    final streamSnapshots = query.snapshots();

    return streamSnapshots.map((snapshot) {
      final evaluationDataList = snapshot.docs.map((doc) => doc.data());
      final evaluationEntities =
          evaluationDataList.map(EvaluationEntity.fromJson);
      return EvaluationMapper.toDomainModels(evaluationEntities);
    });
  }

  /// Fetch evaluations list
  @override
  Future<List<Evaluation?>> findMany({UserID? userId, MediaID? mediaId}) async {
    Query<Map<String, dynamic>> query = _ref.where('removed_at', isNull: true);

    if (userId != null) {
      query = query.where('user_id', isEqualTo: userId);
    } else if (mediaId != null) {
      query = query.where('media.id', isEqualTo: mediaId);
    }

    final snapshot = await query.get();

    final evaluationDataList = snapshot.docs.map((doc) => doc.data());
    final evaluationEntities =
        evaluationDataList.map(EvaluationEntity.fromJson);
    return EvaluationMapper.toDomainModels(evaluationEntities);
  }

  /// Fetch evaluation
  ///
  /// 🚧제거된 평가도 조회해요🚧
  ///
  /// 만일 제거된 평가를 조회하지 않으면,
  /// 이미 생성한 평가가 있음에도 새로 만드는 문제가 발생해요.
  @override
  Future<Evaluation?> findOne(UserID userId, MediaID mediaId) async {
    // 인덱스된 평가는 무조건 하나에요.
    final snapshots = await _ref
        .where('user_id', isEqualTo: userId)
        .where('media.id', isEqualTo: mediaId)
        .limit(1)
        .get();

    if (snapshots.docs.isEmpty) return null;

    final evaluationData = snapshots.docs.first.data();
    final evaluationEntity = EvaluationEntity.fromJson(evaluationData);
    return EvaluationMapper.toDomainModel(evaluationEntity);
  }

  /// Count evaluations
  @override
  Future<int> count(UserID userId) async {
    final snapshots = await _ref
        .where('removed_at', isNull: true)
        .where('user_id', isEqualTo: userId)
        .count()
        .get();

    return snapshots.count;
  }

  /// Create evaluation
  @override
  Future<void> create(Evaluation evaluation) async {
    final evaluationEntity = EvaluationMapper.toDataEntity(evaluation);
    await _ref.doc(evaluation.id).set(evaluationEntity.toJson());
  }

  /// Update evaluation
  @override
  Future<void> update(Evaluation evaluation) async {
    final evaluationEntity = EvaluationMapper.toDataEntity(evaluation);
    await _ref.doc(evaluation.id).update(evaluationEntity.toJson());
  }
}
