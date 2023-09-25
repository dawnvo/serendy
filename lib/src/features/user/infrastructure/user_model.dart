import 'package:serendy/src/core/infrastructure/serializable.dart';

part 'user_model.g.dart';

@jsonSerializable
final class UserModel {
  const UserModel({
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

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
