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
    this.adult,
    this.title,
    this.overview,
    this.image,
    this.thumbnail,
    this.color,
    this.keywords,
    this.synonyms,
    this.startDate,
    this.endDate,
    this.trailer,
    this.productions,
    this.externals,
    this.popularity,
    this.hitsCount,
    this.createdAt,
    this.updatedAt,
    this.removedAt,
  });

  final MediaID? id;
  final MediaType? type;
  final MediaStatus? status;
  final bool? adult;
  final String? title;
  final String? overview;
  final String? image;
  final String? thumbnail;
  final String? color;
  final List<String>? keywords;
  final List<String>? synonyms;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? trailer;
  final List<String>? productions;
  final List<MediaExternalEntity>? externals;

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
class MediaExternalEntity {
  const MediaExternalEntity({
    this.name,
    this.url,
    this.createdAt,
  });

  final String? name;
  final String? url;

  //timestamp
  final DateTime? createdAt;

  factory MediaExternalEntity.fromJson(Json json) => _$MediaExternalEntityFromJson(json);
  Json toJson() => _$MediaExternalEntityToJson(this);
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
