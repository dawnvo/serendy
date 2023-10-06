import 'package:serendy/src/features/theme/infrastructure/theme_entity.dart';
import 'package:serendy/src/features/theme/theme.dart';

abstract final class ThemeMapper {
  static Theme toDomain(final ThemeEntity entity) {
    return Theme(
      owner: ThemeOwner(
        id: entity.ownerId ?? '',
        name: entity.users?.name ?? '',
        avatar: entity.users?.avatar,
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

  static ThemeEntity toData(final Theme model) {
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
}

abstract final class ThemeItemMapper {
  static ThemeItem toDomain(final ThemeItemEntity entity) {
    return ThemeItem(
      mediaId: entity.mediaId ?? '',
      title: entity.medias?.title ?? '',
      image: entity.medias?.image ?? '',
      addedAt: entity.addedAt ?? DateTime.now(),
    );
  }

  static ThemeItemEntity toData(final ThemeItem item) {
    return ThemeItemEntity(
      addedAt: item.addedAt,
      mediaId: item.mediaId,
    );
  }
}
