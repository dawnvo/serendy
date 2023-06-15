import 'package:serendy/features/user/data/user_repository.dart';
import 'package:serendy/features/user/domain/user.dart';

final class UserRepositoryFake extends UserRepository {
  @override
  Future<void> createUser(User user) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUser(User user) {
    throw UnimplementedError();
  }

  @override
  Future<User?> fetchUser(String id) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser(User user) {
    throw UnimplementedError();
  }
}
