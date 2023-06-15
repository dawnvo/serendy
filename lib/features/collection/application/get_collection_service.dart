import 'package:serendy/core/assert.dart';
import 'package:serendy/core/usecase.dart';
import 'package:serendy/features/collection/data/collection_repository.dart';
import 'package:serendy/features/collection/domain/collection.dart';

typedef GetCollectionPayload = ({
  String executorId,
  String collectionId,
});

/// Get collection
///
/// 1. 컬렉션이 존재하는지 확인해요.
/// 2. 비공개 컬렉션는 소유자만 조회할 수 있어요.
typedef GetCollectionUseCase = UseCase<GetCollectionPayload, Collection>;

final class GetCollectionService implements GetCollectionUseCase {
  const GetCollectionService(this._collectionRepository);

  final CollectionRepository _collectionRepository;

  @override
  Future<Collection> execute(GetCollectionPayload payload) async {
    // [1]
    final collection = CoreAssert.notEmpty<Collection>(
      await _collectionRepository.fetchCollection(payload.collectionId),
      Exception("컬렉션을 찾을 수 없어요."),
    );

    // [2]
    final hasAccess = collection.private == false ||
        collection.owner.id == payload.executorId;
    CoreAssert.isTrue(hasAccess, Exception('접근 권한이 없어요.'));

    return collection;
  }
}
