import 'package:serendy/core/network/serializable.dart';

part 'user_entity.g.dart';

/// - type: collection
/// - name: users
/// - key: ulid
@jsonSerializable
final class UserEntity {
  const UserEntity({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    this.email,
    this.avatar,
    this.removedAt,
  });

  final String id;
  final String name;
  final String? email;
  final String? avatar;

  @TimestampConverter()
  final DateTime createdAt;
  @TimestampConverter()
  final DateTime updatedAt;
  @TimestampConverter()
  final DateTime? removedAt;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
