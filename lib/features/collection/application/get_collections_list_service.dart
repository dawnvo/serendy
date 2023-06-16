import 'package:serendy/core/core.dart';
import 'package:serendy/features/collection/data/collection_repository.dart';
import 'package:serendy/features/collection/domain/collection.dart';

typedef GetCollectionsListPayload = ({
  String ownerId,
});

typedef GetCollectionsListUseCase
    = UseCase<GetCollectionsListPayload, List<Collection?>>;

final class GetCollectionsListService implements GetCollectionsListUseCase {
  const GetCollectionsListService(this._repository);
  final CollectionRepository _repository;

  @override
  Future<List<Collection?>> execute(GetCollectionsListPayload payload) async {
    final collections = await _repository.fetchCollectionsList();
    return collections;
  }
}
