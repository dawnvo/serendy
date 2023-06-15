import 'package:serendy/core/assert.dart';
import 'package:serendy/core/usecase.dart';
import 'package:serendy/features/collection/data/collection_repository.dart';
import 'package:serendy/features/collection/domain/collection.dart';

typedef EditCollectionPayload = ({
  String executorId,
  String collectionId,
  String? title,
  String? description,
  String? image,
  bool? private,
});

/// Edit collection
///
/// 1. 컬렉션이 존재하는지 확인해요.
/// 2. 올바른 실행자인지 확인해요.
/// 3. 컬렉션을 수정해요.
typedef EditCollectionUseCase = UseCase<EditCollectionPayload, Collection>;

final class EditCollectionService implements EditCollectionUseCase {
  const EditCollectionService(this._collectionRepository);

  final CollectionRepository _collectionRepository;

  @override
  Future<Collection> execute(EditCollectionPayload payload) async {
    // [1]
    final collection = CoreAssert.notEmpty<Collection>(
      await _collectionRepository.fetchCollection(payload.collectionId),
      Exception("컬렉션을 찾을 수 없어요."),
    );

    // [2]
    final hasAccess = payload.executorId == collection.owner.id;
    CoreAssert.isTrue(hasAccess, Exception('접근 권한이 없어요.'));

    // [3]
    final edited = collection.edit(
      image: payload.image,
      title: payload.title,
      description: payload.description,
      private: payload.private,
    );

    await _collectionRepository.updateCollection(edited);

    return edited;
  }
}
