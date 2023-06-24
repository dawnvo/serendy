import 'package:serendy/src/core/enums.dart';
import 'package:serendy/src/core/infrastructure/serializable.dart';
import 'package:serendy/src/features/user/user.dart';

part 'evaluation_entity.g.dart';

/// - type: collection
/// - name: evaluations
/// - key: ulid
@jsonSerializable
final class EvaluationEntity {
  const EvaluationEntity({
    required this.id,
    required this.userId,
    required this.emotion,
    required this.media,
    required this.private,
    required this.createdAt,
    required this.updatedAt,
    this.removedAt,
  });

  final String id;
  final UserID userId;
  final Emotion emotion;
  final MediaInfoEntity media;
  final bool private;

  @TimestampConverter()
  final DateTime createdAt;
  @TimestampConverter()
  final DateTime updatedAt;
  @TimestampConverter()
  final DateTime? removedAt;

  factory EvaluationEntity.fromJson(Map<String, dynamic> json) =>
      _$EvaluationEntityFromJson(json);
  Map<String, dynamic> toJson() => _$EvaluationEntityToJson(this);
}

/// - type: embedded
/// - name: media
@jsonSerializable
final class MediaInfoEntity {
  const MediaInfoEntity({
    required this.id,
    required this.title,
    required this.image,
  });

  final String id;
  final String title;
  final String image;

  factory MediaInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$MediaInfoEntityFromJson(json);
  Map<String, dynamic> toJson() => _$MediaInfoEntityToJson(this);
}
