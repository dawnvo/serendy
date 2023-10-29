import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/user/user.dart';

import 'user_mapper.dart';

final class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl(this.supabase);
  final SupabaseClient supabase;

  static const String _tableUser = TablePath.user;
  static const String _tableUserExitReason = TablePath.userExitReason;

  /**
   * 사용자를 불러와요.
   */
  @override
  Future<User?> fetchUser({
    UserID? id,
    String? username,
  }) {
    const columns = '*';
    final query = supabase //
        .from(_tableUser)
        .select(columns);
    //identity
    if (id != null) query.eq('id', id);
    if (username != null) query.eq('username', username);
    //result
    return query //
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
        .from(_tableUser)
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
      updatedAt: user.updatedAt,
    ).toJson();
    return supabase //
        .from(_tableUser)
        .update(entity)
        .eq('id', user.id);
  }

  /**
   * 사용자를 삭제해요.
   */
  @override
  Future<void> deleteUser({
    required UserID userId,
    required ExitReason reason,
    String? comment,
  }) async {
    // * 탈퇴 사유
    final userExitReasonEntity = UserExitReasonEntity(
      userId: userId,
      reason: reason,
      comment: comment,
    ).toJson();
    await supabase //
        .from(_tableUserExitReason)
        .insert(userExitReasonEntity);
    // * 개인정보 삭제
    final userEntity = const UserEntity().toJson();
    // [serializable] include_if_null: false
    userEntity['email'] = null;
    userEntity['username'] = null;
    await supabase //
        .from(_tableUser)
        .update(userEntity)
        .eq('id', userId);
  }
}
