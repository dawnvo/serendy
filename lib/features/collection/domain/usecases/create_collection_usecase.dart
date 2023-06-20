import 'package:serendy/core/domain/assert.dart';
import 'package:serendy/core/domain/usecase.dart';
import 'package:serendy/core/exceptions/core_exception.dart';
import 'package:serendy/features/collection/collection.dart';
import 'package:serendy/features/collection/domain/ports/persistence/collection_repository_port.dart';
import 'package:serendy/features/collection/domain/ports/usecases/create_collection_port.dart';
import 'package:serendy/features/user/domain/ports/persistence/user_repository_port.dart';
import 'package:serendy/features/user/user.dart';

final class CreateCollectionUsecase
    implements UseCase<CreateCollectionPort, Collection> {
  const CreateCollectionUsecase(
    this._collectionRepository,
    this._userRepository,
  );

  final CollectionRepositoryPort _collectionRepository;
  final UserRepositoryPort _userRepository;

  @override
  Future<Collection> execute(CreateCollectionPort payload) async {
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
