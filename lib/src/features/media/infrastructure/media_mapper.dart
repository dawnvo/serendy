import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/media.dart';

abstract final class MediaMapper {
  /**
   *  Entity -> Domain
   */
  static Media toDomain(MediaEntity entity) {
    final externals = entity.externals
        ?.map((external) => MediaExternal(
              name: external.name!,
              url: external.url!,
            ))
        .toList();
    return Media(
      id: entity.id ?? '',
      type: entity.type ?? MediaType.tv,
      status: entity.status ?? MediaStatus.finished,
      adult: entity.adult,
      title: entity.title ?? '',
      overview: entity.overview,
      image: entity.image ?? '',
      thumbnail: entity.thumbnail ?? '',
      color: entity.color,
      keywords: entity.keywords ?? [],
      startDate: entity.startDate,
      endDate: entity.endDate,
      trailer: entity.trailer?.trim(),
      productions: entity.productions ?? [],
      externals: externals,
      popularity: entity.popularity,
      hitsCount: entity.hitsCount,
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
