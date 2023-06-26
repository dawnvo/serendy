import 'package:ulid/ulid.dart';
import 'package:equatable/equatable.dart';

typedef UserID = String;

/// [AggregateRoot]
final class User extends Equatable {
  final UserID id;

  /// 이름
  final String name;

  /// 이메일
  final String email;

  /// 프로필 사진
  final String? avatar;

  /// 생성 날짜
  final DateTime createdAt;

  /// 갱신 날짜
  final DateTime updatedAt;

  /// 제거 날짜
  final DateTime? removedAt;

  User({
    required this.name,
    required this.email,
    this.avatar,
    this.removedAt,
    final String? id,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  })  : id = id ?? Ulid().toString(),
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        avatar,
        createdAt,
        updatedAt,
        removedAt,
      ];
}

extension UserX on User {
  /// 프로필 수정
  User edit({String? name, String? avatar}) {
    return copy(
      name: name,
      avatar: avatar,
      updatedAt: DateTime.now(),
    );
  }

  /// 회원 탈퇴
  User remove() {
    return copy(
      removedAt: DateTime.now(),
    );
  }

  // ☹️ Boilerplate Code
  User copy({
    final UserID? id,
    final String? name,
    final String? email,
    final String? avatar,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final DateTime? removedAt,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      removedAt: removedAt ?? this.removedAt,
    );
  }
}
