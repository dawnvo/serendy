import 'package:serendy/src/core/enums.dart';
import 'package:serendy/src/core/infrastructure/serializable.dart';
import 'package:serendy/src/features/user/user.dart';

part 'evaluation_entity.g.dart';

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
  final EvaluationMediaEntity media;
  final bool private;

  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? removedAt;

  factory EvaluationEntity.fromJson(Map<String, dynamic> json) =>
      _$EvaluationEntityFromJson(json);
  Map<String, dynamic> toJson() => _$EvaluationEntityToJson(this);
}

@jsonSerializable
final class EvaluationMediaEntity {
  const EvaluationMediaEntity({
    required this.id,
    required this.title,
    required this.image,
  });

  final String id;
  final String title;
  final String image;

  factory EvaluationMediaEntity.fromJson(Map<String, dynamic> json) =>
      _$EvaluationMediaEntityFromJson(json);
  Map<String, dynamic> toJson() => _$EvaluationMediaEntityToJson(this);
}
