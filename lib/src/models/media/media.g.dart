// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Media _$MediaFromJson(Map<String, dynamic> json) => Media(
      id: json['id'] as String,
      type: $enumDecode(_$MediaTypeEnumMap, json['type']),
      status: $enumDecode(_$MediaStatusEnumMap, json['status']),
      title: json['title'] as String,
      image: json['image'] as String,
      keywords:
          (json['keywords'] as List<dynamic>).map((e) => e as String).toList(),
      synopsis: json['synopsis'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      isAdult: json['isAdult'] as bool?,
      youtubeId: (json['youtubeId'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'id': instance.id,
      'type': _$MediaTypeEnumMap[instance.type]!,
      'status': _$MediaStatusEnumMap[instance.status]!,
      'title': instance.title,
      'image': instance.image,
      'synopsis': instance.synopsis,
      'keywords': instance.keywords,
      'youtubeId': instance.youtubeId,
      'isAdult': instance.isAdult,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
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
