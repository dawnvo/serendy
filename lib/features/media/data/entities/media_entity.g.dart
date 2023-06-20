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
      isAdult: json['is_adult'] as bool,
      synopsis: json['synopsis'] as String?,
      startDate: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['start_date'], const TimestampConverter().fromJson),
      endDate: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['end_date'], const TimestampConverter().fromJson),
      keywords: (json['keywords'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$MediaEntityToJson(MediaEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$MediaTypeEnumMap[instance.type]!,
      'status': _$MediaStatusEnumMap[instance.status]!,
      'title': instance.title,
      'image': instance.image,
      'synopsis': instance.synopsis,
      'keywords': instance.keywords,
      'is_adult': instance.isAdult,
      'start_date': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.startDate, const TimestampConverter().toJson),
      'end_date': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.endDate, const TimestampConverter().toJson),
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

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
