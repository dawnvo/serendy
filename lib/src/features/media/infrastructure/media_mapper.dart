import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';

abstract final class MediaMapper {
  /**
   *  Entity <-> Domain
   */
  static MediaEntity toEntity(Media model) {
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

  /**
   *  Json -> Domain
   */
  static Media? toSingle(dynamic data) {
    if (data == null) return null;
    final entity = MediaEntity.fromJson(data as Json);
    return toDomain(entity);
  }

  static List<Media?> toList(dynamic data) {
    if (data == null) return [];
    final dataList = data as List<dynamic>;
    return dataList.map((item) => toSingle(item)).toList();
  }
}
