import 'package:serendy/src/features/user/infrastructure/user_model.dart';
import 'package:serendy/src/features/user/user.dart';

abstract final class UserMapper {
  static User toDomain(final UserModel model) {
    return User(
      id: model.id,
      name: model.name,
      email: model.email,
      avatar: model.avatar,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      removedAt: model.removedAt,
    );
  }

  static UserModel toData(final User entity) {
    return UserModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      avatar: entity.avatar,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      removedAt: entity.removedAt,
    );
  }
}
