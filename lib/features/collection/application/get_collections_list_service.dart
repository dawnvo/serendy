import 'package:serendy/core/usecase.dart';
import 'package:serendy/features/collection/data/collection_repository.dart';
import 'package:serendy/features/collection/domain/collection.dart';

typedef GetCollectionsListPayload = ({
  String executorId,
});

/// Get collections list
///
/// 1. 컬렉션 목록을 조회해요.
/// -. 제거한 컬렉션는 조회하지 않아요.
/// -. 비공개 컬렉션는 소유자만 조회할 수 있어요.
typedef GetCollectionsListUseCase
    = UseCase<GetCollectionsListPayload, List<Collection?>>;

final class GetCollectionsListService implements GetCollectionsListUseCase {
  const GetCollectionsListService(this._collectionRepository);

  final CollectionRepository _collectionRepository;

  @override
  Future<List<Collection?>> execute(GetCollectionsListPayload payload) async {
    // [1]
    final collections = await _collectionRepository.fetchCollectionList();

    return collections;
  }
}
