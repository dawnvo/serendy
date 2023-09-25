import 'package:serendy/src/core/infrastructure/serializable.dart';

part 'user_entity.g.dart';

@jsonSerializable
final class UserEntity {
  const UserEntity({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.email,
    this.avatar,
    this.removedAt,
  });

  final String id;
  final String name;
  final String email;
  final String? avatar;

  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? removedAt;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
