// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaEntity _$MediaEntityFromJson(Map<String, dynamic> json) => MediaEntity(
      id: json['id'] as String,
      type: $enumDecode(_$MediaTypeEnumMap, json['type']),
      status: $enumDecode(_$MediaStatusEnumMap, json['status']),
      title: json['title'] as String,
      image: json['image'] as String,
      images: json['images'] == null
          ? null
          : MediaImagesEntity.fromJson(json['images'] as Map<String, dynamic>),
      isAdult: json['is_adult'] as bool,
      synopsis: json['synopsis'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      keywords: (json['keywords'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      youtubeId: (json['youtube_id'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$MediaEntityToJson(MediaEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$MediaTypeEnumMap[instance.type]!,
      'status': _$MediaStatusEnumMap[instance.status]!,
      'title': instance.title,
      'image': instance.image,
      'images': instance.images?.toJson(),
      'synopsis': instance.synopsis,
      'keywords': instance.keywords,
      'youtube_id': instance.youtubeId,
      'is_adult': instance.isAdult,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
    };

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

MediaImagesEntity _$MediaImagesEntityFromJson(Map<String, dynamic> json) =>
    MediaImagesEntity(
      jpg: MediaImageUrlEntity.fromJson(json['jpg'] as Map<String, dynamic>),
      webp: MediaImageUrlEntity.fromJson(json['webp'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MediaImagesEntityToJson(MediaImagesEntity instance) =>
    <String, dynamic>{
      'jpg': instance.jpg.toJson(),
      'webp': instance.webp.toJson(),
    };

MediaImageUrlEntity _$MediaImageUrlEntityFromJson(Map<String, dynamic> json) =>
    MediaImageUrlEntity(
      imageUrl: json['image_url'] as String,
      largeImageUrl: json['large_image_url'] as String,
      smallImageUrl: json['small_image_url'] as String,
    );

Map<String, dynamic> _$MediaImageUrlEntityToJson(
        MediaImageUrlEntity instance) =>
    <String, dynamic>{
      'image_url': instance.imageUrl,
      'large_image_url': instance.largeImageUrl,
      'small_image_url': instance.smallImageUrl,
    };
