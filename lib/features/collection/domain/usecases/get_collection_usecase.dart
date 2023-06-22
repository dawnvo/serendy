import 'package:serendy/core/domain/assert.dart';
import 'package:serendy/core/domain/usecase.dart';
import 'package:serendy/core/exceptions/core_exception.dart';
import 'package:serendy/features/collection/collection.dart';

typedef GetCollectionPort = ({
  String? executorId,
  String collectionId,
});

final class GetCollectionUsecase
    implements UseCase<GetCollectionPort, Collection> {
  const GetCollectionUsecase(this._collectionRepository);
  final CollectionRepository _collectionRepository;

  @override
  Future<Collection> execute(GetCollectionPort payload) async {
    // 테마를 찾을 수 없으면 예외 처리
    final collection = CoreAssert.notEmpty<Collection>(
      await _collectionRepository.findOne(payload.collectionId),
      const EntityNotFoundException(overrideMessage: "테마를 찾을 수 없어요."),
    );

    // 테마가 비공개 상태라면 소유자만 조회할 수 있습니다.
    final hasAccess = collection.private == false ||
        payload.executorId == collection.owner.id;
    CoreAssert.isTrue(hasAccess, const AccessDeniedException());

    return collection;
  }
}
