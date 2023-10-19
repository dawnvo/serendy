import 'package:json_annotation/json_annotation.dart';
import 'package:serendy/src/configs/configs.dart';

part 'user_entity.g.dart';

@JsonSerializable()
final class UserEntity {
  const UserEntity({
    this.id,
    this.email,
    this.username,
    this.createdAt,
    this.updatedAt,
    this.removedAt,
  });

  final String? id;
  final String? email;
  final String? username;

  //timestamp
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? removedAt;

  factory UserEntity.fromJson(Json json) => _$UserEntityFromJson(json);
  Json toJson() => _$UserEntityToJson(this);
}
