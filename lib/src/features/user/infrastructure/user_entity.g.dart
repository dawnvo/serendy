// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      id: json['id'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
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

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('email', instance.email);
  writeNotNull('username', instance.username);
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('updated_at', instance.updatedAt?.toIso8601String());
  writeNotNull('removed_at', instance.removedAt?.toIso8601String());
  return val;
}

UserExitReasonEntity _$UserExitReasonEntityFromJson(
        Map<String, dynamic> json) =>
    UserExitReasonEntity(
      userId: json['user_id'] as String?,
      reason: $enumDecodeNullable(_$ExitReasonEnumMap, json['reason']),
      comment: json['comment'] as String?,
      withdrawnAt: json['withdrawn_at'] == null
          ? null
          : DateTime.parse(json['withdrawn_at'] as String),
    );

Map<String, dynamic> _$UserExitReasonEntityToJson(
    UserExitReasonEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user_id', instance.userId);
  writeNotNull('reason', _$ExitReasonEnumMap[instance.reason]);
  writeNotNull('comment', instance.comment);
  writeNotNull('withdrawn_at', instance.withdrawnAt?.toIso8601String());
  return val;
}

const _$ExitReasonEnumMap = {
  ExitReason.inconvenience: 'inconvenience',
  ExitReason.absence: 'absence',
  ExitReason.security: 'security',
  ExitReason.alternative: 'alternative',
  ExitReason.infrequency: 'infrequency',
  ExitReason.other: 'other',
};
