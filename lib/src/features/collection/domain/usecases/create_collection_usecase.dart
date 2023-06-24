import 'package:serendy/src/core/domain/assert.dart';
import 'package:serendy/src/core/domain/usecase.dart';
import 'package:serendy/src/core/exceptions/core_exception.dart';
import 'package:serendy/src/features/collection/collection.dart';
import 'package:serendy/src/features/user/user.dart';

typedef CreateCollectionPayload = ({
  String executorId,
  String title,
});

final class CreateCollectionUsecase
    implements UseCase<CreateCollectionPayload, Collection> {
  const CreateCollectionUsecase(
    this._collectionRepository,
    this._userRepository,
  );

  final CollectionRepository _collectionRepository;
  final UserRepository _userRepository;

  @override
  Future<Collection> execute(CreateCollectionPayload payload) async {
    // 사용자를 찾을 수 없으면 예외 처리
    final user = CoreAssert.notEmpty<User>(
      await _userRepository.findOne(payload.executorId),
      const EntityNotFoundException(overrideMessage: "사용자를 찾을 수 없어요."),
    );

    // 데이터베이스에 새로운 테마를 생성합니다.
    final collection = Collection(
      owner: CollectionOwner(
        id: payload.executorId,
        name: user.name,
      ),
      title: payload.title,
    );

    await _collectionRepository.create(collection);

    return collection;
  }
}
