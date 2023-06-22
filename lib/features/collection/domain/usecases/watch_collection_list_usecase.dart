import 'package:serendy/core/domain/usecase.dart';
import 'package:serendy/features/collection/collection.dart';

typedef WatchCollectionListPort = ({
  String userId,
});

final class WatchCollectionListUsecase
    implements StreamUseCase<WatchCollectionListPort, List<Collection?>> {
  const WatchCollectionListUsecase(this._collectionRepository);
  final CollectionRepository _collectionRepository;

  @override
  Stream<List<Collection?>> execute(WatchCollectionListPort payload) {
    final collections = _collectionRepository.watchMany(payload.userId);
    return collections;
  }
}
