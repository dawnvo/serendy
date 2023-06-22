import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:serendy/core/persistence/firestore_path.dart';
import 'package:serendy/features/media/infrastructure/media_entity.dart';
import 'package:serendy/features/media/infrastructure/media_mapper.dart';
import 'package:serendy/features/media/media.dart';

final class MediaRepositoryImpl implements MediaRepository {
  MediaRepositoryImpl(this.firestore)
      : _ref = firestore.collection(FirestorePath.media);

  final FirebaseFirestore firestore;
  final CollectionReference<Map<String, dynamic>> _ref;

  /// Fetch medias list
  @override
  Future<List<Media?>> findMany(String? title) async {
    final snapshots = await _ref
        // .where("title", isGreaterThanOrEqualTo: query.title)
        .where("title", isEqualTo: title)
        .get();

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
