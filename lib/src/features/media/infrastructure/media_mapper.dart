import 'package:serendy/src/core/enums.dart';
import 'package:serendy/src/features/media/infrastructure/media_entity.dart';
import 'package:serendy/src/features/media/media.dart';

abstract final class MediaMapper {
  static Media toDomain(MediaEntity entity) {
    return Media(
      id: entity.id ?? '',
      type: entity.type ?? MediaType.anime,
      status: entity.status ?? MediaStatus.finished,
      title: entity.title ?? '',
      image: entity.image ?? '',
      keywords: entity.keywords ?? [],
      synopsis: entity.synopsis,
      youtubeId: entity.youtubeId,
      isAdult: entity.isAdult,
      startDate: entity.startDate,
      endDate: entity.endDate,
    );
  }

  static MediaEntity toData(Media model) {
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
      startDate: model.startDate,
      endDate: model.endDate,
    );
  }
}
