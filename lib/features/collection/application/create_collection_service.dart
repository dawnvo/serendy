import 'package:serendy/core/core.dart';
import 'package:serendy/features/collection/data/collection_repository.dart';
import 'package:serendy/features/collection/domain/collection.dart';

typedef CreateCollectionPayload = ({
  String title,
});

typedef CreateCollectionUseCase = UseCase<CreateCollectionPayload, Collection>;

final class CreateCollectionService implements CreateCollectionUseCase {
  const CreateCollectionService(this._repository);
  final CollectionRepository _repository;

  @override
  Future<Collection> execute(CreateCollectionPayload payload) async {
    final collection = await _repository.createCollection(payload.title);
    return collection;
  }
}
