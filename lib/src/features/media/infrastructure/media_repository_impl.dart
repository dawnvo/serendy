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

  /// Search medias list
  @override
  Future<List<Media?>> search(String? title) async {
    final snapshots = await _ref
        .limit(20)
        .where("title", isGreaterThanOrEqualTo: title)
        .where("title", isLessThanOrEqualTo: '$title\uf8ff')
        .get();

    final mediaDataList = snapshots.docs.map((doc) => doc.data());
    final mediaEntities = mediaDataList.map(MediaEntity.fromJson);
    return MediaMapper.toDomainModels(mediaEntities);
  }

  /// Fetch medias list
  @override
  Future<List<Media?>> findMany() async {
    final snapshots = await _ref.limit(20).get();

    final mediaDataList = snapshots.docs.map((doc) => doc.data());
    final mediaEntities = mediaDataList.map(MediaEntity.fromJson);
    return MediaMapper.toDomainModels(mediaEntities);
  }

  /// Fetch media
  @override
  Future<Media?> findOne(MediaID mediaId) async {
    final docRef = _ref.doc(mediaId);
    final mediaData = await docRef.get().then((doc) => doc.data());

    if (mediaData == null) return null;

    final mediaEntity = MediaEntity.fromJson(mediaData);
    return MediaMapper.toDomainModel(mediaEntity);
  }

  /// Create media
  @override
  Future<void> create(Media media) async {
    final mediaEntity = MediaMapper.toDataEntity(media);
    await _ref.doc(media.id).set(mediaEntity.toJson());
  }
}
