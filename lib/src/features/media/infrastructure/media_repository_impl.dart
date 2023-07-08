import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:serendy/src/core/persistence/firestore_path.dart';
import 'package:serendy/src/features/media/infrastructure/media_entity.dart';
import 'package:serendy/src/features/media/infrastructure/media_mapper.dart';
import 'package:serendy/src/features/media/media.dart';

final class MediaRepositoryImpl implements MediaRepository {
  MediaRepositoryImpl(this.firestore)
      : _ref = firestore.collection(FirestorePath.media);

  final FirebaseFirestore firestore;
  final CollectionReference<Map<String, dynamic>> _ref;

  @override
  Future<List<Media?>> search(String? title) async {
    final snapshots = await _ref
        .limit(20)
        .where("title", isGreaterThanOrEqualTo: title)
        .where("title", isLessThanOrEqualTo: '$title\uf8ff')
        .get();

    return snapshots.docs
        .map((doc) => doc.data())
        .map(MediaEntity.fromJson)
        .map(MediaMapper.toDomainModel)
        .toList();
  }

  @override
  Future<List<Media?>> findMany(int pageSize) async {
    final snapshots = await _ref.limit(pageSize).get();

    return snapshots.docs
        .map((doc) => doc.data())
        .map(MediaEntity.fromJson)
        .map(MediaMapper.toDomainModel)
        .toList();
  }

  @override
  Future<Media?> findOne(MediaID mediaId) async {
    final snapshot = await _ref.doc(mediaId).get();

    final data = snapshot.data();
    if (data == null) return null;

    final entity = MediaEntity.fromJson(data);
    return MediaMapper.toDomainModel(entity);
  }

  /// Create media
  @override
  Future<void> create(Media media) async {
    final entity = MediaMapper.toDataEntity(media);
    await _ref.doc(media.id).set(entity.toJson());
  }
}
