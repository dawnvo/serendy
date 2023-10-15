import 'package:equatable/equatable.dart';

//Identity
typedef UserID = String;

//Enums
enum Rank {
  /* 아이언 */ iron,
  /* 브론즈 */ bronze,
  /* 실버 */ silver,
  /* 골드 */ gold,
  /* 플레티넘 */ platinum,
  /* 다이아 */ diamond,
  /* 마스터 */ master,
  /* 노벨 */ novel,
}

//AggregateRoot
final class Profile extends Equatable {
  final UserID id;

  /// 이름
  final String name;

  /// 이메일
  final String email;

  /// 프로필 사진
  final String? image;

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
    this.image,
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
        image,
      ];
}

extension ProfileX on Profile {
  /// 프로필 수정
  Profile edit({String? name, String? image}) {
    return copy(
      name: name,
      image: image,
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
    final String? image,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final DateTime? removedAt,
  }) {
    return Profile(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      removedAt: removedAt ?? this.removedAt,
    );
  }
}
