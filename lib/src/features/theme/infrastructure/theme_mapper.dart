import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/features/theme/infrastructure/theme_entity.dart';
import 'package:serendy/src/features/media/infrastructure/media_entity.dart';
import 'package:serendy/src/features/media/infrastructure/media_mapper.dart';
import 'package:serendy/src/features/media/media.dart';

ThemeItem themeItemMapper(ThemeItemEntity item) {
  return ThemeItem(
    addedAt: item.addedAt,
    media: Media(
      id: item.media.id,
      type: item.media.type,
      status: item.media.status,
      title: item.media.title,
      image: item.media.image,
      images: mediaImagesMapper(item.media),
      synopsis: item.media.synopsis,
      keywords: item.media.keywords,
      youtubeId: item.media.youtubeId,
      isAdult: item.media.isAdult,
      startDate: item.media.startDate != null
          ? DateTime.parse(item.media.startDate!)
          : null,
      endDate: item.media.endDate != null
          ? DateTime.parse(item.media.endDate!)
          : null,
    ),
  );
}

abstract final class ThemeMapper {
  static Theme toDomainModel(final ThemeEntity entity) {
    final ThemeOwner owner = ThemeOwner(
      id: entity.owner.id,
      name: entity.owner.name,
    );

    final List<ThemeItem?> themeItems =
        entity.items.map((item) => themeItemMapper(item!)).toList();

    return Theme(
      id: entity.id,
      owner: owner,
      title: entity.title,
      description: entity.description,
      image: entity.image,
      private: entity.private,
      items: themeItems,
      itemCount: entity.itemCount,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      removedAt: entity.removedAt,
    );
  }

  static List<Theme> toDomainModels(final Iterable<ThemeEntity> entities) {
    return entities.map((entity) => ThemeMapper.toDomainModel(entity)).toList();
  }

  static ThemeEntity toDataEntity(final Theme model) {
    final ThemeOwnerEntity owner = ThemeOwnerEntity(
      id: model.owner.id,
      name: model.owner.name,
    );

    final List<ThemeItemEntity?> themeItems = model.items.map((item) {
      return ThemeItemEntity(
        addedAt: item!.addedAt,
        media: MediaEntity(
          id: item.media.id,
          type: item.media.type,
          status: item.media.status,
          title: item.media.title,
          image: item.media.image,
          synopsis: item.media.synopsis,
          keywords: item.media.keywords,
          youtubeId: item.media.youtubeId,
          isAdult: item.media.isAdult,
          startDate: item.media.startDate?.toIso8601String(),
          endDate: item.media.endDate?.toIso8601String(),
          // 이미지는 서버에서 설정할 거예요.
          images: null,
        ),
      );
    }).toList();

    return ThemeEntity(
      id: model.id,
      owner: owner,
      title: model.title,
      description: model.description,
      image: model.image,
      private: model.private,
      items: themeItems,
      itemCount: model.itemCount,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      removedAt: model.removedAt,
    );
  }

  static List<ThemeEntity> toDataEntities(final Iterable<Theme> models) {
    return models.map((model) => ThemeMapper.toDataEntity(model)).toList();
  }
}
