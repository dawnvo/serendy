import 'package:serendy/core/core.dart';
import 'package:serendy/features/collection/data/collection_repository.dart';
import 'package:serendy/features/collection/domain/collection.dart';

typedef RemoveCollectionPayload = ({
  String collectionId,
});

typedef RemoveCollectionUseCase = UseCase<RemoveCollectionPayload, void>;

final class RemoveCollectionService implements RemoveCollectionUseCase {
  const RemoveCollectionService(this._repository);
  final CollectionRepository _repository;

  @override
  Future<Collection> execute(RemoveCollectionPayload payload) async {
    throw UnimplementedError();
  }
}
