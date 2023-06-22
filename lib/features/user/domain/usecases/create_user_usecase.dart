import 'package:serendy/core/domain/usecase.dart';
import 'package:serendy/features/collection/collection.dart';
import 'package:serendy/features/user/user.dart';

typedef CreateUserPort = ({
  String id,
  String name,
  String? email,
  String? avatar,
});

final class CreateUserUsecase implements UseCase<CreateUserPort, User> {
  const CreateUserUsecase(
    this._userRepository,
    this._collectionRepository,
  );

  final UserRepository _userRepository;
  final CollectionRepository _collectionRepository;

  @override
  Future<User> execute(CreateUserPort payload) async {
    // 사용자 식별자
    final userId = payload.id;

    // 사용자 생성
    final user = User(
      id: userId,
      name: payload.name,
      email: payload.email,
      avatar: payload.avatar,
    );

    await _userRepository.create(user);
    await _createDefaultCollection(user);

    return user;
  }

  /// ⭐ 사용자의 기본 테마 생성
  /// 기본 테마는 사용자 식별자로 이루어집니다.
  Future<void> _createDefaultCollection(User user) async {
    final collection = Collection(
      owner: CollectionOwner(
        id: user.id,
        name: user.name,
      ),
      id: user.id,
      title: '보고싶은',
      image: null,
      private: true,
    );

    await _collectionRepository.create(collection);
  }
}