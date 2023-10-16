import 'package:json_annotation/json_annotation.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';

part 'media_entity.g.dart';

@JsonSerializable()
final class MediaEntity {
  MediaEntity({
    this.id,
    this.type,
    this.status,
    this.isAdult,
    this.title,
    this.image,
    this.synopsis,
    this.keywords,
    this.reactions,
    this.youtubeId,
    this.startDate,
    this.endDate,
    this.popularity,
    this.hitsCount,
    this.favoritesCount,
    this.evaluationsCount,
    this.createdAt,
    this.updatedAt,
    this.removedAt,
  });

  final MediaID? id;
  final MediaType? type;
  final MediaStatus? status;
  final bool? isAdult;
  final String? title;
  final String? image;
  final String? synopsis;
  final List<String>? keywords;
  final List<String?>? youtubeId;
  final DateTime? startDate;
  final DateTime? endDate;

  //foreign
  final List<MediaReactionEntity>? reactions;

  //analytical
  final double? popularity;
  final int? hitsCount;
  final int? favoritesCount;
  final int? evaluationsCount;

  //timestamp
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? removedAt;

  factory MediaEntity.fromJson(Json json) => _$MediaEntityFromJson(json);
  Json toJson() => _$MediaEntityToJson(this);
}

@JsonSerializable()
class MediaReactionEntity {
  const MediaReactionEntity({
    this.id,
    this.emotionId,
    this.count,
    this.createdAt,
    this.updatedAt,
  });

  final MediaID? id;
  final int? count;

  //foreign
  final int? emotionId;

  //timestamp
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory MediaReactionEntity.fromJson(Json json) => _$MediaReactionEntityFromJson(json);
  Json toJson() => _$MediaReactionEntityToJson(this);
}
