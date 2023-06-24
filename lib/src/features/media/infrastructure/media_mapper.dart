import 'package:serendy/src/features/media/infrastructure/media_entity.dart';
import 'package:serendy/src/features/media/media.dart';

abstract final class MediaMapper {
  static Media toDomainModel(MediaEntity entity) {
    return Media(
      id: entity.id,
      type: entity.type,
      status: entity.status,
      title: entity.title,
      image: entity.image,
      synopsis: entity.synopsis,
      keywords: entity.keywords,
      isAdult: entity.isAdult,
      startDate: entity.startDate,
      endDate: entity.endDate,
    );
  }

  static List<Media> toDomainModels(final Iterable<MediaEntity> entities) {
    return entities.map((entity) => MediaMapper.toDomainModel(entity)).toList();
  }

  static MediaEntity toDataEntity(Media model) {
    return MediaEntity(
      id: model.id,
      type: model.type,
      status: model.status,
      title: model.title,
      image: model.image,
      synopsis: model.synopsis,
      keywords: model.keywords,
      isAdult: model.isAdult,
      startDate: model.startDate,
      endDate: model.endDate,
    );
  }

  static List<MediaEntity> toDataEntities(final Iterable<Media> models) {
    return models.map((model) => MediaMapper.toDataEntity(model)).toList();
  }
}
