import 'package:serendy/core/core.dart';
import 'package:serendy/features/collection/data/collection_repository.dart';
import 'package:serendy/features/collection/domain/collection.dart';
import 'package:serendy/features/user/data/user_repository.dart';
import 'package:serendy/features/user/domain/user.dart';

typedef CreateCollectionPayload = ({
  String executorId,
  String title,
});

/// Create collection
///
/// 1. 사용자가 존재하는지 확인해요.
/// 2. 컬렉션을 생성해요.
typedef CreateCollectionUseCase = UseCase<CreateCollectionPayload, Collection>;

final class CreateCollectionService implements CreateCollectionUseCase {
  const CreateCollectionService(
    this._collectionRepository,
    this._userRepository,
  );

  final CollectionRepository _collectionRepository;
  final UserRepository _userRepository;

  @override
  Future<Collection> execute(CreateCollectionPayload payload) async {
    // [1]
    final user = CoreAssert.notEmpty<User>(
      await _userRepository.fetchUser(payload.executorId),
      Exception("사용자를 찾을 수 없어요."),
    );

    // [2]
    final collection = Collection(
      owner: CollectionOwner(id: user.id, name: user.name),
      title: payload.title,
    );

    await _collectionRepository.createCollection(collection);

    return collection;
  }
}
