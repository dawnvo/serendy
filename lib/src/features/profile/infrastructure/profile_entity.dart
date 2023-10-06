import 'package:json_annotation/json_annotation.dart';
import 'package:serendy/src/configs/configs.dart';

part 'profile_entity.g.dart';

@JsonSerializable()
final class ProfileEntity {
  const ProfileEntity({
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

  factory ProfileEntity.fromJson(Json json) => _$ProfileEntityFromJson(json);
  Json toJson() => _$ProfileEntityToJson(this);
}
