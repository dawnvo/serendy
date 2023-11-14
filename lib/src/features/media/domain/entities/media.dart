import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:ulid/ulid.dart';
import 'package:equatable/equatable.dart';

part 'media_external.dart';
part 'media_reaction.dart';

//identity
typedef MediaID = String;

//enums
enum MediaType {
  tv,
  movie,
  ova,
  ona,
  special,
  music,
}

enum MediaStatus {
  /* 방영 종료 */ finished,
  /* 방영 진행 */ releasing,
  /* 방영 예정 */ upcoming,
  /* 방영 취소 */ cancelled,
  /* 방영 휴재 */ hiatus,
}

//aggregate-root
final class Media extends Equatable {
  final MediaID id;

  /// 대분류
  final MediaType type;

  /// 방영 상태
  final MediaStatus status;

  /// 민감한 콘텐츠
  final bool adult;

  /// 제목
  final String title;

  /// 개요
  final String? overview;

  /// 이미지
  final String image;

  /// 썸네일
  final String thumbnail;

  // * 색상
  final String? color;

  /// 키워드
  final List<String> keywords;

  /// 방영 시작일
  final DateTime? startDate;

  /// 방영 종료일
  final DateTime? endDate;

  /// 트레일러
  final String? trailer;

  /// 제작사
  final List<String?> productions;

  /// 외부 주소
  final List<MediaExternal?> externals;

  /// 반응 목록
  final List<MediaReaction?> reactions;

  /// 인기도
  final double popularity;

  /// 조회수
  final int hitsCount;

  Media({
    required this.type,
    required this.status,
    required this.title,
    required this.image,
    required this.thumbnail,
    required this.keywords,
    this.overview,
    this.color,
    this.startDate,
    this.endDate,
    this.trailer,
    final String? id,
    final bool? adult,
    final List<String?>? productions,
    final List<MediaExternal?>? externals,
    final List<MediaReaction?>? reactions,
    final double? popularity,
    final int? hitsCount,
  })  : id = id ?? Ulid().toCanonical(),
        adult = adult ?? false,
        productions = productions ?? const [],
        externals = externals ?? const [],
        reactions = reactions ?? const [],
        popularity = popularity ?? 0.0,
        hitsCount = hitsCount ?? 0;

  @override
  List<Object?> get props => [id];
}

extension MediaX on Media {
  /// 미디어 복사
  Media copy({
    final MediaID? id,
    final MediaType? type,
    final MediaStatus? status,
    final bool? adult,
    final String? title,
    final String? overview,
    final String? image,
    final String? thumbnail,
    final String? color,
    final List<String>? keywords,
    final DateTime? startDate,
    final DateTime? endDate,
    final String? trailer,
    final List<String?>? productions,
    final List<MediaExternal?>? externals,
    final List<MediaReaction?>? reactions,
    final double? popularity,
    final int? hitsCount,
  }) {
    return Media(
      id: id ?? this.id,
      type: type ?? this.type,
      status: status ?? this.status,
      adult: adult ?? this.adult,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      image: image ?? this.image,
      thumbnail: thumbnail ?? this.thumbnail,
      color: color ?? this.color,
      keywords: keywords ?? this.keywords,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      trailer: trailer ?? this.trailer,
      productions: productions ?? this.productions,
      externals: externals ?? this.externals,
      reactions: reactions ?? this.reactions,
      popularity: popularity ?? this.popularity,
      hitsCount: hitsCount ?? this.hitsCount,
    );
  }
}
