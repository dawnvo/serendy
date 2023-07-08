import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:serendy/src/core/persistence/firestore_path.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/evaluation/infrastructure/evaluation_entity.dart';
import 'package:serendy/src/features/evaluation/infrastructure/evaluation_mapper.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/user/user.dart';

final class EvaluationRepositoryImpl extends EvaluationRepository {
  EvaluationRepositoryImpl(this.firestore)
      : _ref = firestore.collection(FirestorePath.evaluation);

  final FirebaseFirestore firestore;
  final CollectionReference<Map<String, dynamic>> _ref;

  @override
  Stream<List<Evaluation?>> watchMany(UserID userId) {
    Query<Map<String, dynamic>> query = _ref
        // * 삭제한 평가는 제외해요.
        .where('removed_at', isNull: true)
        // * 로그인한 사용자의 평가만 가져와요.
        .where('user_id', isEqualTo: userId)
        // * 최신순으로 정렬해요.
        .orderBy('updated_at', descending: true);

    final streamSnapshots = query.snapshots();
    return streamSnapshots.map((snapshot) => snapshot.docs
        .map((doc) => doc.data())
        .map(EvaluationEntity.fromJson)
        .map(EvaluationMapper.toDomainModel)
        .toList());
  }

  @override
  Future<List<Evaluation?>> findMany(MediaID? mediaId) async {
    Query<Map<String, dynamic>> query = _ref
        // * 삭제한 평가는 제외해요.
        .where('removed_at', isNull: true)
        // * 미디어 반응를 가져와요.
        .where('media.id', isEqualTo: mediaId);

    final snapshots = await query.get();

    return snapshots.docs
        .map((doc) => doc.data())
        .map(EvaluationEntity.fromJson)
        .map(EvaluationMapper.toDomainModel)
        .toList();
  }

  /// * 삭제한 평가도 불러와요.
  ///
  /// - 평가 테이블은 소프트 삭제로 관리해
  /// - 삭제한 평가를 불러오지 않으면
  /// - 새롭게 추가하는 문제가 발생해요.
  @override
  Future<Evaluation?> findOne(UserID userId, MediaID mediaId) async {
    // 인덱스된 평가는 무조건 하나에요.
    final snapshots = await _ref
        .where('user_id', isEqualTo: userId)
        .where('media.id', isEqualTo: mediaId)
        .limit(1)
        .get();

    if (snapshots.docs.isEmpty) return null;

    return snapshots.docs
        .map((doc) => doc.data())
        .map(EvaluationEntity.fromJson)
        .map(EvaluationMapper.toDomainModel)
        .first;
  }

  @override
  Future<int> count(UserID userId) async {
    final snapshots = await _ref
        .where('removed_at', isNull: true)
        .where('user_id', isEqualTo: userId)
        .count()
        .get();

    return snapshots.count;
  }

  @override
  Future<void> create(Evaluation evaluation) async {
    final evaluationEntity = EvaluationMapper.toDataEntity(evaluation);
    await _ref.doc(evaluation.id).set(evaluationEntity.toJson());
  }

  @override
  Future<void> update(Evaluation evaluation) async {
    final evaluationEntity = EvaluationMapper.toDataEntity(evaluation);
    await _ref.doc(evaluation.id).update(evaluationEntity.toJson());
  }
}
