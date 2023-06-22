import 'package:serendy/core/domain/assert.dart';
import 'package:serendy/core/domain/usecase.dart';
import 'package:serendy/core/exceptions/core_exception.dart';
import 'package:serendy/core/persistence/file_storage.dart';
import 'package:serendy/features/collection/collection.dart';

typedef RemoveCollectionPayload = ({
  String executorId,
  String collectionId,
});

final class RemoveCollectionUsecase
    implements UseCase<RemoveCollectionPayload, void> {
  const RemoveCollectionUsecase(
    this._collectionRepository,
    this._fileStorage,
  );

  final CollectionRepository _collectionRepository;
  final FileStorage _fileStorage;

  @override
  Future<void> execute(RemoveCollectionPayload payload) async {
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
      await _fileStorage.delete(collection.id);
    }

    final removed = collection.remove();
    await _collectionRepository.update(removed);
  }
}
