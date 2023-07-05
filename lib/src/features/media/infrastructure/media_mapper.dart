import 'package:serendy/src/features/media/infrastructure/media_entity.dart';
import 'package:serendy/src/features/media/media.dart';

MediaImages mediaImagesMapper(MediaEntity media) {
  if (media.images?.webp == null) {
    return MediaImages.empty();
  }
  return MediaImages(
    imageUrl: media.images!.webp.imageUrl,
    largeImageUrl: media.images!.webp.largeImageUrl,
    smallImageUrl: media.images!.webp.smallImageUrl,
  );
}

abstract final class MediaMapper {
  static Media toDomainModel(MediaEntity entity) {
    return Media(
      id: entity.id,
      type: entity.type,
      status: entity.status,
      title: entity.title,
      image: entity.image,
      images: mediaImagesMapper(entity),
      keywords: entity.keywords,
      synopsis: entity.synopsis,
      youtubeId: entity.youtubeId,
      isAdult: entity.isAdult,
      startDate: entity.startDate != null //
          ? DateTime.parse(entity.startDate!)
          : null,
      endDate: entity.endDate != null //
          ? DateTime.parse(entity.endDate!)
          : null,
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
      keywords: model.keywords,
      synopsis: model.synopsis,
      youtubeId: model.youtubeId,
      isAdult: model.isAdult,
      startDate: model.startDate?.toIso8601String(),
      endDate: model.endDate?.toIso8601String(),
      // 이미지는 서버에서 설정할 거예요.
      images: null,
    );
  }

  static List<MediaEntity> toDataEntities(final Iterable<Media> models) {
    return models.map((model) => MediaMapper.toDataEntity(model)).toList();
  }
}
