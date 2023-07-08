import 'package:serendy/src/features/media/infrastructure/media_entity.dart';
import 'package:serendy/src/features/media/media.dart';

abstract final class MediaMapper {
  static Media toDomainModel(MediaEntity entity) {
    final images = MediaImagesMapper.toDomainModel(entity.images);
    return Media(
      id: entity.id,
      type: entity.type,
      status: entity.status,
      title: entity.title,
      image: entity.image,
      images: images,
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
}

abstract final class MediaImagesMapper {
  static MediaImages toDomainModel(MediaImagesEntity? entity) {
    final image = entity?.webp;
    if (image == null) return MediaImages.empty();
    return MediaImages(
      imageUrl: image.imageUrl,
      largeImageUrl: image.largeImageUrl,
      smallImageUrl: image.smallImageUrl,
    );
  }
}
