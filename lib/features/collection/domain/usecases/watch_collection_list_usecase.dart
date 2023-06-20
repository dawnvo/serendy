import 'package:serendy/core/domain/usecase.dart';
import 'package:serendy/features/collection/collection.dart';
import 'package:serendy/features/collection/domain/ports/persistence/collection_repository_port.dart';
import 'package:serendy/features/collection/domain/ports/usecases/watch_collection_list_port.dart';

final class WatchCollectionListUsecase
    implements StreamUseCase<WatchCollectionListPort, List<Collection?>> {
  const WatchCollectionListUsecase(this._collectionRepository);

  final CollectionRepositoryPort _collectionRepository;

  @override
  Stream<List<Collection?>> execute(WatchCollectionListPort payload) {
    final collections = _collectionRepository.watchMany(payload.userId);
    return collections;
  }
}
