import 'package:serendy/features/collection/domain/collection.dart';
import 'package:serendy/features/user/domain/user.dart';

abstract class CollectionRepository {
  Future<List<Collection?>> fetchCollectionsList([UserID? ownerId]);

  Stream<List<Collection?>> watchCollectionsList();

  Future<Collection> fetchCollection(CollectionID collectionId);

  Stream<Collection?> watchCollection(CollectionID collectionId);

  Future<Collection> createCollection(String title);

  Future<void> updateCollection(Collection collection);

  Future<void> removeCollection(Collection collection);
}
