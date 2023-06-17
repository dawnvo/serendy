import 'package:serendy/features/collection/domain/collection.dart';

abstract class CollectionRepository {
  Future<List<Collection?>> fetchCollectionsList({String? ownerId});

  Future<Collection> fetchCollection({required String collectionId});

  Future<void> createCollection({required String title});

  Future<void> editCollection({
    required String collectionId,
    String? title,
    String? description,
    String? image,
    bool? private,
  });

  Future<void> removeCollection({required String collectionId});
}
