import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/profile/profile.dart';

abstract final class ProfileMapper {
  /**
   *  Entity <-> Domain
   */
  static ProfileEntity toEntity(final Profile model) {
    return ProfileEntity(
      id: model.id,
      name: model.name,
      email: model.email,
      avatar: model.avatar,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

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

  /**
   *  Json -> Domain
   */
  static Profile? toSingle(dynamic data) {
    if (data == null) return null;
    final entity = ProfileEntity.fromJson(data as Json);
    return toDomain(entity);
  }

  static List<Profile?> toList(dynamic data) {
    if (data == null) return [];
    final dataList = data as List<dynamic>;
    return dataList.map((item) => toSingle(item)).toList();
  }
}
