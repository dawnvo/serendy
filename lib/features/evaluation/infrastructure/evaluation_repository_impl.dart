import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:serendy/core/persistence/firestore_path.dart';
import 'package:serendy/features/evaluation/evaluation.dart';
import 'package:serendy/features/evaluation/infrastructure/evaluation_entity.dart';
import 'package:serendy/features/evaluation/infrastructure/evaluation_mapper.dart';
import 'package:serendy/features/media/media.dart';
import 'package:serendy/features/user/user.dart';

final class EvaluationRepositoryImpl extends EvaluationRepository {
  EvaluationRepositoryImpl(this._firestore);

  final FirebaseFirestore _firestore;

  @override
  Stream<List<Evaluation?>> watchMany({UserID? userId, MediaID? mediaId}) {
    Query<Map<String, dynamic>> query = _firestore
        .collection(FirestorePath.evaluation)
        .where('removed_at', isNull: true);

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

  @override
  Future<List<Evaluation?>> findMany({UserID? userId, MediaID? mediaId}) async {
    Query<Map<String, dynamic>> query = _firestore
        .collection(FirestorePath.evaluation)
        .where('removed_at', isNull: true);

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

  /// 🚧제거된 평가도 조회해요🚧
  ///
  /// 만일 제거된 평가를 조회하지 않으면,
  /// 이미 생성한 평가가 있음에도 새로 만드는 문제가 발생해요.
  @override
  Future<Evaluation?> findOne(UserID userId, MediaID mediaId) async {
    final snapshots = await _firestore
        .collection(FirestorePath.evaluation)
        .where('user_id', isEqualTo: userId)
        .where('media.id', isEqualTo: mediaId)
        .limit(1)
        .get();

    if (snapshots.docs.isEmpty) return null;

    // 📌 인덱스된 evaluation는 무조건 하나에요.
    final evaluationData = snapshots.docs.first.data();
    final evaluationEntity = EvaluationEntity.fromJson(evaluationData);
    return EvaluationMapper.toDomainModel(evaluationEntity);
  }

  @override
  Future<int> count(UserID userId) async {
    final snapshots = await _firestore
        .collection(FirestorePath.evaluation)
        .where('removed_at', isNull: true)
        .where('user_id', isEqualTo: userId)
        .count()
        .get();

    return snapshots.count;
  }

  /// Evaluation 생성
  @override
  Future<void> create(Evaluation evaluation) async {
    final evaluationEntity = EvaluationMapper.toDataEntity(evaluation);
    final ref =
        _firestore.collection(FirestorePath.evaluation).doc(evaluation.id);
    ref.set(evaluationEntity.toJson());
  }

  /// Evaluation 갱신
  @override
  Future<void> update(Evaluation evaluation) async {
    final evaluationEntity = EvaluationMapper.toDataEntity(evaluation);
    final ref =
        _firestore.collection(FirestorePath.evaluation).doc(evaluation.id);
    ref.update(evaluationEntity.toJson());
  }
}
