import 'package:serendy/src/features/user/user.dart';

abstract class UserRepository {
  const UserRepository();

  /// 사용자를 불러와요.
  Future<User?> fetchUser({
    required UserID id,
  });

  /// 사용자를 만들어요.
  Future<void> createUser(
    User user,
  );

  /// 사용자를 갱신해요.
  Future<void> updateUser(
    User user,
  );

  /// 사용자를 삭제해요.
  Future<void> deleteUser({
    required UserID userId,
    required ExitReason reason,
    String? comment,
  });
}
