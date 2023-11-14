// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaEntity _$MediaEntityFromJson(Map<String, dynamic> json) => MediaEntity(
      id: json['id'] as String?,
      type: $enumDecodeNullable(_$MediaTypeEnumMap, json['type']),
      status: $enumDecodeNullable(_$MediaStatusEnumMap, json['status']),
      adult: json['adult'] as bool?,
      title: json['title'] as String?,
      overview: json['overview'] as String?,
      image: json['image'] as String?,
      thumbnail: json['thumbnail'] as String?,
      color: json['color'] as String?,
      keywords: (json['keywords'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      synonyms: (json['synonyms'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      trailer: json['trailer'] as String?,
      productions: (json['productions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      externals: (json['externals'] as List<dynamic>?)
          ?.map((e) => MediaExternalEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      popularity: (json['popularity'] as num?)?.toDouble(),
      hitsCount: json['hits_count'] as int?,
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
  writeNotNull('adult', instance.adult);
  writeNotNull('title', instance.title);
  writeNotNull('overview', instance.overview);
  writeNotNull('image', instance.image);
  writeNotNull('thumbnail', instance.thumbnail);
  writeNotNull('color', instance.color);
  writeNotNull('keywords', instance.keywords);
  writeNotNull('synonyms', instance.synonyms);
  writeNotNull('start_date', instance.startDate?.toIso8601String());
  writeNotNull('end_date', instance.endDate?.toIso8601String());
  writeNotNull('trailer', instance.trailer);
  writeNotNull('productions', instance.productions);
  writeNotNull(
      'externals', instance.externals?.map((e) => e.toJson()).toList());
  writeNotNull('popularity', instance.popularity);
  writeNotNull('hits_count', instance.hitsCount);
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('updated_at', instance.updatedAt?.toIso8601String());
  writeNotNull('removed_at', instance.removedAt?.toIso8601String());
  return val;
}

const _$MediaTypeEnumMap = {
  MediaType.tv: 'tv',
  MediaType.movie: 'movie',
  MediaType.ova: 'ova',
  MediaType.ona: 'ona',
  MediaType.special: 'special',
  MediaType.music: 'music',
};

const _$MediaStatusEnumMap = {
  MediaStatus.finished: 'finished',
  MediaStatus.releasing: 'releasing',
  MediaStatus.upcoming: 'upcoming',
  MediaStatus.cancelled: 'cancelled',
  MediaStatus.hiatus: 'hiatus',
};

MediaExternalEntity _$MediaExternalEntityFromJson(Map<String, dynamic> json) =>
    MediaExternalEntity(
      name: json['name'] as String?,
      url: json['url'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$MediaExternalEntityToJson(MediaExternalEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('url', instance.url);
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  return val;
}

MediaReactionEntity _$MediaReactionEntityFromJson(Map<String, dynamic> json) =>
    MediaReactionEntity(
      count: json['count'] as int?,
      mediaId: json['media_id'] as String?,
      emotionId: json['emotion_id'] as int?,
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

  writeNotNull('count', instance.count);
  writeNotNull('media_id', instance.mediaId);
  writeNotNull('emotion_id', instance.emotionId);
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('updated_at', instance.updatedAt?.toIso8601String());
  return val;
}
