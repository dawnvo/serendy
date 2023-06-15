import 'package:serendy/features/user/domain/user.dart';

abstract class UserRepository {
  Future<User?> fetchUser(String id);

  Future<void> createUser(User user);

  Future<void> updateUser(User user);

  Future<void> deleteUser(User user);
}
