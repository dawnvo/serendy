import 'package:serendy/core/core.dart';
import 'package:serendy/features/collection/data/collection_repository.dart';
import 'package:serendy/features/collection/domain/collection.dart';
import 'package:serendy/features/media/data/media_repository.dart';
import 'package:serendy/features/media/domain/media.dart';

typedef AddCollectionItemPayload = ({
  String executorId,
  String collectionId,
  String mediaId,
});

/// Add collection item
///
/// 1. 컬렉션이 존재하는지 확인해요.
/// 2. 올바른 실행자인지 확인해요.
/// 3. 미디어가 존재하는지 확인해요.
/// 4. 컬렉션에 항목을 추가해요.
typedef AddCollectionItemUseCase
    = UseCase<AddCollectionItemPayload, Collection>;

final class AddCollectionItemService implements AddCollectionItemUseCase {
  const AddCollectionItemService(
    this._collectionRepository,
    this._mediaRepository,
  );

  final CollectionRepository _collectionRepository;
  final MediaRepository _mediaRepository;

  @override
  Future<Collection> execute(AddCollectionItemPayload payload) async {
    // [1]
    final collection = CoreAssert.notEmpty<Collection>(
      await _collectionRepository.fetchCollection(payload.collectionId),
      Exception("컬렉션을 찾을 수 없어요."),
    );

    // [2]
    final hasAccess = payload.executorId == collection.owner.id;
    CoreAssert.isTrue(hasAccess, Exception('접근 권한이 없어요.'));

    // [3]
    final media = CoreAssert.notEmpty<Media>(
      await _mediaRepository.fetchMedia(payload.mediaId),
      Exception("미디어를 찾을 수 없어요."),
    );

    // [4]
    final itemAdded = collection.addItem(CollectionItem(
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

    await _collectionRepository.updateCollection(itemAdded);

    return itemAdded;
  }
}
