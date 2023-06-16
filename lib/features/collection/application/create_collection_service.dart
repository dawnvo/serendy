import 'package:serendy/core/core.dart';
import 'package:serendy/features/collection/data/collection_repository.dart';

typedef CreateCollectionPayload = ({
  String title,
});

typedef CreateCollectionUseCase = UseCase<CreateCollectionPayload, void>;

final class CreateCollectionService implements CreateCollectionUseCase {
  const CreateCollectionService(this._repository);
  final CollectionRepository _repository;

  @override
  Future<void> execute(CreateCollectionPayload payload) async {
    await _repository.createCollection(payload.title);
  }
}
