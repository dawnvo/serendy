import 'package:serendy/src/features/collection/collection.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/user/user.dart';

abstract class CollectionRepository {
  Stream<List<Collection?>> watchMany(UserID userId);

  Future<List<Collection?>> findMany(UserID? userId);

  Future<Collection?> findOne(String collectionId);

  Future<void> create(Collection collection);

  Future<void> update(Collection collection);

  Future<void> addItem(Collection collection, MediaID mediaId);

  Future<void> deleteItem(Collection collection, MediaID mediaId);
}
