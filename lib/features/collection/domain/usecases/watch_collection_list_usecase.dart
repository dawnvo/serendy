import 'package:serendy/core/domain/usecase.dart';
import 'package:serendy/features/collection/collection.dart';

typedef WatchCollectionListPayload = ({
  String userId,
});

final class WatchCollectionListUsecase
    implements StreamUseCase<WatchCollectionListPayload, List<Collection?>> {
  const WatchCollectionListUsecase(this._collectionRepository);
  final CollectionRepository _collectionRepository;

  @override
  Stream<List<Collection?>> execute(WatchCollectionListPayload payload) {
    final collections = _collectionRepository.watchMany(payload.userId);
    return collections;
  }
}
