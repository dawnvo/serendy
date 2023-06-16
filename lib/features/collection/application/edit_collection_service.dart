import 'package:serendy/core/core.dart';
import 'package:serendy/features/collection/data/collection_repository.dart';

typedef EditCollectionPayload = ({
  String collectionId,
  String? title,
  String? description,
  String? image,
  bool? private,
});

typedef EditCollectionUseCase = UseCase<EditCollectionPayload, void>;

final class EditCollectionService implements EditCollectionUseCase {
  const EditCollectionService(this._repository);
  final CollectionRepository _repository;

  @override
  Future<void> execute(EditCollectionPayload payload) async {
    await _repository.editCollection(
      collectionId: payload.collectionId,
      title: payload.title,
      image: payload.image,
      private: payload.private,
      description: payload.description,
    );
  }
}
