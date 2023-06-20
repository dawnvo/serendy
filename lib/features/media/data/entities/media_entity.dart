import 'package:serendy/core/enums.dart';
import 'package:serendy/core/network/serializable.dart';

part 'media_entity.g.dart';

/// - type: collection
/// - name: medias
/// - key: ulid
@jsonSerializable
final class MediaEntity {
  MediaEntity({
    required this.id,
    required this.type,
    required this.status,
    required this.title,
    required this.image,
    required this.isAdult,
    this.synopsis,
    this.startDate,
    this.endDate,
    final List<String>? keywords,
  }) : keywords = keywords ?? [];

  final String id;
  final MediaType type;
  final MediaStatus status;
  final String title;
  final String image;
  final String? synopsis;
  final List<String> keywords;
  final bool isAdult;

  @TimestampConverter()
  final DateTime? startDate;
  @TimestampConverter()
  final DateTime? endDate;

  factory MediaEntity.fromJson(Map<String, dynamic> json) =>
      _$MediaEntityFromJson(json);
  Map<String, dynamic> toJson() => _$MediaEntityToJson(this);
}
