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
final class Profile extends Equatable {
  final UserID id;

  /// 이름
  final String name;

  /// 이메일
  final String email;

  /// 생성 날짜
  final DateTime createdAt;

  /// 갱신 날짜
  final DateTime updatedAt;

  /// 제거 날짜
  final DateTime? removedAt;

  Profile({
    required this.id,
    required this.name,
    required this.email,
    this.removedAt,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  @override
  List<Object?> get props => [
        id,
        name,
        email,
      ];
}

extension ProfileX on Profile {
  /// 프로필 수정
  Profile edit({String? name}) {
    return copy(
      name: name,
      updatedAt: DateTime.now(),
    );
  }

  /// 프로필 제거
  Profile remove() {
    return copy(removedAt: DateTime.now());
  }

  // 프로필 복사
  Profile copy({
    final UserID? id,
    final String? name,
    final String? email,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final DateTime? removedAt,
  }) {
    return Profile(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      removedAt: removedAt ?? this.removedAt,
    );
  }
}
