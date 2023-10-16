// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaEntity _$MediaEntityFromJson(Map<String, dynamic> json) => MediaEntity(
      id: json['id'] as String?,
      type: $enumDecodeNullable(_$MediaTypeEnumMap, json['type']),
      status: $enumDecodeNullable(_$MediaStatusEnumMap, json['status']),
      isAdult: json['is_adult'] as bool?,
      title: json['title'] as String?,
      image: json['image'] as String?,
      synopsis: json['synopsis'] as String?,
      keywords: (json['keywords'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      reactions: (json['reactions'] as List<dynamic>?)
          ?.map((e) => MediaReactionEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      youtubeId: (json['youtube_id'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      popularity: (json['popularity'] as num?)?.toDouble(),
      hitsCount: json['hits_count'] as int?,
      favoritesCount: json['favorites_count'] as int?,
      evaluationsCount: json['evaluations_count'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      removedAt: json['removed_at'] == null
          ? null
          : DateTime.parse(json['removed_at'] as String),
    );

Map<String, dynamic> _$MediaEntityToJson(MediaEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('type', _$MediaTypeEnumMap[instance.type]);
  writeNotNull('status', _$MediaStatusEnumMap[instance.status]);
  writeNotNull('is_adult', instance.isAdult);
  writeNotNull('title', instance.title);
  writeNotNull('image', instance.image);
  writeNotNull('synopsis', instance.synopsis);
  writeNotNull('keywords', instance.keywords);
  writeNotNull('youtube_id', instance.youtubeId);
  writeNotNull('start_date', instance.startDate?.toIso8601String());
  writeNotNull('end_date', instance.endDate?.toIso8601String());
  writeNotNull(
      'reactions', instance.reactions?.map((e) => e.toJson()).toList());
  writeNotNull('popularity', instance.popularity);
  writeNotNull('hits_count', instance.hitsCount);
  writeNotNull('favorites_count', instance.favoritesCount);
  writeNotNull('evaluations_count', instance.evaluationsCount);
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('updated_at', instance.updatedAt?.toIso8601String());
  writeNotNull('removed_at', instance.removedAt?.toIso8601String());
  return val;
}

const _$MediaTypeEnumMap = {
  MediaType.anime: 'anime',
  MediaType.movie: 'movie',
  MediaType.manga: 'manga',
  MediaType.novel: 'novel',
};

const _$MediaStatusEnumMap = {
  MediaStatus.finished: 'finished',
  MediaStatus.releasing: 'releasing',
  MediaStatus.unreleased: 'unreleased',
  MediaStatus.cancelled: 'cancelled',
};

MediaReactionEntity _$MediaReactionEntityFromJson(Map<String, dynamic> json) =>
    MediaReactionEntity(
      id: json['id'] as String?,
      emotionId: json['emotion_id'] as int?,
      count: json['count'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$MediaReactionEntityToJson(MediaReactionEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('count', instance.count);
  writeNotNull('emotion_id', instance.emotionId);
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('updated_at', instance.updatedAt?.toIso8601String());
  return val;
}
