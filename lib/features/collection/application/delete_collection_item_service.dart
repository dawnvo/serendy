import 'package:serendy/core/core.dart';
import 'package:serendy/features/collection/data/collection_repository.dart';
import 'package:serendy/features/collection/domain/collection.dart';

typedef DeleteCollectionItemPayload = ({
  String collectionId,
  String mediaId,
});

typedef DeleteCollectionItemUseCase
    = UseCase<DeleteCollectionItemPayload, Collection>;

final class DeleteCollectionItemService implements DeleteCollectionItemUseCase {
  const DeleteCollectionItemService(this._repository);
  final CollectionRepository _repository;

  @override
  Future<Collection> execute(DeleteCollectionItemPayload payload) async {
    throw UnimplementedError();
  }
}
