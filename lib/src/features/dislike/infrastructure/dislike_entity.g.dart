// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dislike_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DislikeEntity _$DislikeEntityFromJson(Map<String, dynamic> json) =>
    DislikeEntity(
      userId: json['user_id'] as String?,
      mediaId: json['media_id'] as String?,
      addedAt: json['added_at'] == null
          ? null
          : DateTime.parse(json['added_at'] as String),
    );

Map<String, dynamic> _$DislikeEntityToJson(DislikeEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user_id', instance.userId);
  writeNotNull('media_id', instance.mediaId);
  writeNotNull('added_at', instance.addedAt?.toIso8601String());
  return val;
}
