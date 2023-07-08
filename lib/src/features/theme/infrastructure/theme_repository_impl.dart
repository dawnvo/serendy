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
        // * 삭제한 평가는 제외해요.
        .where('removed_at', isNull: true)
        // * 로그인한 사용자의 테마만 가져와요.
        .where('owner.id', isEqualTo: userId)
        // * 날짜순으로 정렬해요.
        .orderBy('created_at')
        .snapshots();

    return streamSnapshots.map((snapshot) => snapshot.docs
        .map((doc) => doc.data())
        .map(ThemeEntity.fromJson)
        .map(ThemeMapper.toDomainModel)
        .toList());
  }

  @override
  Future<List<Theme?>> findMany(UserID? userId) async {
    final snapshot = await _ref.where('removed_at', isNull: true).get();
    return snapshot.docs
        .map((doc) => doc.data())
        .map(ThemeEntity.fromJson)
        .map(ThemeMapper.toDomainModel)
        .toList();
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
    final snapshot = await _ref.doc(themeId).get();
    final data = snapshot.data();

    if (data == null) return null;

    final entity = ThemeEntity.fromJson(data);
    return ThemeMapper.toDomainModel(entity);
  }

  @override
  Future<List<ThemeItem?>> fetchThemeItems(ThemeID themeId) async {
    final snapshots = await _ref //
        .doc(themeId)
        .collection(FirestorePath.themeItem)
        .get();

    return snapshots.docs
        .map((doc) => doc.data())
        .map(ThemeItemEntity.fromJson)
        .map(ThemeItemMapper.toDomainModel)
        .toList();
  }

  @override
  Future<void> create(Theme theme) async {
    final entity = ThemeMapper.toDataEntity(theme);
    final data = entity.toJson();

    //remove prop
    data.remove('items');

    await _ref.doc(theme.id).set(data);
  }

  @override
  Future<void> update(Theme theme) async {
    final entity = ThemeMapper.toDataEntity(theme);
    final data = entity.toJson();

    //remove prop
    data.remove('items');

    await _ref.doc(theme.id).update(data);
  }

  @override
  Future<void> addItem(Theme theme, MediaID mediaId) async {
    final docRef = _ref.doc(theme.id);
    final itemDocRef = docRef.collection(FirestorePath.themeItem).doc(mediaId);

    // * 추가한 항목을 찾아요.
    final itemEntity = theme.items
        .where((item) => item?.media.id == mediaId)
        .map((item) => ThemeItemMapper.toDataEntity(item!))
        .first;

    final batch = firestore.batch();
    batch.set(itemDocRef, itemEntity.toJson());
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
