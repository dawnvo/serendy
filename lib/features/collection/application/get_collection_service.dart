import 'package:serendy/core/core.dart';
import 'package:serendy/features/collection/data/collection_repository.dart';
import 'package:serendy/features/collection/domain/collection.dart';

typedef GetCollectionPayload = ({
  String collectionId,
});

typedef GetCollectionUseCase = UseCase<GetCollectionPayload, Collection>;

final class GetCollectionService implements GetCollectionUseCase {
  const GetCollectionService(this._collectionRepository);
  final CollectionRepository _collectionRepository;

  @override
  Future<Collection> execute(GetCollectionPayload payload) async {
    final collection = await _collectionRepository.fetchCollection(
      payload.collectionId,
    );

    return collection;
  }
}
