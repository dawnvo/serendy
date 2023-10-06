import 'package:serendy/src/features/profile/infrastructure/profile_entity.dart';
import 'package:serendy/src/features/profile/profile.dart';

abstract final class ProfileMapper {
  static Profile toDomain(final ProfileEntity entity) {
    return Profile(
      id: entity.id ?? '',
      name: entity.name ?? '',
      email: entity.email ?? '',
      avatar: entity.avatar,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  static ProfileEntity toData(final Profile model) {
    return ProfileEntity(
      id: model.id,
      name: model.name,
      email: model.email,
      avatar: model.avatar,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }
}
