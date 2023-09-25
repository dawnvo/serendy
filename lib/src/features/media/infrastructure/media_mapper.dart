import 'package:serendy/src/features/media/infrastructure/media_model.dart';
import 'package:serendy/src/features/media/media.dart';

abstract final class MediaMapper {
  static Media toDomain(MediaModel model) {
    return Media(
      id: model.id,
      type: model.type,
      status: model.status,
      title: model.title,
      image: model.image,
      keywords: model.keywords,
      synopsis: model.synopsis,
      youtubeId: model.youtubeId,
      isAdult: model.isAdult,
      startDate: model.startDate != null //
          ? DateTime.parse(model.startDate!)
          : null,
      endDate: model.endDate != null //
          ? DateTime.parse(model.endDate!)
          : null,
    );
  }

  static MediaModel toData(Media entity) {
    return MediaModel(
      id: entity.id,
      type: entity.type,
      status: entity.status,
      title: entity.title,
      image: entity.image,
      keywords: entity.keywords,
      synopsis: entity.synopsis,
      youtubeId: entity.youtubeId,
      isAdult: entity.isAdult,
      startDate: entity.startDate?.toIso8601String(),
      endDate: entity.endDate?.toIso8601String(),
    );
  }
}
