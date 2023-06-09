import 'package:ulid/ulid.dart';
import 'package:equatable/equatable.dart';

typedef MediaID = String;

enum MediaType {
  /* 애니 */ anime,
  /* 영화 */ movie,
  /* 만화 */ manga,
  /* 소설 */ novel,
}

enum MediaStatus {
  /* 방영 끝 */ finished,
  /* 방영 중 */ releasing,
  /* 방영 전 */ unreleased,
  /* 방영 취소 */ cancelled,
}

/// [AggregateRoot]
final class Media extends Equatable {
  /// 식별자
  final MediaID id;

  /// 대분류
  final MediaType type;

  /// 방영 상태
  final MediaStatus status;

  /// 작품 제목
  final String title;

  /// 작품 사진
  final String image;

  /// 작품 줄거리
  final String? synopsis;

  /// 작품 특징
  final List<String> keywords;

  /// 민감한 콘텐츠
  final bool isAdult;

  /// 시작 날짜
  final DateTime? startDate;

  /// 종료 날짜
  final DateTime? endDate;

  Media({
    required this.type,
    required this.status,
    required this.title,
    required this.image,
    required this.keywords,
    this.synopsis,
    this.startDate,
    this.endDate,
    final String? id,
    final bool? isAdult,
  })  : id = id ?? Ulid().toString(),
        isAdult = isAdult ?? false;

  // ☹️ Boilerplate Code
  Media copyWith({
    final MediaID? id,
    final MediaType? type,
    final MediaStatus? status,
    final String? title,
    final String? image,
    final String? synopsis,
    final List<String>? keywords,
    final bool? isAdult,
    final DateTime? startDate,
    final DateTime? endDate,
  }) {
    return Media(
      id: id ?? this.id,
      type: type ?? this.type,
      status: status ?? this.status,
      title: title ?? this.title,
      image: image ?? this.image,
      keywords: keywords ?? this.keywords,
      isAdult: isAdult ?? this.isAdult,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  @override
  List<Object?> get props => [
        id,
        type,
        status,
        title,
        keywords,
        startDate,
        endDate,
      ];
}
