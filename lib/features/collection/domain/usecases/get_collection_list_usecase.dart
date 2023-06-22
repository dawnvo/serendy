import 'package:serendy/core/domain/usecase.dart';
import 'package:serendy/features/collection/collection.dart';

typedef GetCollectionListPort = ({
  String? executorId,
});

final class GetCollectionListUsecase
    implements UseCase<GetCollectionListPort, List<Collection?>> {
  const GetCollectionListUsecase(this._collectionRepository);
  final CollectionRepository _collectionRepository;

  @override
  Future<List<Collection?>> execute(GetCollectionListPort payload) async {
    final collections =
        await _collectionRepository.findMany(payload.executorId);

    return collections.where((collection) {
      return collection?.private == false ||
          collection?.owner.id == payload.executorId;
    }).toList();
  }
}
