import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:serendy/core/network/firestore_path.dart';
import 'package:serendy/features/media/data/entities/media_entity.dart';
import 'package:serendy/features/media/data/mappers/media_mapper.dart';
import 'package:serendy/features/media/domain/ports/persistence/media_repository_port.dart';
import 'package:serendy/features/media/media.dart';

final class MediaRepository implements MediaRepositoryPort {
  final FirebaseFirestore _firestore;

  const MediaRepository(this._firestore);

  /// Get media
  @override
  Future<Media?> getMedia(MediaID mediaId) async {
    final docRef = _firestore.collection(FirestorePath.media).doc(mediaId);
    final mediaData = await docRef.get().then((doc) => doc.data());

    if (mediaData == null) return null;

    final mediaEntity = MediaEntity.fromJson(mediaData);
    return MediaMapper.toDomainModel(mediaEntity);
  }

  /// Search media
  @override
  Future<List<Media?>> search(MediaSearchQuery query) async {
    final snapshots = await _firestore
        .collection(FirestorePath.media)
        // .where("title", isGreaterThanOrEqualTo: query.title)
        .where("title", isEqualTo: query.title)
        .get();

    final mediaDataList = snapshots.docs.map((doc) => doc.data());
    final mediaEntities = mediaDataList.map(MediaEntity.fromJson);
    return MediaMapper.toDomainModels(mediaEntities);
  }

  /// Add media
  @override
  Future<void> addMedia(Media media) async {
    final mediaEntity = MediaMapper.toDataEntity(media);
    final ref = _firestore.collection(FirestorePath.media).doc(media.id);
    await ref.set(mediaEntity.toJson());
  }
}
