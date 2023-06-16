import 'package:serendy/features/collection/domain/collection.dart';

abstract class CollectionRepository {
  Future<List<Collection?>> fetchCollectionList();

  Stream<List<Collection?>> watchCollectionList();

  Future<Collection> fetchCollection(String id);

  Stream<Collection?> watchCollection(String id);

  Future<void> createCollection(Collection collection);

  Future<void> updateCollection(Collection collection);

  Future<void> removeCollection(Collection collection);
}
