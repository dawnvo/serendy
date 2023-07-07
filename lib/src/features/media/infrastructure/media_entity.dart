import 'package:serendy/src/core/enums.dart';
import 'package:serendy/src/core/infrastructure/serializable.dart';

part 'media_entity.g.dart';

@jsonSerializable
final class MediaEntity {
  MediaEntity({
    required this.id,
    required this.type,
    required this.status,
    required this.title,
    required this.image,
    required this.images,
    required this.isAdult,
    this.synopsis,
    this.startDate,
    this.endDate,
    final List<String>? keywords,
    final List<String?>? youtubeId,
  })  : keywords = keywords ?? [],
        youtubeId = youtubeId ?? [];

  final String id;
  final MediaType type;
  final MediaStatus status;
  final String title;
  final String image;
  final MediaImagesEntity? images;
  final String? synopsis;
  final List<String> keywords;
  final List<String?> youtubeId;
  final bool isAdult;
  final String? startDate;
  final String? endDate;

  factory MediaEntity.fromJson(Map<String, dynamic> json) =>
      _$MediaEntityFromJson(json);
  Map<String, dynamic> toJson() => _$MediaEntityToJson(this);
}

@jsonSerializable
final class MediaImagesEntity {
  const MediaImagesEntity({
    required this.jpg,
    required this.webp,
  });

  final MediaImageUrlEntity jpg;
  final MediaImageUrlEntity webp;

  factory MediaImagesEntity.fromJson(Map<String, dynamic> json) =>
      _$MediaImagesEntityFromJson(json);
  Map<String, dynamic> toJson() => _$MediaImagesEntityToJson(this);
}

@jsonSerializable
final class MediaImageUrlEntity {
  const MediaImageUrlEntity({
    required this.imageUrl,
    required this.largeImageUrl,
    required this.smallImageUrl,
  });

  final String imageUrl;
  final String largeImageUrl;
  final String smallImageUrl;

  factory MediaImageUrlEntity.fromJson(Map<String, dynamic> json) =>
      _$MediaImageUrlEntityFromJson(json);
  Map<String, dynamic> toJson() => _$MediaImageUrlEntityToJson(this);
}
