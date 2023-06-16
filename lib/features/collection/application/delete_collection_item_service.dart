import 'package:serendy/core/core.dart';
import 'package:serendy/features/collection/data/collection_repository.dart';
import 'package:serendy/features/collection/domain/collection.dart';

typedef DeleteCollectionItemPayload = ({
  String executorId,
  String collectionId,
  String mediaId,
});

/// Delete collection item
///
/// 1. 컬렉션이 존재하는지 확인해요.
/// 2. 올바른 실행자인지 확인해요.
/// 3. 컬렉션의 항목을 삭제해요.
typedef DeleteCollectionItemUseCase
    = UseCase<DeleteCollectionItemPayload, Collection>;

final class DeleteCollectionItemService implements DeleteCollectionItemUseCase {
  const DeleteCollectionItemService(this._collectionRepository);

  final CollectionRepository _collectionRepository;

  @override
  Future<Collection> execute(DeleteCollectionItemPayload payload) async {
    // [1]
    final collection = CoreAssert.notEmpty<Collection>(
      await _collectionRepository.fetchCollection(payload.collectionId),
      Exception("컬렉션을 찾을 수 없어요."),
    );

    // [2]
    final hasAccess = payload.executorId == collection.owner.id;
    CoreAssert.isTrue(hasAccess, Exception('접근 권한이 없어요.'));

    // [3]
    final itemDeleted = collection.deleteItem(payload.mediaId);
    await _collectionRepository.updateCollection(itemDeleted);

    return itemDeleted;
  }
}
