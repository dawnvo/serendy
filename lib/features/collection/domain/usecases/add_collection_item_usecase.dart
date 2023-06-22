import 'package:serendy/core/domain/assert.dart';
import 'package:serendy/core/domain/usecase.dart';
import 'package:serendy/core/exceptions/core_exception.dart';
import 'package:serendy/features/collection/collection.dart';
import 'package:serendy/features/media/media.dart';

typedef AddCollectionItemPort = ({
  String executorId,
  String collectionId,
  String mediaId,
});

final class AddCollectionItemUsecase
    implements UseCase<AddCollectionItemPort, Collection> {
  const AddCollectionItemUsecase(
    this._collectionRepository,
    this._mediaRepository,
  );

  final CollectionRepository _collectionRepository;
  final MediaRepository _mediaRepository;

  @override
  Future<Collection> execute(AddCollectionItemPort payload) async {
    // 테마를 찾을 수 없으면 예외 처리
    final collection = CoreAssert.notEmpty<Collection>(
      await _collectionRepository.findOne(payload.collectionId),
      const EntityNotFoundException(overrideMessage: "테마를 찾을 수 없어요."),
    );

    // 권한이 없으면 예외 처리
    final hasAccess = payload.executorId == collection.owner.id;
    CoreAssert.isTrue(hasAccess, const AccessDeniedException());

    // 미디어를 찾을 수 없으면 예외 처리
    final media = CoreAssert.notEmpty<Media>(
      await _mediaRepository.findOne(payload.mediaId),
      const EntityNotFoundException(overrideMessage: "미디어를 찾을 수 없어요."),
    );

    final addedItem = collection.addItem(CollectionItem(
      addedAt: DateTime.now(),
      media: Media(
        id: media.id,
        type: media.type,
        status: media.status,
        title: media.title,
        image: media.image,
        synopsis: media.synopsis,
        keywords: media.keywords,
        isAdult: media.isAdult,
        startDate: media.startDate,
        endDate: media.endDate,
      ),
    ));

    await _collectionRepository.addItem(addedItem, payload.mediaId);

    return addedItem;
  }
}