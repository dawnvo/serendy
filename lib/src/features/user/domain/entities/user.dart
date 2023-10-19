import 'package:equatable/equatable.dart';

//Identity
typedef UserID = String;

//Enums
enum Rank {
  /* 철 */ iron,
  /* 동 */ bronze,
  /* 은 */ silver,
  /* 금 */ gold,
  /* 백금 */ platinum,
  /* 금강석 */ diamond,
  /* 지배자 */ master,
  /* 새로운 */ novel,
}

//AggregateRoot
final class User extends Equatable {
  final UserID id;

  /// 이메일
  final String email;

  /// 사용자 이름
  final String username;

  /// 생성 날짜
  final DateTime createdAt;

  /// 갱신 날짜
  final DateTime updatedAt;

  /// 제거 날짜
  final DateTime? removedAt;

  User({
    required this.id,
    required this.email,
    required this.username,
    this.removedAt,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  @override
  List<Object?> get props => [
        id,
        email,
        username,
      ];
}

extension UserX on User {
  /// 프로필 수정
  User edit({String? username}) {
    return copy(
      username: username,
      updatedAt: DateTime.now(),
    );
  }

  /// 사용자 제거
  User remove() {
    return copy(removedAt: DateTime.now());
  }

  // 사용자 복사
  User copy({
    final UserID? id,
    final String? email,
    final String? username,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final DateTime? removedAt,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      removedAt: removedAt ?? this.removedAt,
    );
  }
}
