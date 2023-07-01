// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluation_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvaluationEntity _$EvaluationEntityFromJson(Map<String, dynamic> json) =>
    EvaluationEntity(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      emotion: $enumDecode(_$EmotionEnumMap, json['emotion']),
      media: MediaInfoEntity.fromJson(json['media'] as Map<String, dynamic>),
      private: json['private'] as bool,
      createdAt:
          const TimestampConverter().fromJson(json['created_at'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updated_at'] as Timestamp),
      removedAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['removed_at'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$EvaluationEntityToJson(EvaluationEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'emotion': _$EmotionEnumMap[instance.emotion]!,
      'media': instance.media.toJson(),
      'private': instance.private,
      'created_at': const TimestampConverter().toJson(instance.createdAt),
      'updated_at': const TimestampConverter().toJson(instance.updatedAt),
      'removed_at': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.removedAt, const TimestampConverter().toJson),
    };

const _$EmotionEnumMap = {
  Emotion.nice: 'nice',
  Emotion.joy: 'joy',
  Emotion.happyness: 'happyness',
  Emotion.surprise: 'surprise',
  Emotion.sadness: 'sadness',
  Emotion.fear: 'fear',
  Emotion.normal: 'normal',
  Emotion.disgust: 'disgust',
  Emotion.anger: 'anger',
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

MediaInfoEntity _$MediaInfoEntityFromJson(Map<String, dynamic> json) =>
    MediaInfoEntity(
      id: json['id'] as String,
      title: json['title'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$MediaInfoEntityToJson(MediaInfoEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
    };
