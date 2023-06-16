import 'package:serendy/_mock.dart';
import 'package:serendy/features/collection/data/collection_repository.dart';
import 'package:serendy/features/collection/domain/collection.dart';

final class CollectionRepositoryFake extends CollectionRepository {
  final List<Collection?> _collections = collectionsMock;

  @override
  Future<List<Collection?>> fetchCollectionList() async {
    return _collections;
  }

  @override
  Stream<List<Collection?>> watchCollectionList() async* {
    yield _collections;
  }

  @override
  Future<Collection> fetchCollection(String id) async {
    final collection = _collections.firstWhere(
      (collection) => collection?.id == id,
    );

    if (collection == null) {
      throw Exception("컬렉션을 찾을 수 없어요.");
    }

    return collection;
  }

  @override
  Stream<Collection?> watchCollection(String id) {
    return watchCollectionList().map((collections) => collections[0]);
  }

  @override
  Future<void> createCollection(Collection collection) async {
    _collections.add(collection);
  }

  @override
  Future<void> updateCollection(Collection collection) async {
    final index = _collections.indexWhere((e) => e?.id == collection.id);
    if (index == -1) return;

    _collections[index] = collection;
  }

  @override
  Future<void> removeCollection(Collection collection) async {
    _collections.removeWhere((e) => e?.id == collection.id);
  }
}
