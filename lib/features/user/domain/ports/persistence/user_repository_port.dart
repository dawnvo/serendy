import 'package:serendy/features/user/user.dart';

abstract class UserRepositoryPort {
  Future<User?> findOne(UserID userId);

  Future<void> create(User user);

  Future<void> update(User user);

  Future<void> delete(User userId);
}
