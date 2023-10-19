import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/profile/profile.dart';

abstract final class ProfileMapper {
  /**
   *  Entity -> Domain
   */
  static Profile toDomain(final ProfileEntity entity) {
    return Profile(
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
