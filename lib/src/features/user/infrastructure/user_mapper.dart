import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/user/user.dart';

abstract final class UserMapper {
  /**
   *  Entity -> Domain
   */
  static User toDomain(final UserEntity entity) {
    return User(
      id: entity.id ?? '',
      email: entity.email ?? '',
      username: entity.username ?? '',
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /**
   *  Json -> Domain
   */
  static User? toSingle(dynamic data) {
    if (data == null) return null;
    final entity = UserEntity.fromJson(data as Json);
    return toDomain(entity);
  }

  static List<User?> toList(dynamic data) {
    if (data == null) return [];
    final dataList = data as List<dynamic>;
    return dataList.map((item) => toSingle(item)).toList();
  }
}
