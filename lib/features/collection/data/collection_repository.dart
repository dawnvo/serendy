import 'package:serendy/features/collection/domain/collection.dart';

abstract class CollectionRepository {
  Future<List<Collection?>> fetchCollectionList();

  Stream<List<Collection?>> watchCollectionList();

  Future<Collection> fetchCollection(String collectionId);

  Stream<Collection?> watchCollection(String collectionId);

  Future<void> createCollection(Collection collection);

  Future<void> updateCollection(Collection collection);

  Future<void> removeCollection(Collection collection);
}
