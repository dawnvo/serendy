import 'package:serendy/core/domain/assert.dart';
import 'package:serendy/core/domain/usecase.dart';
import 'package:serendy/core/exceptions/core_exception.dart';
import 'package:serendy/features/collection/collection.dart';
import 'package:serendy/features/collection/domain/ports/persistence/collection_repository_port.dart';
import 'package:serendy/features/collection/domain/ports/usecases/delete_collection_item_port.dart';

final class DeleteCollectionItemUsecase
    implements UseCase<DeleteCollectionItemPort, Collection> {
  const DeleteCollectionItemUsecase(this._collectionRepository);

  final CollectionRepositoryPort _collectionRepository;

  @override
  Future<Collection> execute(DeleteCollectionItemPort payload) async {
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
