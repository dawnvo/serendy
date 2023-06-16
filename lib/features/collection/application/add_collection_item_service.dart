import 'package:serendy/core/core.dart';
import 'package:serendy/features/collection/data/collection_repository.dart';
import 'package:serendy/features/collection/domain/collection.dart';

typedef AddCollectionItemPayload = ({
  String collectionId,
  String mediaId,
});

typedef AddCollectionItemUseCase
    = UseCase<AddCollectionItemPayload, Collection>;

final class AddCollectionItemService implements AddCollectionItemUseCase {
  const AddCollectionItemService(this._repository);
  final CollectionRepository _repository;

  @override
  Future<Collection> execute(AddCollectionItemPayload payload) async {
    throw UnimplementedError();
  }
}
