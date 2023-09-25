import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:serendy/src/core/types.dart';

part 'user.g.dart';

typedef UserID = String;

//AggregateRoot
@JsonSerializable()
final class User extends Equatable {
  final UserID id;

  // * 이름
  final String name;

  // * 이메일
  final String email;

  // * 프로필 사진
  final String? avatar;

  const User({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        avatar,
      ];

  factory User.fromJson(Json json) => _$UserFromJson(json);
  Json toJson() => _$UserToJson(this);
}

extension UserX on User {
  User copy({
    final UserID? id,
    final String? name,
    final String? email,
    final String? avatar,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
    );
  }
}
