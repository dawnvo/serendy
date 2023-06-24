import 'package:serendy/src/core/domain/assert.dart';
import 'package:serendy/src/core/domain/usecase.dart';
import 'package:serendy/src/core/exceptions/core_exception.dart';
import 'package:serendy/src/features/collection/collection.dart';

typedef DeleteCollectionItemPayload = ({
  String executorId,
  String collectionId,
  String mediaId,
});

final class DeleteCollectionItemUsecase
    implements UseCase<DeleteCollectionItemPayload, Collection> {
  const DeleteCollectionItemUsecase(this._collectionRepository);
  final CollectionRepository _collectionRepository;

  @override
  Future<Collection> execute(DeleteCollectionItemPayload payload) async {
    // 테마를 찾을 수 없으면 예외 처리
    final collection = CoreAssert.notEmpty<Collection>(
      await _collectionRepository.findOne(payload.collectionId),
      const EntityNotFoundException(),
    );

    // 권한이 없으면 예외 처리
    final hasAccess = payload.executorId == collection.owner.id;
    CoreAssert.isTrue(hasAccess, const AccessDeniedException());

    final deletedItem = collection.deleteItem(payload.mediaId);

    await _collectionRepository.deleteItem(deletedItem, payload.mediaId);

    return deletedItem;
  }
}
