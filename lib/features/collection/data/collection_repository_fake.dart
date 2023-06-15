import 'package:serendy/features/collection/data/collection_repository.dart';
import 'package:serendy/features/collection/domain/collection.dart';

final class CollectionRepositoryFake extends CollectionRepository {
  @override
  Future<void> createCollection(Collection collection) {
    throw UnimplementedError();
  }

  @override
  Future<Collection?> fetchCollection(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<Collection?>> fetchCollectionList() {
    throw UnimplementedError();
  }

  @override
  Future<void> removeCollection(Collection collection) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateCollection(Collection collection) {
    throw UnimplementedError();
  }

  @override
  Stream<Collection?> watchCollection(String id) {
    throw UnimplementedError();
  }

  @override
  Stream<List<Collection?>> watchCollectionList() {
    throw UnimplementedError();
  }
}
