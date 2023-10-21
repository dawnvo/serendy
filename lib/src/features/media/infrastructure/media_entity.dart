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
    this.youtubeId,
    this.startDate,
    this.endDate,
    this.popularity,
    this.hitsCount,
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

  //analytical
  final double? popularity;
  final int? hitsCount;

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
    this.count,
    this.mediaId,
    this.emotionId,
    this.createdAt,
    this.updatedAt,
  });

  final int? count;

  //foreign
  final MediaID? mediaId;
  final int? emotionId;

  //timestamp
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory MediaReactionEntity.fromJson(Json json) => _$MediaReactionEntityFromJson(json);
  Json toJson() => _$MediaReactionEntityToJson(this);
}
