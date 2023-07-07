import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:serendy/src/core/persistence/firestore_path.dart';
import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/features/theme/infrastructure/theme_entity.dart';
import 'package:serendy/src/features/theme/infrastructure/theme_mapper.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/user/user.dart';

final class ThemeRepositoryImpl implements ThemeRepository {
  ThemeRepositoryImpl(this.firestore)
      : _ref = firestore.collection(FirestorePath.theme);

  final FirebaseFirestore firestore;
  final CollectionReference<Map<String, dynamic>> _ref;

  /// Watch themes list
  ///
  /// 해당 사용자의 테마만 불러와요.
  @override
  Stream<List<Theme?>> watchMany(UserID userId) {
    final streamSnapshots = _ref
        .where('removed_at', isNull: true)
        .where('owner.id', isEqualTo: userId)
        .orderBy('created_at')
        .snapshots();

    return streamSnapshots.map((snapshot) {
      final themeDataList = snapshot.docs.map((doc) => doc.data());
      final themeEntities = themeDataList.map(ThemeEntity.fromJson);
      return ThemeMapper.toDomainModels(themeEntities);
    });
  }

  /// Fetch themes list
  @override
  Future<List<Theme?>> findMany(UserID? userId) async {
    final snapshot = await _ref.where('removed_at', isNull: true).get();

    final themeDataList = snapshot.docs.map((doc) => doc.data());
    final themeEntities = themeDataList.map(ThemeEntity.fromJson);
    return ThemeMapper.toDomainModels(themeEntities);
  }

  /// Fetch theme
  @override
  Future<Theme?> findOne(ThemeID themeId) async {
    final docRef = _ref.doc(themeId);
    final themeData = await docRef.get().then((doc) => doc.data());

    if (themeData == null) return null;

    // 테마 항목을 불러와요.
    final themeItemSnapshots =
        await docRef.collection(FirestorePath.themeItem).get();
    final themeItemDataList =
        themeItemSnapshots.docs.map((doc) => doc.data()).toList();

    // ✨ merge
    themeData['items'] = themeItemDataList;

    final themeEntity = ThemeEntity.fromJson(themeData);
    return ThemeMapper.toDomainModel(themeEntity);
  }

  /// Create theme
  @override
  Future<void> create(Theme theme) async {
    final themeEntity = ThemeMapper.toDataEntity(theme);
    final themeData = themeEntity.toJson();

    // ⛔ items 속성 제거
    themeData.remove('items');
    await _ref.doc(theme.id).set(themeData);
  }

  /// Update theme
  @override
  Future<void> update(Theme theme) async {
    final themeEntity = ThemeMapper.toDataEntity(theme);
    final themeData = themeEntity.toJson();

    // ⛔ items 속성 제거
    themeData.remove('items');
    await _ref.doc(theme.id).update(themeData);
  }

  /// Add theme item
  @override
  Future<void> addItem(Theme theme, MediaID mediaId) async {
    final themeEntity = ThemeMapper.toDataEntity(theme);
    final themeItemEntity = themeEntity.items.firstWhere(
      (item) => item?.media.id == mediaId,
    )!;

    final docRef = _ref.doc(theme.id);
    final itemDocRef = docRef.collection(FirestorePath.themeItem).doc(mediaId);

    final batch = firestore.batch();
    batch.set(itemDocRef, themeItemEntity.toJson());
    batch.update(docRef, {
      "item_count": theme.itemCount,
      "updated_at": theme.updatedAt,
    });
    await batch.commit();
  }

  /// Delete theme item
  @override
  Future<void> deleteItem(Theme theme, MediaID mediaId) async {
    final docRef = _ref.doc(theme.id);
    final itemDocRef = docRef.collection(FirestorePath.themeItem).doc(mediaId);

    final batch = firestore.batch();
    batch.delete(itemDocRef);
    batch.update(docRef, {
      "item_count": theme.itemCount,
      "updated_at": theme.updatedAt,
    });
    await batch.commit();
  }
}
