import 'package:serendy/src/core/enums.dart';
import 'package:serendy/src/core/infrastructure/serializable.dart';

part 'media_model.g.dart';

@jsonSerializable
final class MediaModel {
  MediaModel({
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
    final List<String?>? youtubeId,
  })  : keywords = keywords ?? [],
        youtubeId = youtubeId ?? [];

  final String id;
  final MediaType type;
  final MediaStatus status;
  final String title;
  final String image;
  final String? synopsis;
  final List<String> keywords;
  final List<String?> youtubeId;
  final bool isAdult;
  final String? startDate;
  final String? endDate;

  factory MediaModel.fromJson(Map<String, dynamic> json) =>
      _$MediaModelFromJson(json);
  Map<String, dynamic> toJson() => _$MediaModelToJson(this);
}
