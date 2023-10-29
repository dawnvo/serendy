// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluation_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvaluationEntity _$EvaluationEntityFromJson(Map<String, dynamic> json) =>
    EvaluationEntity(
      id: json['id'] as String?,
      emotionId: json['emotion_id'] as int?,
      userId: json['user_id'] as String?,
      user: json['user'] == null
          ? null
          : UserEntity.fromJson(json['user'] as Map<String, dynamic>),
      mediaId: json['media_id'] as String?,
      media: json['media'] == null
          ? null
          : MediaEntity.fromJson(json['media'] as Map<String, dynamic>),
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
  writeNotNull('emotion_id', instance.emotionId);
  writeNotNull('user_id', instance.userId);
  writeNotNull('user', instance.user?.toJson());
  writeNotNull('media_id', instance.mediaId);
  writeNotNull('media', instance.media?.toJson());
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('updated_at', instance.updatedAt?.toIso8601String());
  writeNotNull('removed_at', instance.removedAt?.toIso8601String());
  return val;
}
