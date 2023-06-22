import 'package:serendy/features/user/infrastructure/user_entity.dart';
import 'package:serendy/features/user/user.dart';

abstract final class UserMapper {
  static User toDomain(final UserEntity entity) {
    return User(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      avatar: entity.avatar,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      removedAt: entity.removedAt,
    );
  }

  static List<User> toDomains(final Iterable<UserEntity> entities) {
    return entities.map((entity) => UserMapper.toDomain(entity)).toList();
  }

  static UserEntity toEntity(final User model) {
    return UserEntity(
      id: model.id,
      name: model.name,
      email: model.email,
      avatar: model.avatar,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      removedAt: model.removedAt,
    );
  }

  static List<UserEntity> toEntities(final Iterable<User> models) {
    return models.map((model) => UserMapper.toEntity(model)).toList();
  }
}
