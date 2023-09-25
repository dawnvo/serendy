import 'package:json_annotation/json_annotation.dart';
import 'package:serendy/src/core/types.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/src/core/enums.dart';

part 'media.g.dart';

typedef MediaID = String;

//AggregateRoot
@JsonSerializable()
final class Media extends Equatable {
  final MediaID id;

  // * 대분류
  final MediaType type;

  // * 방영 상태
  final MediaStatus status;

  // * 제목
  final String title;

  // * 사진
  final String image;

  // * 줄거리
  final String? synopsis;

  // * 키워드
  final List<String> keywords;

  // * 예고편 주소
  final List<String?> youtubeId;

  // * 민감한 콘텐츠
  final bool isAdult;

  // * 방영 시작 날짜
  final DateTime? startDate;

  // * 방영 종료 날짜
  final DateTime? endDate;

  const Media({
    required this.id,
    required this.type,
    required this.status,
    required this.title,
    required this.image,
    required this.keywords,
    this.synopsis,
    this.startDate,
    this.endDate,
    final bool? isAdult,
    final List<String?>? youtubeId,
  })  : isAdult = isAdult ?? false,
        youtubeId = youtubeId ?? const [];

  @override
  List<Object?> get props => [
        id,
        type,
        status,
        title,
        image,
        synopsis,
        keywords,
        youtubeId,
        startDate,
        endDate,
      ];

  factory Media.fromJson(Json json) => _$MediaFromJson(json);
  Json toJson() => _$MediaToJson(this);
}

extension MediaX on Media {
  Media copy({
    final MediaID? id,
    final MediaType? type,
    final MediaStatus? status,
    final String? title,
    final String? image,
    final String? synopsis,
    final List<String>? keywords,
    final List<String?>? youtubeId,
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
      synopsis: synopsis ?? this.synopsis,
      youtubeId: youtubeId ?? this.youtubeId,
      isAdult: isAdult ?? this.isAdult,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }
}
