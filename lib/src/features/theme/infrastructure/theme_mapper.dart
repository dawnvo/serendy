import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/theme/theme.dart';

abstract final class ThemeMapper {
  /**
   *  Entity <-> Domain
   */
  static ThemeEntity toEntity(final Theme model) {
    return ThemeEntity(
      id: model.id,
      ownerId: model.owner.id,
      title: model.title,
      description: model.description,
      image: model.image,
      private: model.private,
      itemsCount: model.itemsCount,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      removedAt: model.removedAt,
    );
  }

  static Theme toDomain(final ThemeEntity entity) {
    return Theme(
      owner: ThemeOwner(
        id: entity.ownerId ?? '',
        name: entity.profiles?.name ?? '',
        avatar: entity.profiles?.avatar,
      ),
      items: entity.themeItems //
          ?.map(ThemeItemMapper.toDomain)
          .toList(),
      id: entity.id ?? '',
      title: entity.title ?? '',
      description: entity.description,
      image: entity.image,
      private: entity.private,
      itemsCount: entity.itemsCount,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      removedAt: entity.removedAt,
    );
  }

  /**
   *  Json -> Domain
   */
  static Theme? toSingle(dynamic data) {
    if (data == null) return null;
    final entity = ThemeEntity.fromJson(data as Json);
    return toDomain(entity);
  }

  static List<Theme?> toList(dynamic data) {
    if (data == null) return [];
    final dataList = data as List<dynamic>;
    return dataList.map((item) => toSingle(item)).toList();
  }
}

abstract final class ThemeItemMapper {
  /**
   *  Entity -> Domain
   */
  static ThemeItem toDomain(final ThemeItemEntity entity) {
    return ThemeItem(
      mediaId: entity.mediaId ?? '',
      title: entity.medias?.title ?? '',
      image: entity.medias?.image ?? '',
      addedAt: entity.addedAt ?? DateTime.now(),
    );
  }

  /**
   *  Json -> Domain
   */
  static ThemeItem? toSingle(dynamic data) {
    if (data == null) return null;
    final entity = ThemeItemEntity.fromJson(data as Json);
    return toDomain(entity);
  }

  static List<ThemeItem?> toList(dynamic data) {
    if (data == null) return [];
    final dataList = data as List<dynamic>;
    return dataList.map((item) => toSingle(item)).toList();
  }
}
