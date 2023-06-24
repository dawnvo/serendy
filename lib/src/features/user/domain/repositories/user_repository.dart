import 'package:serendy/src/features/user/user.dart';

abstract class UserRepository {
  Future<User?> findOne(UserID userId);

  Future<void> create(User user);

  Future<void> update(User user);

  Future<void> delete(User userId);
}
