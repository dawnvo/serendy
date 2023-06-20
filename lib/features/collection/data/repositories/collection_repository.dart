import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:serendy/core/network/firestore_path.dart';
import 'package:serendy/features/collection/collection.dart';
import 'package:serendy/features/collection/data/entities/collection_entity.dart';
import 'package:serendy/features/collection/data/mappers/collection_mapper.dart';
import 'package:serendy/features/collection/domain/ports/persistence/collection_repository_port.dart';
import 'package:serendy/features/media/media.dart';
import 'package:serendy/features/user/user.dart';

final class CollectionRepository implements CollectionRepositoryPort {
  const CollectionRepository(this._firestore);

  final FirebaseFirestore _firestore;

  /// Watch collection list
  @override
  Stream<List<Collection?>> watchMany(UserID? userId) {
    final streamSnapshots = _firestore
        .collection(FirestorePath.collection)
        .where('removed_at', isNull: true)
        .where('owner.id', isEqualTo: userId)
        .orderBy('created_at')
        .snapshots();

    return streamSnapshots.map((snapshot) {
      final collectionDataList = snapshot.docs.map((doc) => doc.data());
      final collectionEntities =
          collectionDataList.map(CollectionEntity.fromJson);
      return CollectionMapper.toDomainModels(collectionEntities);
    });
  }

  /// Get collection list
  @override
  Future<List<Collection?>> findMany(UserID? userId) async {
    final snapshot = await _firestore
        .collection(FirestorePath.collection)
        // 제거된 테마는 필터
        .where('removed_at', isNull: true)
        .get();

    final collectionDataList = snapshot.docs.map((doc) => doc.data());
    final collectionEntities =
        collectionDataList.map(CollectionEntity.fromJson);
    return CollectionMapper.toDomainModels(collectionEntities);
  }

  /// Get collection
  @override
  Future<Collection?> findOne(CollectionID collectionId) async {
    final docRef =
        _firestore.collection(FirestorePath.collection).doc(collectionId);
    final collectionData = await docRef.get().then((doc) => doc.data());

    if (collectionData == null) return null;

    final collectionItemSnapshots =
        await docRef.collection(FirestorePath.collectionItem).get();
    final collectionItemDataList =
        collectionItemSnapshots.docs.map((doc) => doc.data()).toList();

    // ✨ merge
    collectionData['items'] = collectionItemDataList;

    final collectionEntity = CollectionEntity.fromJson(collectionData);
    return CollectionMapper.toDomainModel(collectionEntity);
  }

  /// Create collection
  @override
  Future<void> create(Collection collection) async {
    final collectionEntity = CollectionMapper.toDataEntity(collection);
    final collectionData = collectionEntity.toJson();

    // ⛔ collection_items 속성 제거
    collectionData.remove('items');

    final ref = _firestore.collection(FirestorePath.collection);
    await ref.doc(collection.id).set(collectionData);
  }

  /// Update collection
  @override
  Future<void> update(Collection collection) async {
    final collectionEntity = CollectionMapper.toDataEntity(collection);
    final collectionData = collectionEntity.toJson();

    // ⛔ collection_items 속성 제거
    collectionData.remove('items');

    final ref = _firestore.collection(FirestorePath.collection);
    await ref.doc(collection.id).update(collectionData);
  }

  /// Create collection_item or Update collection_item
  @override
  Future<void> addItem(Collection collection, MediaID mediaId) async {
    final collectionEntity = CollectionMapper.toDataEntity(collection);
    final collectionItemEntity = collectionEntity.items.firstWhere(
      (item) => item?.media.id == mediaId,
    )!;

    final docRef =
        _firestore.collection(FirestorePath.collection).doc(collection.id);
    final collectionItemDocRef =
        docRef.collection(FirestorePath.collectionItem).doc(mediaId);

    final batch = _firestore.batch();

    batch.set(collectionItemDocRef, collectionItemEntity.toJson());
    batch.update(docRef, {
      "item_count": collection.itemCount,
      "updated_at": collection.updatedAt,
    });

    await batch.commit();
  }

  /// Delete collection_item
  @override
  Future<void> deleteItem(Collection collection, MediaID mediaId) async {
    final docRef =
        _firestore.collection(FirestorePath.collection).doc(collection.id);
    final collectionItemDocRef =
        docRef.collection(FirestorePath.collectionItem).doc(mediaId);

    final batch = _firestore.batch();

    batch.delete(collectionItemDocRef);
    batch.update(docRef, {
      "item_count": collection.itemCount,
      "updated_at": collection.updatedAt,
    });

    await batch.commit();
  }
}
