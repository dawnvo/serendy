// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluation_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvaluationEntity _$EvaluationEntityFromJson(Map<String, dynamic> json) =>
    EvaluationEntity(
      id: json['id'] as String?,
      emotion: $enumDecodeNullable(_$EmotionEnumMap, json['emotion']),
      userId: json['user_id'] as String?,
      users: json['users'] == null
          ? null
          : UserEntity.fromJson(json['users'] as Map<String, dynamic>),
      mediaId: json['media_id'] as String?,
      medias: json['medias'] == null
          ? null
          : MediaEntity.fromJson(json['medias'] as Map<String, dynamic>),
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

Map<String, dynamic> _$EvaluationEntityToJson(EvaluationEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('emotion', _$EmotionEnumMap[instance.emotion]);
  writeNotNull('user_id', instance.userId);
  writeNotNull('users', instance.users?.toJson());
  writeNotNull('media_id', instance.mediaId);
  writeNotNull('medias', instance.medias?.toJson());
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('updated_at', instance.updatedAt?.toIso8601String());
  writeNotNull('removed_at', instance.removedAt?.toIso8601String());
  return val;
}

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
