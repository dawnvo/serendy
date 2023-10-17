import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:ulid/ulid.dart';
import 'package:equatable/equatable.dart';

part 'media_reaction.dart';

//Identity
typedef MediaID = String;

//Enums
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

//AggregateRoot
final class Media extends Equatable {
  final MediaID id;

  /// 대분류
  final MediaType type;

  /// 방영 상태
  final MediaStatus status;

  /// 제목
  final String title;

  /// 사진
  final String image;

  /// 줄거리
  final String? synopsis;

  /// 키워드
  final List<String> keywords;

  /// 반응 목록
  final List<MediaReaction?> reactions;

  /// 유튜브 PV
  final List<String?> youtubeId;

  /// 민감한 콘텐츠
  final bool isAdult;

  /// 방영 시작 날짜
  final DateTime? startDate;

  /// 방영 종료 날짜
  final DateTime? endDate;

  /// 인기도
  final double popularity;

  /// 조회 수
  final int hitsCount;

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
    final List<String?>? youtubeId,
    final List<MediaReaction?>? reactions,
    final double? popularity,
    final int? hitsCount,
    final int? reactionsCount,
    final int? favoritesCount,
  })  : id = id ?? Ulid().toCanonical(),
        isAdult = isAdult ?? false,
        youtubeId = youtubeId ?? const [],
        reactions = reactions ?? const [],
        popularity = popularity ?? 0.0,
        hitsCount = hitsCount ?? 0;

  @override
  List<Object?> get props => [id];
}

extension MediaX on Media {
  // 미디어 복사
  Media copy({
    final MediaID? id,
    final MediaType? type,
    final MediaStatus? status,
    final String? title,
    final String? image,
    final String? synopsis,
    final List<String>? keywords,
    final List<MediaReaction?>? reactions,
    final List<String?>? youtubeId,
    final bool? isAdult,
    final DateTime? startDate,
    final DateTime? endDate,
    final double? popularity,
    final int? hitsCount,
    final int? reactionsCount,
    final int? favoritesCount,
  }) {
    return Media(
      id: id ?? this.id,
      type: type ?? this.type,
      status: status ?? this.status,
      title: title ?? this.title,
      image: image ?? this.image,
      synopsis: synopsis ?? this.synopsis,
      keywords: keywords ?? this.keywords,
      reactions: reactions ?? this.reactions,
      youtubeId: youtubeId ?? this.youtubeId,
      isAdult: isAdult ?? this.isAdult,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      popularity: popularity ?? this.popularity,
      hitsCount: hitsCount ?? this.hitsCount,
    );
  }
}
