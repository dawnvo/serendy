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
      media:
          EvaluationMediaEntity.fromJson(json['media'] as Map<String, dynamic>),
      private: json['private'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      removedAt: json['removed_at'] == null
          ? null
          : DateTime.parse(json['removed_at'] as String),
    );

Map<String, dynamic> _$EvaluationEntityToJson(EvaluationEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'emotion': _$EmotionEnumMap[instance.emotion]!,
      'media': instance.media.toJson(),
      'private': instance.private,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'removed_at': instance.removedAt?.toIso8601String(),
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

EvaluationMediaEntity _$EvaluationMediaEntityFromJson(
        Map<String, dynamic> json) =>
    EvaluationMediaEntity(
      id: json['id'] as String,
      title: json['title'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$EvaluationMediaEntityToJson(
        EvaluationMediaEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
    };
