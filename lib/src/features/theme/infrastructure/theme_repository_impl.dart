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

  @override
  Future<List<Theme?>> findMany(UserID? userId) async {
    final snapshot = await _ref.where('removed_at', isNull: true).get();

    final themeDataList = snapshot.docs.map((doc) => doc.data());
    final themeEntities = themeDataList.map(ThemeEntity.fromJson);
    return ThemeMapper.toDomainModels(themeEntities);
  }

  @override
  Future<Theme?> findOne(ThemeID themeId) async {
    final theme = await fetchTheme(themeId);
    if (theme == null) return null;

    final items = await fetchThemeItems(themeId);
    return theme.copy(items: items);
  }

  @override
  Future<Theme?> fetchTheme(ThemeID themeId) async {
    final docRef = _ref.doc(themeId);
    final themeData = await docRef.get().then((doc) => doc.data());

    if (themeData == null) return null;

    final themeEntity = ThemeEntity.fromJson(themeData);
    return ThemeMapper.toDomainModel(themeEntity);
  }

  @override
  Future<List<ThemeItem?>> fetchThemeItems(ThemeID themeId) async {
    final itemDocRef = _ref.doc(themeId).collection(FirestorePath.themeItem);

    final snapshots = await itemDocRef.get();
    final themeItems = snapshots.docs
        .map((doc) => doc.data())
        .map(ThemeItemEntity.fromJson)
        .map(themeItemMapper)
        .toList();

    return themeItems;
  }

  @override
  Future<void> create(Theme theme) async {
    final themeEntity = ThemeMapper.toDataEntity(theme);
    final themeData = themeEntity.toJson();

    //remove prop
    themeData.remove('items');

    await _ref.doc(theme.id).set(themeData);
  }

  @override
  Future<void> update(Theme theme) async {
    final themeEntity = ThemeMapper.toDataEntity(theme);
    final themeData = themeEntity.toJson();

    //remove prop
    themeData.remove('items');

    await _ref.doc(theme.id).update(themeData);
  }

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
