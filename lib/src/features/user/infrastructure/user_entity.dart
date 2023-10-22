import 'package:json_annotation/json_annotation.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/user/user.dart';

part 'user_entity.g.dart';

@JsonSerializable()
final class UserEntity {
  const UserEntity({
    this.id,
    this.email,
    this.username,
    this.createdAt,
    this.updatedAt,
  });

  final UserID? id;
  final String? email;
  final String? username;

  //timestamp
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory UserEntity.fromJson(Json json) => _$UserEntityFromJson(json);
  Json toJson() => _$UserEntityToJson(this);
}

@JsonSerializable()
final class UserExitReasonEntity {
  const UserExitReasonEntity({
    this.userId,
    this.reason,
    this.comment,
    this.withdrawnAt,
  });

  final UserID? userId;
  final ExitReason? reason;
  final String? comment;

  //timestamp
  final DateTime? withdrawnAt;

  factory UserExitReasonEntity.fromJson(Json json) => _$UserExitReasonEntityFromJson(json);
  Json toJson() => _$UserExitReasonEntityToJson(this);
}
