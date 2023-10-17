import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/media.dart';

abstract final class MediaMapper {
  /**
   *  Entity -> Domain
   */
  static Media toDomain(MediaEntity entity) {
    return Media(
      id: entity.id ?? '',
      type: entity.type ?? MediaType.anime,
      status: entity.status ?? MediaStatus.finished,
      title: entity.title ?? '',
      image: entity.image ?? '',
      synopsis: entity.synopsis,
      keywords: entity.keywords ?? [],
      reactions: entity.reactions //
          ?.map(MediaReactionMapper.toDomain)
          .toList(),
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

abstract final class MediaReactionMapper {
  /**
   *  Entity -> Domain
   */
  static MediaReaction toDomain(final MediaReactionEntity entity) {
    return MediaReaction(
      emotion: emotionIdToEnum[entity.emotionId] ?? Emotion.joy,
      count: entity.count ?? 0,
    );
  }

  /**
   *  Json -> Domain
   */
  static MediaReaction? toSingle(dynamic data) {
    if (data == null) return null;
    final entity = MediaReactionEntity.fromJson(data as Json);
    return toDomain(entity);
  }

  static List<MediaReaction?> toList(dynamic data) {
    if (data == null) return [];
    final dataList = data as List<dynamic>;
    return dataList.map((item) => toSingle(item)).toList();
  }
}
