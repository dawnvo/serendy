import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/user/user.dart';

import 'user_mapper.dart';

final class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl(this.supabase);
  final SupabaseClient supabase;

  static const String _tableUsers = TablePath.users;

  /**
   * 사용자를 불러와요.
   */
  @override
  Future<User?> fetchUser({
    required UserID id,
  }) {
    const columns = '*';
    return supabase
        .from(_tableUsers)
        .select(columns)
        .eq('id', id)
        .maybeSingle()
        .withConverter(UserMapper.toSingle);
  }

  /**
   * 사용자를 만들어요.
   */
  @override
  Future<void> createUser(
    User user,
  ) {
    final entity = UserEntity(
      id: user.id,
      email: user.email,
      username: user.username,
    ).toJson();
    return supabase //
        .from(_tableUsers)
        .insert(entity);
  }

  /**
   * 사용자를 갱신해요.
   */
  @override
  Future<void> updateUser(
    User user,
  ) {
    final entity = UserEntity(
      email: user.email,
      username: user.username,
    ).toJson();
    return supabase //
        .from(_tableUsers)
        .update(entity)
        .eq('id', user.id);
  }
}
