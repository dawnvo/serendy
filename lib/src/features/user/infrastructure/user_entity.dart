import 'package:json_annotation/json_annotation.dart';
import 'package:serendy/src/core/domain/types.dart';

part 'user_entity.g.dart';

@JsonSerializable()
final class UserEntity {
  const UserEntity({
    this.id,
    this.name,
    this.email,
    this.avatar,
    this.createdAt,
    this.updatedAt,
    this.removedAt,
  });

  final String? id;
  final String? name;
  final String? email;
  final String? avatar;

  //timestamp
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? removedAt;

  factory UserEntity.fromJson(Json json) => _$UserEntityFromJson(json);
  Json toJson() => _$UserEntityToJson(this);
}
