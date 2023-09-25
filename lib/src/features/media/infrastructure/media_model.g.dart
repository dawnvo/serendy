// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaModel _$MediaModelFromJson(Map<String, dynamic> json) => MediaModel(
      id: json['id'] as String,
      type: $enumDecode(_$MediaTypeEnumMap, json['type']),
      status: $enumDecode(_$MediaStatusEnumMap, json['status']),
      title: json['title'] as String,
      image: json['image'] as String,
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

Map<String, dynamic> _$MediaModelToJson(MediaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$MediaTypeEnumMap[instance.type]!,
      'status': _$MediaStatusEnumMap[instance.status]!,
      'title': instance.title,
      'image': instance.image,
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
