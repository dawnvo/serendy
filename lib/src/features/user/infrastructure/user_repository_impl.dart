import 'package:serendy/src/core/_mock.dart';
import 'package:serendy/src/features/user/user.dart';

final class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl();

  @override
  Future<User?> findOne(UserID userId) async {
    return userMock;
  }

  @override
  Future<void> create(User user) async {
    throw UnimplementedError();
  }

  @override
  Future<void> update(User user) async {
    throw UnimplementedError();
  }

  @override
  Future<void> delete(User user) async {
    throw UnimplementedError();
  }
}
