import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:serendy/core/persistence/firestore_path.dart';
import 'package:serendy/features/collection/collection.dart';
import 'package:serendy/features/collection/infrastructure/collection_entity.dart';
import 'package:serendy/features/collection/infrastructure/collection_mapper.dart';
import 'package:serendy/features/media/media.dart';
import 'package:serendy/features/user/user.dart';

final class CollectionRepositoryImpl implements CollectionRepository {
  CollectionRepositoryImpl(this.firestore)
      : _ref = firestore.collection(FirestorePath.collection);

  final FirebaseFirestore firestore;
  final CollectionReference<Map<String, dynamic>> _ref;

  /// Watch collections list
  ///
  /// 해당 사용자의 컬렉션만 불러와요.
  @override
  Stream<List<Collection?>> watchMany(UserID userId) {
    final streamSnapshots = _ref
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

  /// Fetch collections list
  @override
  Future<List<Collection?>> findMany(UserID? userId) async {
    final snapshot = await _ref.where('removed_at', isNull: true).get();

    final collectionDataList = snapshot.docs.map((doc) => doc.data());
    final collectionEntities =
        collectionDataList.map(CollectionEntity.fromJson);
    return CollectionMapper.toDomainModels(collectionEntities);
  }

  /// Fetch collection
  @override
  Future<Collection?> findOne(CollectionID collectionId) async {
    final docRef = _ref.doc(collectionId);
    final collectionData = await docRef.get().then((doc) => doc.data());

    if (collectionData == null) return null;

    // 컬렉션 항목을 불러와요.
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

    // ⛔ items 속성 제거
    collectionData.remove('items');
    await _ref.doc(collection.id).set(collectionData);
  }

  /// Update collection
  @override
  Future<void> update(Collection collection) async {
    final collectionEntity = CollectionMapper.toDataEntity(collection);
    final collectionData = collectionEntity.toJson();

    // ⛔ items 속성 제거
    collectionData.remove('items');
    await _ref.doc(collection.id).update(collectionData);
  }

  /// Add collection item
  @override
  Future<void> addItem(Collection collection, MediaID mediaId) async {
    final collectionEntity = CollectionMapper.toDataEntity(collection);
    final collectionItemEntity = collectionEntity.items.firstWhere(
      (item) => item?.media.id == mediaId,
    )!;

    final docRef = _ref.doc(collection.id);
    final itemDocRef =
        docRef.collection(FirestorePath.collectionItem).doc(mediaId);

    final batch = firestore.batch();
    batch.set(itemDocRef, collectionItemEntity.toJson());
    batch.update(docRef, {
      "item_count": collection.itemCount,
      "updated_at": collection.updatedAt,
    });
    await batch.commit();
  }

  /// Delete collection item
  @override
  Future<void> deleteItem(Collection collection, MediaID mediaId) async {
    final docRef = _ref.doc(collection.id);
    final itemDocRef =
        docRef.collection(FirestorePath.collectionItem).doc(mediaId);

    final batch = firestore.batch();
    batch.delete(itemDocRef);
    batch.update(docRef, {
      "item_count": collection.itemCount,
      "updated_at": collection.updatedAt,
    });
    await batch.commit();
  }
}
