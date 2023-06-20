import 'package:serendy/core/domain/assert.dart';
import 'package:serendy/core/domain/usecase.dart';
import 'package:serendy/core/exceptions/core_exception.dart';
import 'package:serendy/core/network/media_file_storage.dart';
import 'package:serendy/features/collection/collection.dart';
import 'package:serendy/features/collection/domain/ports/persistence/collection_repository_port.dart';
import 'package:serendy/features/collection/domain/ports/usecases/remove_collection_port.dart';

final class RemoveCollectionUsecase
    implements UseCase<RemoveCollectionPort, void> {
  const RemoveCollectionUsecase(
    this._collectionRepository,
    this._collectionFileStorage,
  );

  final CollectionRepositoryPort _collectionRepository;
  final MediaFileStoragePort _collectionFileStorage;

  @override
  Future<void> execute(RemoveCollectionPort payload) async {
    // 테마를 찾을 수 없으면 예외 처리
    final collection = CoreAssert.notEmpty<Collection>(
      await _collectionRepository.findOne(payload.collectionId),
      const EntityNotFoundException(overrideMessage: "테마를 찾을 수 없어요."),
    );

    // 권한이 없으면 예외 처리
    final hasAccess = payload.executorId == collection.owner.id;
    CoreAssert.isTrue(hasAccess, const AccessDeniedException());

    // 테마에 이미지가 있으면 스토리지에서 이미지를 제거합니다.
    if (collection.image != null) {
      await _collectionFileStorage.delete(collection.id);
    }

    final removed = collection.remove();
    await _collectionRepository.update(removed);
  }
}
