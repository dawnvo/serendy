import 'package:serendy/core/domain/assert.dart';
import 'package:serendy/core/domain/usecase.dart';
import 'package:serendy/core/exceptions/core_exception.dart';
import 'package:serendy/core/persistence/media_file_storage.dart';
import 'package:serendy/features/collection/collection.dart';

typedef EditCollectionPort = ({
  String executorId,
  String collectionId,
  String? title,
  String? description,
  String? image,
  bool? private,
});

final class EditCollectionUsecase
    implements UseCase<EditCollectionPort, Collection> {
  const EditCollectionUsecase(
    this._collectionRepository,
    this._mediaFileStorage,
  );

  final CollectionRepository _collectionRepository;
  final MediaFileStorage _mediaFileStorage;

  @override
  Future<Collection> execute(EditCollectionPort payload) async {
    // 테마를 찾을 수 없으면 예외 처리
    final collection = CoreAssert.notEmpty<Collection>(
      await _collectionRepository.findOne(payload.collectionId),
      const EntityNotFoundException(overrideMessage: "테마를 찾을 수 없어요."),
    );

    // 권한이 없으면 예외 처리
    final hasAccess = payload.executorId == collection.owner.id;
    CoreAssert.isTrue(hasAccess, const AccessDeniedException());

    // 이미지가 있고, 이전과 다른 이미지라면 스토리지에 업로드를 진행합니다.
    String? downloadUrl;
    if (payload.image != null &&
        payload.image!.isNotEmpty &&
        payload.image != collection.image) {
      downloadUrl =
          await _mediaFileStorage.upload(collection.id, payload.image!);
    }

    // 데이터베이스에 있는 테마를 수정합니다.
    final edited = collection.edit(
      title: payload.title,
      description: payload.description,
      image: downloadUrl,
      private: payload.private,
    );

    await _collectionRepository.update(edited);

    return edited;
  }
}
