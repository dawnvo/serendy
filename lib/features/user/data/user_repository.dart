import 'package:serendy/features/user/domain/user.dart';

abstract class UserRepository {
  Future<User?> fetchMe();

  Future<void> signUp({
    required String name,
    required String email,
    String? image,
  });

  Future<void> editUser({
    String? name,
    String? email,
    String? image,
  });

  Future<void> deleteUser(String? reason);
}
