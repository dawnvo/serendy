import 'package:serendy/src/features/media/infrastructure/media_model.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/theme/infrastructure/theme_model.dart';
import 'package:serendy/src/features/theme/theme.dart';

abstract final class ThemeMapper {
  static Theme toDomain(final ThemeModel model) {
    final ThemeOwner owner = ThemeOwner(
      id: model.owner.id,
      name: model.owner.name,
    );

    final List<ThemeItem?> themeItems =
        model.items.map((item) => ThemeItemMapper.toDomain(item!)).toList();

    return Theme(
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

  static ThemeModel toData(final Theme entity) {
    final ThemeOwnerModel owner = ThemeOwnerModel(
      id: entity.owner.id,
      name: entity.owner.name,
    );

    final List<ThemeItemModel?> themeItems =
        entity.items.map((item) => ThemeItemMapper.toData(item!)).toList();

    return ThemeModel(
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
}

abstract final class ThemeItemMapper {
  static ThemeItem toDomain(final ThemeItemModel item) {
    return ThemeItem(
      addedAt: item.addedAt,
      media: Media(
        id: item.media.id,
        type: item.media.type,
        status: item.media.status,
        title: item.media.title,
        image: item.media.image,
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

  static ThemeItemModel toData(final ThemeItem item) {
    return ThemeItemModel(
      addedAt: item.addedAt,
      media: MediaModel(
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
      ),
    );
  }
}
